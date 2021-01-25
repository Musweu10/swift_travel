// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'station_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$StationStatesTearOff {
  const _$StationStatesTearOff();

// ignore: unused_element
  StationStatesCompletions completions(List<CffCompletion> completions) {
    return StationStatesCompletions(
      completions,
    );
  }

// ignore: unused_element
  StationStatesEmpty empty() {
    return const StationStatesEmpty();
  }

// ignore: unused_element
  StationStatesNetworkError network() {
    return const StationStatesNetworkError();
  }
}

/// @nodoc
// ignore: unused_element
const $StationStates = _$StationStatesTearOff();

/// @nodoc
mixin _$StationStates {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult completions(List<CffCompletion> completions),
    @required TResult empty(),
    @required TResult network(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult completions(List<CffCompletion> completions),
    TResult empty(),
    TResult network(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult completions(StationStatesCompletions value),
    @required TResult empty(StationStatesEmpty value),
    @required TResult network(StationStatesNetworkError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult completions(StationStatesCompletions value),
    TResult empty(StationStatesEmpty value),
    TResult network(StationStatesNetworkError value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $StationStatesCopyWith<$Res> {
  factory $StationStatesCopyWith(
          StationStates value, $Res Function(StationStates) then) =
      _$StationStatesCopyWithImpl<$Res>;
}

/// @nodoc
class _$StationStatesCopyWithImpl<$Res>
    implements $StationStatesCopyWith<$Res> {
  _$StationStatesCopyWithImpl(this._value, this._then);

  final StationStates _value;
  // ignore: unused_field
  final $Res Function(StationStates) _then;
}

/// @nodoc
abstract class $StationStatesCompletionsCopyWith<$Res> {
  factory $StationStatesCompletionsCopyWith(StationStatesCompletions value,
          $Res Function(StationStatesCompletions) then) =
      _$StationStatesCompletionsCopyWithImpl<$Res>;
  $Res call({List<CffCompletion> completions});
}

/// @nodoc
class _$StationStatesCompletionsCopyWithImpl<$Res>
    extends _$StationStatesCopyWithImpl<$Res>
    implements $StationStatesCompletionsCopyWith<$Res> {
  _$StationStatesCompletionsCopyWithImpl(StationStatesCompletions _value,
      $Res Function(StationStatesCompletions) _then)
      : super(_value, (v) => _then(v as StationStatesCompletions));

  @override
  StationStatesCompletions get _value =>
      super._value as StationStatesCompletions;

  @override
  $Res call({
    Object completions = freezed,
  }) {
    return _then(StationStatesCompletions(
      completions == freezed
          ? _value.completions
          : completions as List<CffCompletion>,
    ));
  }
}

/// @nodoc
class _$StationStatesCompletions implements StationStatesCompletions {
  const _$StationStatesCompletions(this.completions)
      : assert(completions != null);

  @override
  final List<CffCompletion> completions;

  @override
  String toString() {
    return 'StationStates.completions(completions: $completions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StationStatesCompletions &&
            (identical(other.completions, completions) ||
                const DeepCollectionEquality()
                    .equals(other.completions, completions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(completions);

  @JsonKey(ignore: true)
  @override
  $StationStatesCompletionsCopyWith<StationStatesCompletions> get copyWith =>
      _$StationStatesCompletionsCopyWithImpl<StationStatesCompletions>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult completions(List<CffCompletion> completions),
    @required TResult empty(),
    @required TResult network(),
  }) {
    assert(completions != null);
    assert(empty != null);
    assert(network != null);
    return completions(this.completions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult completions(List<CffCompletion> completions),
    TResult empty(),
    TResult network(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (completions != null) {
      return completions(this.completions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult completions(StationStatesCompletions value),
    @required TResult empty(StationStatesEmpty value),
    @required TResult network(StationStatesNetworkError value),
  }) {
    assert(completions != null);
    assert(empty != null);
    assert(network != null);
    return completions(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult completions(StationStatesCompletions value),
    TResult empty(StationStatesEmpty value),
    TResult network(StationStatesNetworkError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (completions != null) {
      return completions(this);
    }
    return orElse();
  }
}

abstract class StationStatesCompletions implements StationStates {
  const factory StationStatesCompletions(List<CffCompletion> completions) =
      _$StationStatesCompletions;

  List<CffCompletion> get completions;
  @JsonKey(ignore: true)
  $StationStatesCompletionsCopyWith<StationStatesCompletions> get copyWith;
}

/// @nodoc
abstract class $StationStatesEmptyCopyWith<$Res> {
  factory $StationStatesEmptyCopyWith(
          StationStatesEmpty value, $Res Function(StationStatesEmpty) then) =
      _$StationStatesEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$StationStatesEmptyCopyWithImpl<$Res>
    extends _$StationStatesCopyWithImpl<$Res>
    implements $StationStatesEmptyCopyWith<$Res> {
  _$StationStatesEmptyCopyWithImpl(
      StationStatesEmpty _value, $Res Function(StationStatesEmpty) _then)
      : super(_value, (v) => _then(v as StationStatesEmpty));

  @override
  StationStatesEmpty get _value => super._value as StationStatesEmpty;
}

/// @nodoc
class _$StationStatesEmpty implements StationStatesEmpty {
  const _$StationStatesEmpty();

  @override
  String toString() {
    return 'StationStates.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is StationStatesEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult completions(List<CffCompletion> completions),
    @required TResult empty(),
    @required TResult network(),
  }) {
    assert(completions != null);
    assert(empty != null);
    assert(network != null);
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult completions(List<CffCompletion> completions),
    TResult empty(),
    TResult network(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult completions(StationStatesCompletions value),
    @required TResult empty(StationStatesEmpty value),
    @required TResult network(StationStatesNetworkError value),
  }) {
    assert(completions != null);
    assert(empty != null);
    assert(network != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult completions(StationStatesCompletions value),
    TResult empty(StationStatesEmpty value),
    TResult network(StationStatesNetworkError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class StationStatesEmpty implements StationStates {
  const factory StationStatesEmpty() = _$StationStatesEmpty;
}

/// @nodoc
abstract class $StationStatesNetworkErrorCopyWith<$Res> {
  factory $StationStatesNetworkErrorCopyWith(StationStatesNetworkError value,
          $Res Function(StationStatesNetworkError) then) =
      _$StationStatesNetworkErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$StationStatesNetworkErrorCopyWithImpl<$Res>
    extends _$StationStatesCopyWithImpl<$Res>
    implements $StationStatesNetworkErrorCopyWith<$Res> {
  _$StationStatesNetworkErrorCopyWithImpl(StationStatesNetworkError _value,
      $Res Function(StationStatesNetworkError) _then)
      : super(_value, (v) => _then(v as StationStatesNetworkError));

  @override
  StationStatesNetworkError get _value =>
      super._value as StationStatesNetworkError;
}

/// @nodoc
class _$StationStatesNetworkError implements StationStatesNetworkError {
  const _$StationStatesNetworkError();

  @override
  String toString() {
    return 'StationStates.network()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is StationStatesNetworkError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult completions(List<CffCompletion> completions),
    @required TResult empty(),
    @required TResult network(),
  }) {
    assert(completions != null);
    assert(empty != null);
    assert(network != null);
    return network();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult completions(List<CffCompletion> completions),
    TResult empty(),
    TResult network(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (network != null) {
      return network();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult completions(StationStatesCompletions value),
    @required TResult empty(StationStatesEmpty value),
    @required TResult network(StationStatesNetworkError value),
  }) {
    assert(completions != null);
    assert(empty != null);
    assert(network != null);
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult completions(StationStatesCompletions value),
    TResult empty(StationStatesEmpty value),
    TResult network(StationStatesNetworkError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class StationStatesNetworkError implements StationStates {
  const factory StationStatesNetworkError() = _$StationStatesNetworkError;
}