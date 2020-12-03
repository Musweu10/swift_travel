import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/apis/cff/models/cff_route.dart';
import 'package:swift_travel/apis/cff/models/leg.dart';
import 'package:swift_travel/apis/cff/models/route_connection.dart';
import 'package:swift_travel/apis/cff/models/types_enum.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/live_route/live_route.dart';
import 'package:swift_travel/tabs/routes/details/tiles/arrived_tile.dart';
import 'package:swift_travel/tabs/routes/details/tiles/regular_leg_tile.dart';
import 'package:swift_travel/tabs/routes/details/tiles/walking_tile.dart';
import 'package:swift_travel/utils/format.dart';
import 'package:swift_travel/utils/share.dart';
import 'package:vibration/vibration.dart';

class RouteDetails extends StatelessWidget {
  final CffRoute route;
  final int i;

  const RouteDetails({
    Key key,
    @required this.route,
    @required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = route.connections[i];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => openLive(context, c),
        child: const Icon(Icons.play_arrow),
      ),
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(c.to),
        actions: [
          if (isMobile)
            IconButton(
                icon: Theme.of(context).platform == TargetPlatform.iOS
                    ? const Icon(CupertinoIcons.share)
                    : const Icon(Icons.share),
                onPressed: () => _shareRoute(context))
        ],
      ),
      body: Column(
        children: <Widget>[
          _dataRow("Departure", c.from),
          _dataRow("Arrival", c.to),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text("Travel duration"),
                const SizedBox(width: 8),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                                text: "${Format.time(c.departure)} - ${Format.time(c.arrival)}",
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: " (${Format.intToDuration(c.duration.round())})")
                          ]),
                          textAlign: TextAlign.end,
                        )))
              ],
            ),
          ),
          const Divider(thickness: 2, height: 4),
          Expanded(
            child: ListView.builder(
              itemCount: c.legs.length,
              itemBuilder: (context, i) {
                final Leg l = c.legs[i];
                return LegTile(l: l);
              },
            ),
          )
        ],
      ),
    );
  }

  void _shareRoute(BuildContext context) {
    Vibration.select();
    shareRoute(route, i);
  }

  void openLive(BuildContext context, RouteConnection c) {
    Vibration.select();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LiveRoutePage(connection: c),
      ),
    );
  }

  void base64Experiment() {
    final connection = route.connections[i];
    final json = connection.toJson().toString();
    log(json);
    final bytes = ascii.encode(json);
    final compressed = zlib.encode(bytes);
    final compressed64 = base64.encode(compressed);
    final raw64 = base64.encode(bytes);
    log("compresssed : ${compressed64.length}, raw : ${raw64.length}");
    log(compressed64);
  }

  Widget _dataRow(String key, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(key),
          const SizedBox(width: 8),
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    text,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  )))
        ],
      ),
    );
  }
}

class LegTile extends StatelessWidget {
  const LegTile({
    Key key,
    @required this.l,
  }) : super(key: key);

  final Leg l;

  @override
  Widget build(BuildContext context) => l.exit == null
      ? ArrivedTile(l: l)
      : l.type == Vehicle.walk
          ? WalkingTile(l: l)
          : RegularLegTile(l: l);
}
