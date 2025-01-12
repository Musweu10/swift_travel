// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'completion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SchCompletion _$SchCompletionFromJson(Map<String, dynamic> json) {
  return _SchCompletion.fromJson(json);
}

/// @nodoc
mixin _$SchCompletion {
  String get label => throw _privateConstructorUsedError;
  double? get dist => throw _privateConstructorUsedError;
  @JsonKey(name: 'iconclass')
  String? get iconClass => throw _privateConstructorUsedError;
  String? get html => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchCompletionCopyWith<SchCompletion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchCompletionCopyWith<$Res> {
  factory $SchCompletionCopyWith(
          SchCompletion value, $Res Function(SchCompletion) then) =
      _$SchCompletionCopyWithImpl<$Res, SchCompletion>;
  @useResult
  $Res call(
      {String label,
      double? dist,
      @JsonKey(name: 'iconclass') String? iconClass,
      String? html,
      String? id});
}

/// @nodoc
class _$SchCompletionCopyWithImpl<$Res, $Val extends SchCompletion>
    implements $SchCompletionCopyWith<$Res> {
  _$SchCompletionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? dist = freezed,
    Object? iconClass = freezed,
    Object? html = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      dist: freezed == dist
          ? _value.dist
          : dist // ignore: cast_nullable_to_non_nullable
              as double?,
      iconClass: freezed == iconClass
          ? _value.iconClass
          : iconClass // ignore: cast_nullable_to_non_nullable
              as String?,
      html: freezed == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SchCompletionCopyWith<$Res>
    implements $SchCompletionCopyWith<$Res> {
  factory _$$_SchCompletionCopyWith(
          _$_SchCompletion value, $Res Function(_$_SchCompletion) then) =
      __$$_SchCompletionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label,
      double? dist,
      @JsonKey(name: 'iconclass') String? iconClass,
      String? html,
      String? id});
}

