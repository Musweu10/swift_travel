// Copyright (c) 2017, Spencer. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

typedef AppBarCallback = AppBar Function(BuildContext context);
typedef TextFieldSubmitCallback = void Function(String value);
typedef TextFieldChangeCallback = void Function(String value);
typedef SetStateCallback = void Function(void Function());

class SearchBar {
  SearchBar({
    required this.setState,
    required this.buildDefaultAppBar,
    this.onSubmitted,
    this.controller,
    this.hintText = 'Search',
    this.inBar = true,
    this.closeOnSubmit = true,
    this.clearOnSubmit = true,
    this.showClearButton = true,
    this.onChanged,
    this.onClosed,
    this.onCleared,
  }) {
    controller ??= TextEditingController();

    // Don't waste resources on listeners for the text controller if the dev
    // doesn't want a clear button anyways in the search bar
    if (!showClearButton) {
      return;
    }

    controller!.addListener(() {
      if (controller!.text.isEmpty) {
        // If clear is already disabled, don't disable it
        if (_clearActive) {
          setState(() {
            _clearActive = false;
          });
        }

        return;
      }

      // If clear is already enabled, don't enable it
      if (!_clearActive) {
        setState(() {
          _clearActive = true;
        });
      }
    });
  }

  /// Whether the search should take place "in the existing search bar", meaning whether it has the same background or a flipped one. Defaults to true.
  final bool inBar;

  /// Whether or not the search bar should close on submit. Defaults to true.
  final bool closeOnSubmit;

  /// Whether the text field should be cleared when it is submitted
  final bool clearOnSubmit;

  /// A callback which should return an AppBar that is displayed until search is started. One of the actions in this AppBar should be a search button which you obtain from SearchBar.getSearchAction(). This will be called every time search is ended, etc. (like a build method on a widget)
  final AppBarCallback buildDefaultAppBar;

  /// A void callback which takes a string as an argument, this is fired every time the search is submitted. Do what you want with the result.
  final TextFieldSubmitCallback? onSubmitted;

  /// A void callback which gets fired on close button press.
  final VoidCallback? onClosed;

  /// A callback which is fired when clear button is pressed.
  final VoidCallback? onCleared;

  /// Since this should be inside of a State class, just pass setState to this.
  final SetStateCallback setState;

  /// Whether or not the search bar should add a clear input button, defaults to true.
  final bool showClearButton;

  /// What the hintText on the search bar should be. Defaults to 'Search'.
  final String hintText;

  /// Whether search is currently active.
  final ValueNotifier<bool> isSearching = ValueNotifier(false);

  /// A callback which is invoked each time the text field's value changes
  final TextFieldChangeCallback? onChanged;

  /// The controller to be used in the textField.
  TextEditingController? controller;

  /// Whether the clear button should be active (fully colored) or inactive (greyed out)
  bool _clearActive = false;

  /// The last built default AppBar used for colors and such.
  AppBar? _defaultAppBar;

  /// Initializes the search bar.
  ///
  /// This adds a route that listens for onRemove (and stops the search when that happens), and then calls [setState] to rebuild and start the search.
  void beginSearch(BuildContext context) {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {
      setState(() {
        isSearching.value = false;
      });
    }));

    setState(() {
      isSearching.value = true;
    });
  }

  /// Builds, saves and returns the default app bar.
  ///
  /// This calls the [buildDefaultAppBar] provided in the constructor, and saves it to [_defaultAppBar].
  AppBar buildAppBar(BuildContext context) {
    return _defaultAppBar = buildDefaultAppBar(context);
  }

  /// Builds the search bar!
  ///
  /// The leading will always be a back button.
  /// backgroundColor is determined by the value of inBar
  /// title is always a [TextField] with the key 'SearchBarTextField', and various text stylings based on [inBar]. This is also where [onSubmitted] has its listener registered.
  ///
  AppBar buildSearchBar(BuildContext context) {
    final theme = Theme.of(context);
    final buttonColor = inBar ? null : theme.iconTheme.color;

    return AppBar(
      leading: IconButton(
          icon: const BackButtonIcon(),
          color: buttonColor,
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          onPressed: () {
            onClosed?.call();
            controller!.clear();
            Navigator.maybePop(context);
          }),
      backgroundColor: inBar ? null : theme.canvasColor,
      title: Directionality(
        textDirection: Directionality.of(context),
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: inBar
                  ? null
                  : TextStyle(
                      color: theme.textTheme.headline4!.color,
                    ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              border: InputBorder.none),
          onChanged: onChanged,
          onSubmitted: (val) async {
            if (closeOnSubmit) {
              await Navigator.maybePop(context);
            }

            if (clearOnSubmit) {
              controller!.clear();
            }
            onSubmitted?.call(val);
          },
          autofocus: true,
          controller: controller,
        ),
      ),
      actions: !showClearButton
          ? null
          : <Widget>[
              // Show an icon if clear is not active, so there's no ripple on tap
              IconButton(
                  icon: const Icon(Icons.clear),
                  color: inBar ? null : buttonColor,
                  disabledColor: inBar ? null : theme.disabledColor,
                  onPressed: !_clearActive
                      ? null
                      : () {
                          onCleared?.call();
                          controller!.clear();
                        }),
            ],
    );
  }

  /// Returns an [IconButton] suitable for an Action
  ///
  /// Put this inside your [buildDefaultAppBar] method!
  IconButton getSearchAction(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          beginSearch(context);
        });
  }

  /// Returns an AppBar based on the value of [isSearching]
  AppBar build(BuildContext context) {
    return isSearching.value ? buildSearchBar(context) : buildAppBar(context);
  }
}