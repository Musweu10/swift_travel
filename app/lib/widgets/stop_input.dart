import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/search/search.dart';
import 'package:swift_travel/prediction/models/models.dart';
import 'package:swift_travel/states/station_states.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/vehicle_icon.dart';

class StopInputDialog extends ConsumerStatefulWidget {
  const StopInputDialog({
    super.key,
    this.title = '',
    this.inputType = TextInputType.text,
  });

  final String title;
  final TextInputType inputType;

  @override
  _StopInputDialogState createState() => _StopInputDialogState();
}

final _stateProvider =
    StateProvider<StationStates>((_) => const StationStates.empty());

class _StopInputDialogState extends ConsumerState<StopInputDialog> {
  final node = FocusNode();
  final debouncer = Debouncer();

  @override
  void initState() {
    super.initState();
    node.requestFocus();
  }

  @override
  void dispose() {
    node.dispose();
    debouncer.dispose();
    FocusManager.instance.primaryFocus?.unfocus();
    super.dispose();
  }

  Future<void> fetch(String query) async {
    final api = ref.read(navigationAPIProvider);
    try {
      final compls = await api.complete(query);

      if (mounted) {
        ref.read(_stateProvider.notifier).state =
            StationStates.completions(compls.map(Completion.fromApi).toList());
      }
    } on SocketException {
      ref.read(_stateProvider.notifier).state = const StationStates.network();
    } on Exception catch (e, s) {
      reportDartError(e, s, library: 'search', context: 'while fetching');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      cupertinoBuilder: (context, child) => CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        navigationBar: SwiftCupertinoBar(middle: Text(widget.title)),
        child: SafeArea(child: child!),
      ),
      materialBuilder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(leading: const CloseButton(), title: Text(widget.title)),
        body: child,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              onSubmitted: (_) => submit(),
              focusNode: node,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context).search_station),
              onChanged: (s) => unawaited(debouncer.debounce(() => fetch(s))),
            ),
          ),
          Expanded(
            child: Consumer(builder: (context, w, _) {
              final s = w.watch(_stateProvider);
              return s.maybeWhen(
                completions: (c) => ListView.builder(
                  itemBuilder: (context, i) => RouteCompletionTile(
                    c[i],
                    onTap: () {
                      Navigator.of(context).pop<Completion>(c[i]);
                      node.unfocus();
                    },
                  ),
                  itemCount: c.length,
                ),
                orElse: () => const SizedBox(),
              );
            }),
          )
        ],
      ),
    );
  }

  void submit() {
    // TODO: implement submit
  }
}

class RouteCompletionTile extends StatelessWidget {
  const RouteCompletionTile(
    this.completion, {
    super.key,
    this.onTap,
  });

  const RouteCompletionTile.empty({
    super.key,
    this.onTap,
  }) : completion = null;

  final Completion? completion;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => completion == null
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
          leading: _Icon(completion!),
          title: Text(completion!.displayName ?? completion!.label),
          subtitle:
              completion!.displayName != null ? Text(completion!.label) : null,
          trailing: completion!.origin == DataOrigin.favorites
              ? const Text('⭐')
              : null,
          horizontalTitleGap: 0,
          dense: true,
          tileColor: Colors.transparent,
          onTap: onTap,
        );
}

class _Icon extends StatelessWidget {
  const _Icon(this.completion);

  final Completion completion;

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: const IconThemeData(size: 20),
      child: () {
        switch (completion.origin) {
          case DataOrigin.favorites:
            return const Icon(CupertinoIcons.heart_fill);
          case DataOrigin.history:
            return const Icon(CupertinoIcons.clock);
          case DataOrigin.api:
            return completion.iconBuilder?.call(context) ??
                LocationTypeIcon(completion.type);
          case DataOrigin.currentLocation:
            return const Icon(CupertinoIcons.location_fill);
          case DataOrigin.prediction:
            return const Icon(CupertinoIcons.wand_stars);
          case DataOrigin.loading:
            return const SizedBox(
              height: 20,
              width: 20,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black),
              ),
            );
          case DataOrigin.contacts:
            return const Icon(CupertinoIcons.person);
        }
      }(),
    );
  }
}
