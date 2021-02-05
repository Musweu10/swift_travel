import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:swift_travel/apis/search.ch/models/cff_route.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/db/database.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/states/route_states.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/routes/route_tile.dart';

import 'apis_test.dart';

class MockFetcher extends FetcherBase {
  RouteStates _state;

  @override
  RouteStates get state => _state;

  @override
  set state(RouteStates state) {
    notifyListeners();
    _state = state;
  }

  @override
  Future<void> fetch(ProviderReference ref) async {
    state = RouteStates.routes(CffRoute.fromJson(mockRoute));
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('route tab', () {
    setUpAll(() async {
      await Hive.initFlutter();
      await RouteHistoryRepository.i.open();
    });
    testWidgets('main widget', (t) async {
      await t.pumpWidget(ProviderScope(
          overrides: [
            navigationAPIProvider.overrideWithValue(MockNavigationApi()),
            fetcherProvider.overrideWithValue(MockFetcher()),
          ],
          child: MaterialApp(
            home: const RoutePage(),
            navigatorKey: navigatorKey,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          )));
      await t.pumpAndSettle();

      final field = find.byKey(const Key('route-first-textfield-key'));
      await t.enterText(field, 'Genève');
      await t.pumpAndSettle();

      final field2 = find.byKey(const Key('route-second-textfield-key'));
      await t.enterText(field2, 'Lausanne');
      await t.pumpAndSettle();

      final tile = find.byType(RouteTile).first;
      final text = find.text('Genève, Cornavin');
      expect(tile, findsOneWidget);
      expect(text, findsOneWidget);

      await t.tap(tile);
      await t.pumpAndSettle();

      expect(find.text('Itinerary'), findsOneWidget);

      navigatorKey.currentState.pop();
      await t.pumpAndSettle();

      expect(tile, findsOneWidget);
      expect(text, findsOneWidget);
    });
  });
}
