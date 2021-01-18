import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/cff/models/cff_stationboard.dart';
import 'package:swift_travel/apis/cff/models/favorite_stop.dart';
import 'package:swift_travel/apis/cff/models/stationboard_connection.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/utils/format.dart';
import 'package:swift_travel/widgets/cff_icon.dart';
import 'package:swift_travel/widgets/line_icon.dart';

class StopDetails extends StatefulWidget {
  final String stopName;

  const StopDetails({Key key, @required this.stopName}) : super(key: key);

  @override
  _StopDetailsState createState() => _StopDetailsState();
}

class _StopDetailsState extends State<StopDetails> {
  CffStationboard data;

  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 15), (_) => setState(() {}));
    reloadData();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: Text(widget.stopName),
          actions: [
            IconButton(
                icon: const Icon(FontAwesomeIcons.route),
                onPressed: () {
                  log(data.toString());
                  Navigator.of(context, rootNavigator: true).pushNamed("/route",
                      arguments: FavoriteStop(data.stop?.name ?? data.stopName,
                          name: data.stop?.name ?? data.stopName));
                })
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => reloadData(),
          child: data != null
              ? data.messages.isEmpty
                  ? ListView.separated(
                      separatorBuilder: (c, i) => const Divider(height: 0, thickness: 1),
                      itemCount: data.connections.length,
                      itemBuilder: (context, i) => ConnectionTile(c: data.connections[i]),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '😕',
                              style: TextStyle(fontSize: 64),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              data.messages.isNotEmpty
                                  ? data.messages.join("\n")
                                  : "We couldn't find any departures from this location",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    )
              : const Center(child: CircularProgressIndicator()),
        ));
  }

  Future<void> reloadData() async {
    final stationBoard = await context.read(navigationAPIProvider).stationboard(widget.stopName);
    if (mounted) setState(() => data = stationBoard);
  }
}

class ConnectionTile extends StatelessWidget {
  final StationboardConnection c;

  const ConnectionTile({Key key, @required this.c}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final diff = c.time.difference(DateTime.now());
    final i = c.color.indexOf("~");

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onTap: () => Navigator.of(context).pushNamed("/nextStops", arguments: c),
      title: Row(
        children: [
          if (i != -1) LineIcon.fromString(line: c.line, colors: c.color),
          const SizedBox(width: 8),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                c.terminal.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: <Widget>[
            CffIcon(c.type, size: 16),
            const SizedBox(width: 8),
            Text(
              Format.time(c.time),
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
      trailing: Text(Format.duration(diff)),
    );
  }
}
