// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shot_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShotParameter {
  int get gameId => throw _privateConstructorUsedError;
  int get playerId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShotParameterCopyWith<ShotParameter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShotParameterCopyWith<$Res> {
  factory $ShotParameterCopyWith(
          ShotParameter value, $Res Function(ShotParameter) then) =
      _$ShotParameterCopyWithImpl<$Res>;
  $Res call({int gameId, int playerId});
}

/// @nodoc
class _$ShotParameterCopyWithImpl<$Res>
    implements $ShotParameterCopyWith<$Res> {
  _$ShotParameterCopyWithImpl(this._value, this._then);

  final ShotParameter _value;
  // ignore: unused_field
  final $Res Function(ShotParameter) _then;

  @override
  $Res call({
    Object? gameId = freezed,
    Object? playerId = freezed,
  }) {
    return _then(_value.copyWith(
      gameId: gameId == freezed
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int,
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ShotParameterCopyWith<$Res>
    implements $ShotParameterCopyWith<$Res> {
  factory _$$_ShotParameterCopyWith(
          _$_ShotParameter value, $Res Function(_$_ShotParameter) then) =
      __$$_ShotParameterCopyWithImpl<$Res>;
  @override
  $Res call({int gameId, int playerId});
}

/// @nodoc
class __$$_ShotParameterCopyWithImpl<$Res>
    extends _$ShotParameterCopyWithImpl<$Res>
    implements _$$_ShotParameterCopyWith<$Res> {
  __$$_ShotParameterCopyWithImpl(
      _$_ShotParameter _value, $Res Function(_$_ShotParameter) _then)
      : super(_value, (v) => _then(v as _$_ShotParameter));

  @override
  _$_ShotParameter get _value => super._value as _$_ShotParameter;

  @override
  $Res call({
    Object? gameId = freezed,
    Object? playerId = freezed,
  }) {
    return _then(_$_ShotParameter(
      gameId: gameId == freezed
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int,
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ShotParameter implements _ShotParameter {
  const _$_ShotParameter({required this.gameId, required this.playerId});

  @override
  final int gameId;
  @override
  final int playerId;

  @override
  String toString() {
    return 'ShotParameter(gameId: $gameId, playerId: $playerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShotParameter &&
            const DeepCollectionEquality().equals(other.gameId, gameId) &&
            const DeepCollectionEquality().equals(other.playerId, playerId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gameId),
      const DeepCollectionEquality().hash(playerId));

  @JsonKey(ignore: true)
  @override
  _$$_ShotParameterCopyWith<_$_ShotParameter> get copyWith =>
      __$$_ShotParameterCopyWithImpl<_$_ShotParameter>(this, _$identity);
}

abstract class _ShotParameter implements ShotParameter {
  const factory _ShotParameter(
      {required final int gameId,
      required final int playerId}) = _$_ShotParameter;

  @override
  int get gameId;
  @override
  int get playerId;
  @override
  @JsonKey(ignore: true)
  _$$_ShotParameterCopyWith<_$_ShotParameter> get copyWith =>
      throw _privateConstructorUsedError;
}
