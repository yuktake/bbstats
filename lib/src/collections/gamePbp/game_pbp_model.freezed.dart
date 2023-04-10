// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_pbp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GamePbpModel {
  Game get game => throw _privateConstructorUsedError;
  List<Pbp> get pbps => throw _privateConstructorUsedError;
  int get quarter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GamePbpModelCopyWith<GamePbpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamePbpModelCopyWith<$Res> {
  factory $GamePbpModelCopyWith(
          GamePbpModel value, $Res Function(GamePbpModel) then) =
      _$GamePbpModelCopyWithImpl<$Res>;
  $Res call({Game game, List<Pbp> pbps, int quarter});
}

/// @nodoc
class _$GamePbpModelCopyWithImpl<$Res> implements $GamePbpModelCopyWith<$Res> {
  _$GamePbpModelCopyWithImpl(this._value, this._then);

  final GamePbpModel _value;
  // ignore: unused_field
  final $Res Function(GamePbpModel) _then;

  @override
  $Res call({
    Object? game = freezed,
    Object? pbps = freezed,
    Object? quarter = freezed,
  }) {
    return _then(_value.copyWith(
      game: game == freezed
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as Game,
      pbps: pbps == freezed
          ? _value.pbps
          : pbps // ignore: cast_nullable_to_non_nullable
              as List<Pbp>,
      quarter: quarter == freezed
          ? _value.quarter
          : quarter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_GamePbpModelCopyWith<$Res>
    implements $GamePbpModelCopyWith<$Res> {
  factory _$$_GamePbpModelCopyWith(
          _$_GamePbpModel value, $Res Function(_$_GamePbpModel) then) =
      __$$_GamePbpModelCopyWithImpl<$Res>;
  @override
  $Res call({Game game, List<Pbp> pbps, int quarter});
}

/// @nodoc
class __$$_GamePbpModelCopyWithImpl<$Res>
    extends _$GamePbpModelCopyWithImpl<$Res>
    implements _$$_GamePbpModelCopyWith<$Res> {
  __$$_GamePbpModelCopyWithImpl(
      _$_GamePbpModel _value, $Res Function(_$_GamePbpModel) _then)
      : super(_value, (v) => _then(v as _$_GamePbpModel));

  @override
  _$_GamePbpModel get _value => super._value as _$_GamePbpModel;

  @override
  $Res call({
    Object? game = freezed,
    Object? pbps = freezed,
    Object? quarter = freezed,
  }) {
    return _then(_$_GamePbpModel(
      game: game == freezed
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as Game,
      pbps: pbps == freezed
          ? _value._pbps
          : pbps // ignore: cast_nullable_to_non_nullable
              as List<Pbp>,
      quarter: quarter == freezed
          ? _value.quarter
          : quarter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GamePbpModel implements _GamePbpModel {
  const _$_GamePbpModel(
      {required this.game,
      required final List<Pbp> pbps,
      required this.quarter})
      : _pbps = pbps;

  @override
  final Game game;
  final List<Pbp> _pbps;
  @override
  List<Pbp> get pbps {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pbps);
  }

  @override
  final int quarter;

  @override
  String toString() {
    return 'GamePbpModel(game: $game, pbps: $pbps, quarter: $quarter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GamePbpModel &&
            const DeepCollectionEquality().equals(other.game, game) &&
            const DeepCollectionEquality().equals(other._pbps, _pbps) &&
            const DeepCollectionEquality().equals(other.quarter, quarter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(game),
      const DeepCollectionEquality().hash(_pbps),
      const DeepCollectionEquality().hash(quarter));

  @JsonKey(ignore: true)
  @override
  _$$_GamePbpModelCopyWith<_$_GamePbpModel> get copyWith =>
      __$$_GamePbpModelCopyWithImpl<_$_GamePbpModel>(this, _$identity);
}

abstract class _GamePbpModel implements GamePbpModel {
  const factory _GamePbpModel(
      {required final Game game,
      required final List<Pbp> pbps,
      required final int quarter}) = _$_GamePbpModel;

  @override
  Game get game;
  @override
  List<Pbp> get pbps;
  @override
  int get quarter;
  @override
  @JsonKey(ignore: true)
  _$$_GamePbpModelCopyWith<_$_GamePbpModel> get copyWith =>
      throw _privateConstructorUsedError;
}
