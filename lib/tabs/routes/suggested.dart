import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/apis/search.ch/models/completion.dart';
import 'package:swift_travel/widgets/cff_icon.dart';

class SuggestedTile extends StatelessWidget {
  const SuggestedTile(
    this.suggestion, {
    Key? key,
  }) : super(key: key);
  final NavCompletion? suggestion;

  const SuggestedTile.empty() : suggestion = null;

  Widget? buildIcon(BuildContext context) {
    switch (suggestion!.origin) {
      case DataOrigin.favorites:
        return const Icon(CupertinoIcons.heart_fill, size: 20);
      case DataOrigin.history:
        return const Icon(CupertinoIcons.clock, size: 20);
      case DataOrigin.data:
        return CffIcon.fromIconClass(suggestion!.icon, size: 20);
      case DataOrigin.currentLocation:
        return const Icon(FluentIcons.my_location_24_regular, size: 20);
      case DataOrigin.prediction:
        return const Icon(FluentIcons.magic_wand_20_regular, size: 20);
    }
  }

  @override
  Widget build(BuildContext context) {
    return suggestion == null
        ? const ListTile(
            leading: SizedBox(
              height: 24,
              width: 24,
              child: DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
            ),
            title: SizedBox(
              width: double.infinity,
              height: 16,
              child: DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
            ),
            horizontalTitleGap: 0,
            dense: true,
          )
        : ListTile(
            leading: buildIcon(context),
            title: Text(suggestion!.favoriteName ?? suggestion!.label),
            subtitle: suggestion!.favoriteName != null ? Text(suggestion!.label) : null,
            trailing: suggestion!.favoriteName != null ? const Text('⭐') : null,
            horizontalTitleGap: 0,
            dense: true,
            tileColor: Colors.transparent,
          );
  }
}
