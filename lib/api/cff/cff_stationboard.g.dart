// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cff_stationboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CffStationboard _$_$_CffStationboardFromJson(Map<String, dynamic> json) {
  return _$_CffStationboard(
    json['stop'] == null
        ? null
        : LocatedStop.fromJson(json['stop'] as Map<String, dynamic>),
    (json['connections'] as List)
        ?.map((e) => e == null
            ? null
            : StationboardConnection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['request'] as String,
    json['eof'] as int,
  );
}

Map<String, dynamic> _$_$_CffStationboardToJson(_$_CffStationboard instance) =>
    <String, dynamic>{
      'stop': instance.stop,
      'connections': instance.connections,
      'request': instance.request,
      'eof': instance.eof,
    };
