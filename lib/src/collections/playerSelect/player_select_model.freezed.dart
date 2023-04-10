// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_select_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayerSelectModel {
  List<Player> get players => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerSelectModelCopyWith<PlayerSelectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerSelectModelCopyWith<$Res> {
  factory $PlayerSelectModelCopyWith(
          PlayerSelectModel value, $Res Function(PlayerSelectModel) then) =
      _$PlayerSelectModelCopyWithImpl<$Res>;
  $Res call({List<Player> players});
}

/// @nodoc
class _$PlayerSelectModelCopyWithImpl<$Res>
    implements $PlayerSelectModelCopyWith<$Res> {
  _$PlayerSelectModelCopyWithImpl(this._value, this._then);

  final PlayerSelectModel _value;
  // ignore: unused_field
  final $Res Function(PlayerSelectModel) _then;

  @override
  $Res call({
    Object? players = freezed,
  }) {
    return _then(_value.copyWith(
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
    ));
  }
}

/// @nodoc
abstract class _$$_PlayerSelectModelCopyWith<$Res>
    implements $PlayerSelectModelCopyWith<$Res> {
  factory _$$_PlayerSelectModelCopyWith(_$_PlayerSelectModel value,
          $Res Function(_$_PlayerSelectModel) then) =
      __$$_PlayerSelectModelCopyWithImpl<$Res>;
  @override
  $Res call({List<Player> players});
}

/// @nodoc
class __$$_PlayerSelectModelCopyWithImpl<$Res>
    extends _$PlayerSelectModelCopyWithImpl<$Res>
    implements _$$_PlayerSelectModelCopyWith<$Res> {
  __$$_PlayerSelectModelCopyWithImpl(
      _$_PlayerSelectModel _value, $Res Function(_$_PlayerSelectModel) _then)
      : super(_value, (v) => _then(v as _$_PlayerSelectModel));

  @override
  _$_PlayerSelectModel get _value => super._value as _$_PlayerSelectModel;

  @override
  $Res call({
    Object? players = freezed,
  }) {
    return _then(_$_PlayerSelectModel(
      players: players == freezed
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
    ));
  }
}

/// @nodoc

class _$_PlayerSelectModel implements _PlayerSelectModel {
  const _$_PlayerSelectModel({required final List<Player> players})
      : _players = players;

  final List<Player> _players;
  @override
  List<Player> get players {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  String toString() {
    return 'PlayerSelectModel(players: $players)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerSelectModel &&
            const DeepCollectionEquality().equals(other._players, _players));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_players));

  @JsonKey(ignore: true)
  @override
  _$$_PlayerSelectModelCopyWith<_$_PlayerSelectModel> get copyWith =>
      __$$_PlayerSelectModelCopyWithImpl<_$_PlayerSelectModel>(
          this, _$identity);
}

abstract class _PlayerSelectModel implements PlayerSelectModel {
  const factory _PlayerSelectModel({required final List<Player> players}) =
      _$_PlayerSelectModel;

  @override
  List<Player> get players;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerSelectModelCopyWith<_$_PlayerSelectModel> get copyWith =>
      throw _privateConstructorUsedError;
}
