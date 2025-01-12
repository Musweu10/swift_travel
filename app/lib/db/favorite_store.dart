// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:swift_travel/db/db.dart';
import 'package:swift_travel/logic/quick_actions.dart';
import 'package:swift_travel/models/favorites.dart';

final favoritesStoreProvider =
    ChangeNotifierProvider<BaseFavoritesStore>(HiveFavoritesStore.new);

class HiveFavoritesStore extends BaseFavoritesStore {
  final favoritesDb = FavoritesDatabase();

  final log = Logger.of('HiveFavoritesStore');

  final ChangeNotifierProviderRef<BaseFavoritesStore> ref;

  HiveFavoritesStore(this.ref);

  @override
  Future<DataWithId<LocalRoute>> addRoute(LocalRoute route) async {
    final id = newUuid();
    await favoritesDb.put(id, QuickActionsItem.route(route, id: id));
    notifyListeners();
    return DataWithId(id, route);
  }

  static final random = math.Random();

  // must be always positive and in range [0xF,  0xFFFFFFFF]
  static int newUuid() {
    final i = DateTime.now().millisecondsSinceEpoch ^
        (random.nextInt(0xFFFFFFFF - 0xF) + 0xF);
    return (i | 0xf) & 0xFFFFFFFF;
  }

  @override
  Future<DataWithId<FavoriteStop>> addStop(FavoriteStop stop) async {
    final id = newUuid();
    await favoritesDb.put(id, QuickActionsItem.stop(stop, id: id));
    notifyListeners();
    return DataWithId(id, stop);
  }

  @override
  Future<void> init() async {
    await favoritesDb.open(doLog: true);
    notifyListeners();
  }

  @override
  Future<void> removeRoute(DataWithId<LocalRoute> route) async {
    await favoritesDb.delete(route.id);
    await ref.read(quickActionsManagerProvider).setQuickActions(items.toList());
    notifyListeners();
  }

  @override
  Future<void> removeStop(DataWithId<FavoriteStop> favoriteStop) async {
    await favoritesDb.delete(favoriteStop.id);
    await ref.read(quickActionsManagerProvider).setQuickActions(items.toList());
    notifyListeners();
  }

  @override
  Iterable<DataWithId<LocalRoute>> get routes => favoritesDb.values
      .whereType<FavoriteUnionRoute>()
      .map((e) => DataWithId(e.id, e.route));

  @override
  Iterable<DataWithId<FavoriteStop>> get stops => favoritesDb.values
      .whereType<FavoriteUnionStop>()
      .map((e) => DataWithId(e.id, e.stop));

  @override
  Iterable<QuickActionsItem> get items => favoritesDb.values;

  @override
  void dispose() {
    unawaited(favoritesDb.close());
    super.dispose();
  }

  @override
  Future<void> save(List<QuickActionsItem> list) async {
    await favoritesDb.putAll({for (var e in list) e.id: e});
  }
}

abstract class BaseFavoritesStore extends ChangeNotifier {
  Future<void> init();
  Future<DataWithId<FavoriteStop>> addStop(FavoriteStop stop);
  Future<void> removeStop(DataWithId<FavoriteStop> favoriteStop);
  Future<DataWithId<LocalRoute>> addRoute(LocalRoute route);
  Future<void> removeRoute(DataWithId<LocalRoute> route);

  Iterable<DataWithId<LocalRoute>> get routes;
  Iterable<DataWithId<FavoriteStop>> get stops;
  Iterable<QuickActionsItem> get items;

  Future<void> save(List<QuickActionsItem> list);

  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
  }
}

class FavoritesDatabase extends LocalDatabase<int, String, QuickActionsItem> {
  FavoritesDatabase() : this._();

  FavoritesDatabase._()
      : super(
          boxKey: 'favorites',
          maxSize: 0,
          decode: (d) =>
              QuickActionsItem.fromJson(jsonDecode(d) as Map<String, dynamic>),
          encode: (d) => jsonEncode(d.toJson()),
        );

  static final i = FavoritesDatabase();

  List<QuickActionsItem> get items => values.toList(growable: false);

  /// Do nothing.
  @override
  void onDatabaseExceededMaxSize() {}
}
