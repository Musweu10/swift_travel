// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'exit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Exit _$ExitFromJson(Map<String, dynamic> json) {
  return _Exit.fromJson(json);
}

/// @nodoc
class _$ExitTearOff {
  const _$ExitTearOff();

// ignore: unused_element
  _Exit call(
      {DateTime arrival,
      String name,
      String stopid,
      @JsonKey(name: "waittime", defaultValue: 0)
          int waitTime,
      bool isaddress,
      String sbbName,
      double lat,
      double lon,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay}) {
    return _Exit(
      arrival: arrival,
      name: name,
      stopid: stopid,
      waitTime: waitTime,
      isaddress: isaddress,
      sbbName: sbbName,
      lat: lat,
      lon: lon,
      arrDelay: arrDelay,
    );
  }

// ignore: unused_element
  Exit fromJson(Map<String, Object> json) {
    return Exit.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Exit = _$ExitTearOff();

/// @nodoc
mixin _$Exit {
  DateTime get arrival;
  String get name;
  String get stopid;
  @JsonKey(name: "waittime", defaultValue: 0)
  int get waitTime;
  bool get isaddress;
  String get sbbName;
  double get lat;
  double get lon;
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get arrDelay;

  Map<String, dynamic> toJson();
  $ExitCopyWith<Exit> get copyWith;
}

/// @nodoc
abstract class $ExitCopyWith<$Res> {
  factory $ExitCopyWith(Exit value, $Res Function(Exit) then) =
      _$ExitCopyWithImpl<$Res>;
  $Res call(
      {DateTime arrival,
      String name,
      String stopid,
      @JsonKey(name: "waittime", defaultValue: 0)
          int waitTime,
      bool isaddress,
      String sbbName,
      double lat,
      double lon,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay});
}

/// @nodoc
class _$ExitCopyWithImpl<$Res> implements $ExitCopyWith<$Res> {
  _$ExitCopyWithImpl(this._value, this._then);

  final Exit _value;
  // ignore: unused_field
  final $Res Function(Exit) _then;

  @override
  $Res call({
    Object arrival = freezed,
    Object name = freezed,
    Object stopid = freezed,
    Object waitTime = freezed,
    Object isaddress = freezed,
    Object sbbName = freezed,
    Object lat = freezed,
    Object lon = freezed,
    Object arrDelay = freezed,
  }) {
    return _then(_value.copyWith(
      arrival: arrival == freezed ? _value.arrival : arrival as DateTime,
      name: name == freezed ? _value.name : name as String,
      stopid: stopid == freezed ? _value.stopid : stopid as String,
      waitTime: waitTime == freezed ? _value.waitTime : waitTime as int,
      isaddress: isaddress == freezed ? _value.isaddress : isaddress as bool,
      sbbName: sbbName == freezed ? _value.sbbName : sbbName as String,
      lat: lat == freezed ? _value.lat : lat as double,
      lon: lon == freezed ? _value.lon : lon as double,
      arrDelay: arrDelay == freezed ? _value.arrDelay : arrDelay as int,
    ));
  }
}

/// @nodoc
abstract class _$ExitCopyWith<$Res> implements $ExitCopyWith<$Res> {
  factory _$ExitCopyWith(_Exit value, $Res Function(_Exit) then) =
      __$ExitCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime arrival,
      String name,
      String stopid,
      @JsonKey(name: "waittime", defaultValue: 0)
          int waitTime,
      bool isaddress,
      String sbbName,
      double lat,
      double lon,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay});
}

