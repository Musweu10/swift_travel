import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/settings/properties/property.dart';
import 'package:swift_travel/settings/settings.dart';
import 'package:swift_travel/widgets/listener.dart';
import 'package:theming/dialogs/choice.dart';
import 'package:theming/responsive.dart';

mixin WithLeading {
  Widget? get leading;
}

class TileBorders {
  final bool top;
  final bool bottom;

  const TileBorders({this.top = false, this.bottom = false});

  static const none = TileBorders();
  static const all = TileBorders(top: true, bottom: true);
}

typedef BuildVoidCallback = VoidCallback Function(BuildContext context);

class SwiftSettingsTile extends StatelessWidget with WithLeading {
  const SwiftSettingsTile({
    Key? key,
    required this.title,
    required this.leading,
    this.subtitle,
    this.onTap,
    this.showChevron = true,
    this.tileBorders = TileBorders.none,
  }) : super(key: key);

  final Widget title;
  @override
  final Widget leading;
  final Widget? subtitle;
  final VoidCallback? onTap;
  final bool showChevron;
  final TileBorders tileBorders;

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(16);
    final theme = Theme.of(context);
    final isDarwin = theme.platform.isDarwin;
    final subtitleColor = theme.textTheme.caption?.color;
    return Material(
      color: Colors.transparent,
      child: Theme(
        data: Theme.of(context).copyWith(splashFactory: NoSplash.splashFactory),
        child: ListTile(
          horizontalTitleGap: 0,
          title: title,
          leading: leading,
          subtitle: isDarwin ? null : subtitle,
          onTap: onTap,
          tileColor: isDarwin
              ? SettingsColor.tile.resolveFrom(context)
              : Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            top: tileBorders.top ? radius : Radius.zero,
            bottom: tileBorders.bottom ? radius : Radius.zero,
          )),
          trailing: isDarwin
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      if (subtitle != null)
                        SizedBox(
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.zero,
                              child: ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 100),
                                child: DefaultTextStyle(
                                  style: theme.textTheme.subtitle1!
                                      .copyWith(color: subtitleColor),
                                  softWrap: false,
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.fade,
                                  child: subtitle!,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (showChevron)
                        Icon(CupertinoIcons.chevron_forward,
                            color: subtitleColor)
                    ])
              : null,
        ),
      ),
    );
  }
}

class SwiftSettingsPropertyTile<T> extends StatelessWidget with WithLeading {
  const SwiftSettingsPropertyTile({
    Key? key,
    required this.title,
    required this.leading,
    required this.property,
    this.subtitle,
    this.onTap,
    this.showChevron = true,
    this.tileBorders = TileBorders.none,
    this.valueBuilder = _valueBuilder,
    required this.options,
  }) : super(key: key);

  final Widget title;
  @override
  final Widget leading;
  final Widget? subtitle;
  final VoidCallback? onTap;
  final bool showChevron;
  final TileBorders tileBorders;
  final Property<T> property;
  final Widget Function(BuildContext context, T value) valueBuilder;

  final List<ValueOption<T>> options;

  @override
  Widget build(BuildContext context) {
    return SwiftSettingsTile(
      leading: leading,
      title: title,
      subtitle: ListenableBuilder<Property<T>>(
        builder: (context, p, _) => valueBuilder(context, p.value),
        listenable: property,
      ),
      onTap: () => switchValue(context),
      showChevron: showChevron,
      tileBorders: tileBorders,
    );
  }

  Future<void> switchValue(BuildContext context) async {
    final c = await choose<T>(
      context,
      options: options,
      title: title,
      value: property.value,
    );

    final value = c.value;
    if (value != null) {
      property.setValue(value);
    }
  }

  static Widget _valueBuilder(BuildContext _, dynamic val) =>
      Text(val.toString());
}
