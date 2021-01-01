import 'package:flutter/material.dart';
import 'package:models/cff/cff_completion.dart';
import 'package:swift_travel/widgets/cff_icon.dart';

class SuggestedTile extends StatelessWidget {
  const SuggestedTile(
    this.suggestion, {
    Key key,
  }) : super(key: key);
  final CffCompletion suggestion;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CffIcon.fromIconClass(suggestion.iconclass, size: 16),
      title: Text(suggestion.favoriteName ?? suggestion.label),
      subtitle: suggestion.favoriteName != null ? Text(suggestion.label) : null,
      trailing: suggestion.favoriteName != null ? const Text('⭐') : null,
      dense: true,
    );
  }
}
