import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/cff/models/cff_completion.dart';
import 'package:swift_travel/apis/cff/models/favorite_stop.dart';
import 'package:swift_travel/apis/cff/models/types_enum.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/tabs/stations/stop_details.dart';
import 'package:swift_travel/widget/cff_icon.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';
import 'package:utils/dialogs/choice.dart';
import 'package:utils/dialogs/input_dialog.dart';

enum _Actions { favorite }

class CffCompletionTile extends ConsumerWidget {
  const CffCompletionTile({
    Key key,
    @required this.sugg,
  })  : assert(sugg != null),
        super(key: key);

  final CffCompletion sugg;

  static const _kRadius = BorderRadius.all(Radius.circular(16));
  @override
  Widget build(BuildContext context, Reader watch) {
    final iconClass = sugg.iconclass;
    final isPrivate = CffIcon.isPrivate(iconClass);
    final store = watch(storeProvider) as FavoritesSharedPreferencesStore;
    final favStop = store.favorites.firstWhere((f) => f.stop == sugg.label, orElse: () => null);
    final isFav = favStop != null;
    final targetPlatform = Theme.of(context).platform;
    final isDarwin = targetPlatform == TargetPlatform.iOS || targetPlatform == TargetPlatform.macOS;
    final listTile = ListTile(
      shape: const RoundedRectangleBorder(borderRadius: _kRadius),
      leading: isFav ? const CffIcon(Vehicle.favorite) : CffIcon.fromIconClass(iconClass),
      title: Text((isFav ? (sugg.favoriteName ?? favStop.name) : sugg.label) ?? "???"),
      subtitle: isFav
          ? Text(favStop.stop ?? sugg.label ?? "Favorite")
          : sugg.dist != null
              ? Text("${sugg.dist.round()}m")
              : null,
      onLongPress:
          isDarwin ? null : () => more(context, isFav: isFav, favoriteStop: favStop, store: store),
      trailing: isPrivate
          ? IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () => more(context, favoriteStop: favStop, isFav: isFav, store: store))
          : const Icon(Icons.arrow_forward_ios),
      onTap: isPrivate
          ? null
          : () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DetailsStop(stopName: sugg.label),
                ),
              );
            },
    );
    final child = isDarwin
        ? CupertinoContextMenu(
            actions: [
              CupertinoContextMenuAction(
                trailingIcon: isFav ? FontAwesomeIcons.star : FontAwesomeIcons.solidStar,
                onPressed: () => Navigator.pop(context),
                child: isFav ? const Text("Remove from favorites") : const Text("Add to favorites"),
              ),
              CupertinoContextMenuAction(
                trailingIcon: CupertinoIcons.xmark,
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancel"),
              ),
            ],
            child: Material(
              borderRadius: _kRadius,
              child: listTile,
            ),
          )
        : listTile;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [DynamicTheme.shadowOf(context).buttonShadow],
          color: Theme.of(context).cardColor,
          borderRadius: _kRadius,
        ),
        child: child,
      ),
    );
  }

  Future<void> more(
    BuildContext context, {
    @required bool isFav,
    @required FavoriteStop favoriteStop,
    @required FavoritesSharedPreferencesStore store,
  }) async {
    final c = await choose<_Actions>(context,
        choices: [
          Choice(
            value: _Actions.favorite,
            child: isFav ? const Text("Remove from favorites") : const Text("Add to favorites"),
          ),
        ],
        title: const Text("Choose an action"),
        cancel: const Choice.cancel(child: Text("Cancel")));
    switch (c.value) {
      case _Actions.favorite:
        await deleteOrAddToFav(context, isFav: isFav, favoriteStop: favoriteStop, store: store);
        break;
    }
  }

  Future deleteOrAddToFav(
    BuildContext context, {
    @required bool isFav,
    @required FavoriteStop favoriteStop,
    @required FavoritesSharedPreferencesStore store,
  }) async {
    if (isFav) {
      store.deleteFavorite(favoriteStop);
    } else {
      final name = await input(context, title: const Text("What is the name of this stop"));
      if (name == null) return;
      store.addFavorite(sugg.toFavoriteStop(name: name));
    }
  }
}