/// @nodoc
class __$$_SchCompletionCopyWithImpl<$Res>
    extends _$SchCompletionCopyWithImpl<$Res, _$_SchCompletion>
    implements _$$_SchCompletionCopyWith<$Res> {
  __$$_SchCompletionCopyWithImpl(
      _$_SchCompletion _value, $Res Function(_$_SchCompletion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? dist = freezed,
    Object? iconClass = freezed,
    Object? html = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_SchCompletion(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      dist: freezed == dist
          ? _value.dist
          : dist // ignore: cast_nullable_to_non_nullable
              as double?,
      iconClass: freezed == iconClass
          ? _value.iconClass
          : iconClass // ignore: cast_nullable_to_non_nullable
              as String?,
      html: freezed == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_SchCompletion extends _SchCompletion with DiagnosticableTreeMixin {
  _$_SchCompletion(
      {required this.label,
      this.dist,
      @JsonKey(name: 'iconclass') this.iconClass,
      this.html,
      this.id})
      : super._();

  factory _$_SchCompletion.fromJson(Map<String, dynamic> json) =>
      _$$_SchCompletionFromJson(json);

  @override
  final String label;
  @override
  final double? dist;
  @override
  @JsonKey(name: 'iconclass')
  final String? iconClass;
  @override
  final String? html;
  @override
  final String? id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SchCompletion(label: $label, dist: $dist, iconClass: $iconClass, html: $html, id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SchCompletion'))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('dist', dist))
      ..add(DiagnosticsProperty('iconClass', iconClass))
      ..add(DiagnosticsProperty('html', html))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SchCompletion &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.dist, dist) || other.dist == dist) &&
            (identical(other.iconClass, iconClass) ||
                other.iconClass == iconClass) &&
            (identical(other.html, html) || other.html == html) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, label, dist, iconClass, html, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SchCompletionCopyWith<_$_SchCompletion> get copyWith =>
      __$$_SchCompletionCopyWithImpl<_$_SchCompletion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SchCompletionToJson(
      this,
    );
  }
}

abstract class _SchCompletion extends SchCompletion {
  factory _SchCompletion(
      {required final String label,
      final double? dist,
      @JsonKey(name: 'iconclass') final String? iconClass,
      final String? html,
      final String? id}) = _$_SchCompletion;
  _SchCompletion._() : super._();

  factory _SchCompletion.fromJson(Map<String, dynamic> json) =
      _$_SchCompletion.fromJson;

  @override
  String get label;
  @override
  double? get dist;
  @override
  @JsonKey(name: 'iconclass')
  String? get iconClass;
  @override
  String? get html;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_SchCompletionCopyWith<_$_SchCompletion> get copyWith =>
      throw _privateConstructorUsedError;
}

_PlaceTypeIconclass _$_PlaceTypeIconclassFromJson(Map<String, dynamic> json) {
  return __PlaceTypeIconclass.fromJson(json);
}

/// @nodoc
mixin _$_PlaceTypeIconclass {
  LocationType get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PlaceTypeIconclassCopyWith<_PlaceTypeIconclass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PlaceTypeIconclassCopyWith<$Res> {
  factory _$PlaceTypeIconclassCopyWith(
          _PlaceTypeIconclass value, $Res Function(_PlaceTypeIconclass) then) =
      __$PlaceTypeIconclassCopyWithImpl<$Res, _PlaceTypeIconclass>;
  @useResult
  $Res call({LocationType v});
}

/// @nodoc
class __$PlaceTypeIconclassCopyWithImpl<$Res, $Val extends _PlaceTypeIconclass>
    implements _$PlaceTypeIconclassCopyWith<$Res> {
  __$PlaceTypeIconclassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_value.copyWith(
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as LocationType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$__PlaceTypeIconclassCopyWith<$Res>
    implements _$PlaceTypeIconclassCopyWith<$Res> {
  factory _$$__PlaceTypeIconclassCopyWith(_$__PlaceTypeIconclass value,
          $Res Function(_$__PlaceTypeIconclass) then) =
      __$$__PlaceTypeIconclassCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocationType v});
}

/// @nodoc
class __$$__PlaceTypeIconclassCopyWithImpl<$Res>
    extends __$PlaceTypeIconclassCopyWithImpl<$Res, _$__PlaceTypeIconclass>
    implements _$$__PlaceTypeIconclassCopyWith<$Res> {
  __$$__PlaceTypeIconclassCopyWithImpl(_$__PlaceTypeIconclass _value,
      $Res Function(_$__PlaceTypeIconclass) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$__PlaceTypeIconclass(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as LocationType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$__PlaceTypeIconclass
    with DiagnosticableTreeMixin
    implements __PlaceTypeIconclass {
  const _$__PlaceTypeIconclass(this.v);

  factory _$__PlaceTypeIconclass.fromJson(Map<String, dynamic> json) =>
      _$$__PlaceTypeIconclassFromJson(json);

  @override
  final LocationType v;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return '_PlaceTypeIconclass(v: $v)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', '_PlaceTypeIconclass'))
      ..add(DiagnosticsProperty('v', v));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$__PlaceTypeIconclass &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$__PlaceTypeIconclassCopyWith<_$__PlaceTypeIconclass> get copyWith =>
      __$$__PlaceTypeIconclassCopyWithImpl<_$__PlaceTypeIconclass>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$__PlaceTypeIconclassToJson(
      this,
    );
  }
}

abstract class __PlaceTypeIconclass implements _PlaceTypeIconclass {
  const factory __PlaceTypeIconclass(final LocationType v) =
      _$__PlaceTypeIconclass;

  factory __PlaceTypeIconclass.fromJson(Map<String, dynamic> json) =
      _$__PlaceTypeIconclass.fromJson;

  @override
  LocationType get v;
  @override
  @JsonKey(ignore: true)
  _$$__PlaceTypeIconclassCopyWith<_$__PlaceTypeIconclass> get copyWith =>
      throw _privateConstructorUsedError;
}

_VehicleTypeIconclass _$_VehicleTypeIconclassFromJson(
    Map<String, dynamic> json) {
  return __VehicleTypeIconclass.fromJson(json);
}

/// @nodoc
mixin _$_VehicleTypeIconclass {
  VehicleType get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$VehicleTypeIconclassCopyWith<_VehicleTypeIconclass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$VehicleTypeIconclassCopyWith<$Res> {
  factory _$VehicleTypeIconclassCopyWith(_VehicleTypeIconclass value,
          $Res Function(_VehicleTypeIconclass) then) =
      __$VehicleTypeIconclassCopyWithImpl<$Res, _VehicleTypeIconclass>;
  @useResult
  $Res call({VehicleType v});
}

/// @nodoc
class __$VehicleTypeIconclassCopyWithImpl<$Res,
        $Val extends _VehicleTypeIconclass>
    implements _$VehicleTypeIconclassCopyWith<$Res> {
  __$VehicleTypeIconclassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_value.copyWith(
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as VehicleType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$__VehicleTypeIconclassCopyWith<$Res>
    implements _$VehicleTypeIconclassCopyWith<$Res> {
  factory _$$__VehicleTypeIconclassCopyWith(_$__VehicleTypeIconclass value,
          $Res Function(_$__VehicleTypeIconclass) then) =
      __$$__VehicleTypeIconclassCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VehicleType v});
}

/// @nodoc
class __$$__VehicleTypeIconclassCopyWithImpl<$Res>
    extends __$VehicleTypeIconclassCopyWithImpl<$Res, _$__VehicleTypeIconclass>
    implements _$$__VehicleTypeIconclassCopyWith<$Res> {
  __$$__VehicleTypeIconclassCopyWithImpl(_$__VehicleTypeIconclass _value,
      $Res Function(_$__VehicleTypeIconclass) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$__VehicleTypeIconclass(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as VehicleType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$__VehicleTypeIconclass
    with DiagnosticableTreeMixin
    implements __VehicleTypeIconclass {
  const _$__VehicleTypeIconclass(this.v);

  factory _$__VehicleTypeIconclass.fromJson(Map<String, dynamic> json) =>
      _$$__VehicleTypeIconclassFromJson(json);

  @override
  final VehicleType v;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return '_VehicleTypeIconclass(v: $v)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', '_VehicleTypeIconclass'))
      ..add(DiagnosticsProperty('v', v));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$__VehicleTypeIconclass &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$__VehicleTypeIconclassCopyWith<_$__VehicleTypeIconclass> get copyWith =>
      __$$__VehicleTypeIconclassCopyWithImpl<_$__VehicleTypeIconclass>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$__VehicleTypeIconclassToJson(
      this,
    );
  }
}

abstract class __VehicleTypeIconclass implements _VehicleTypeIconclass {
  const factory __VehicleTypeIconclass(final VehicleType v) =
      _$__VehicleTypeIconclass;

  factory __VehicleTypeIconclass.fromJson(Map<String, dynamic> json) =
      _$__VehicleTypeIconclass.fromJson;

  @override
  VehicleType get v;
  @override
  @JsonKey(ignore: true)
  _$$__VehicleTypeIconclassCopyWith<_$__VehicleTypeIconclass> get copyWith =>
      throw _privateConstructorUsedError;
}
