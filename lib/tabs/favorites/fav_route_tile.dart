import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/models/local_route.dart';
import 'package:swift_travel/utils/string_utils/string_utils.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:swift_travel/widgets/route_widget.dart';
import 'package:theming/dialogs/confirmation_alert.dart';

class FavoriteRouteTile extends StatelessWidget {
  const FavoriteRouteTile(this.route, {Key? key}) : super(key: key);

  final LocalRoute route;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: AppLoc.of(context).delete,
          color: Colors.red,
          icon: CupertinoIcons.delete,
          onTap: () => deleteRoute(context),
        ),
      ],
      child: RouteWidget(
        icon: const Text('🛣', style: TextStyle(fontSize: 32)),
        title: Text(route.displayName!),
        from: Text(route.from.stripAt()),
        to: Text(route.to.stripAt()),
        onLongPress: () => more(context),
        trailing: const Icon(CupertinoIcons.chevron_forward),
        onTap: () => Navigator.of(context).pushNamed('/route', arguments: route),
      ),
    );
  }

  void more(BuildContext context) {
    showActionSheet(
      context,
      [
        ActionsSheetAction(
          onPressed: () => deleteRoute(context),
          title: Text(AppLoc.of(context).delete),
          icon: const Icon(CupertinoIcons.delete),
          isDestructive: true,
        ),
      ],
      cancel: ActionsSheetAction(
        title: Text(AppLoc.of(context).cancel),
        icon: const Icon(CupertinoIcons.xmark),
      ),
    );
  }

  Future<void> deleteRoute(BuildContext context) async {
    final b = await confirm(
      context,
      title: Text.rich(TextSpan(text: 'Delete ', children: [
        TextSpan(text: route.displayName, style: const TextStyle(fontWeight: FontWeight.bold)),
        const TextSpan(text: ' ?'),
      ])),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLoc.of(context).from,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            route.from,
            textAlign: TextAlign.center,
          ),
          Text(
            AppLoc.of(context).to,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            route.to,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      confirm: Text(AppLoc.of(context).yes),
      cancel: Text(AppLoc.of(context).no),
      isConfirmDestructive: true,
    );
    if (!b) return;
    return context.read(storeProvider).removeRoute(route);
  }
}