/// @nodoc
class __$ExitCopyWithImpl<$Res> extends _$ExitCopyWithImpl<$Res>
    implements _$ExitCopyWith<$Res> {
  __$ExitCopyWithImpl(_Exit _value, $Res Function(_Exit) _then)
      : super(_value, (v) => _then(v as _Exit));

  @override
  _Exit get _value => super._value as _Exit;

  @override
  $Res call({
    Object arrival = freezed,
    Object name = freezed,
    Object stopid = freezed,
    Object waitTime = freezed,
    Object isaddress = freezed,
    Object sbbName = freezed,
    Object lat = freezed,
    Object lon = freezed,
    Object arrDelay = freezed,
  }) {
    return _then(_Exit(
      arrival: arrival == freezed ? _value.arrival : arrival as DateTime,
      name: name == freezed ? _value.name : name as String,
      stopid: stopid == freezed ? _value.stopid : stopid as String,
      waitTime: waitTime == freezed ? _value.waitTime : waitTime as int,
      isaddress: isaddress == freezed ? _value.isaddress : isaddress as bool,
      sbbName: sbbName == freezed ? _value.sbbName : sbbName as String,
      lat: lat == freezed ? _value.lat : lat as double,
      lon: lon == freezed ? _value.lon : lon as double,
      arrDelay: arrDelay == freezed ? _value.arrDelay : arrDelay as int,
    ));
  }
}

@JsonSerializable(includeIfNull: false)

/// @nodoc
class _$_Exit implements _Exit {
  _$_Exit(
      {this.arrival,
      this.name,
      this.stopid,
      @JsonKey(name: "waittime", defaultValue: 0)
          this.waitTime,
      this.isaddress,
      this.sbbName,
      this.lat,
      this.lon,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          this.arrDelay});

  factory _$_Exit.fromJson(Map<String, dynamic> json) =>
      _$_$_ExitFromJson(json);

  @override
  final DateTime arrival;
  @override
  final String name;
  @override
  final String stopid;
  @override
  @JsonKey(name: "waittime", defaultValue: 0)
  final int waitTime;
  @override
  final bool isaddress;
  @override
  final String sbbName;
  @override
  final double lat;
  @override
  final double lon;
  @override
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  final int arrDelay;

  @override
  String toString() {
    return 'Exit(arrival: $arrival, name: $name, stopid: $stopid, waitTime: $waitTime, isaddress: $isaddress, sbbName: $sbbName, lat: $lat, lon: $lon, arrDelay: $arrDelay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Exit &&
            (identical(other.arrival, arrival) ||
                const DeepCollectionEquality()
                    .equals(other.arrival, arrival)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.stopid, stopid) ||
                const DeepCollectionEquality().equals(other.stopid, stopid)) &&
            (identical(other.waitTime, waitTime) ||
                const DeepCollectionEquality()
                    .equals(other.waitTime, waitTime)) &&
            (identical(other.isaddress, isaddress) ||
                const DeepCollectionEquality()
                    .equals(other.isaddress, isaddress)) &&
            (identical(other.sbbName, sbbName) ||
                const DeepCollectionEquality()
                    .equals(other.sbbName, sbbName)) &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lon, lon) ||
                const DeepCollectionEquality().equals(other.lon, lon)) &&
            (identical(other.arrDelay, arrDelay) ||
                const DeepCollectionEquality()
                    .equals(other.arrDelay, arrDelay)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(arrival) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(stopid) ^
      const DeepCollectionEquality().hash(waitTime) ^
      const DeepCollectionEquality().hash(isaddress) ^
      const DeepCollectionEquality().hash(sbbName) ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lon) ^
      const DeepCollectionEquality().hash(arrDelay);

  @override
  _$ExitCopyWith<_Exit> get copyWith =>
      __$ExitCopyWithImpl<_Exit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ExitToJson(this);
  }
}

abstract class _Exit implements Exit {
  factory _Exit(
      {DateTime arrival,
      String name,
      String stopid,
      @JsonKey(name: "waittime", defaultValue: 0)
          int waitTime,
      bool isaddress,
      String sbbName,
      double lat,
      double lon,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay}) = _$_Exit;

  factory _Exit.fromJson(Map<String, dynamic> json) = _$_Exit.fromJson;

  @override
  DateTime get arrival;
  @override
  String get name;
  @override
  String get stopid;
  @override
  @JsonKey(name: "waittime", defaultValue: 0)
  int get waitTime;
  @override
  bool get isaddress;
  @override
  String get sbbName;
  @override
  double get lat;
  @override
  double get lon;
  @override
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get arrDelay;
  @override
  _$ExitCopyWith<_Exit> get copyWith;
}
