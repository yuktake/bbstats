// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayerListModel {
  List<Player> get players => throw _privateConstructorUsedError;
  bool get visible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerListModelCopyWith<PlayerListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerListModelCopyWith<$Res> {
  factory $PlayerListModelCopyWith(
          PlayerListModel value, $Res Function(PlayerListModel) then) =
      _$PlayerListModelCopyWithImpl<$Res>;
  $Res call({List<Player> players, bool visible});
}

/// @nodoc
class _$PlayerListModelCopyWithImpl<$Res>
    implements $PlayerListModelCopyWith<$Res> {
  _$PlayerListModelCopyWithImpl(this._value, this._then);

  final PlayerListModel _value;
  // ignore: unused_field
  final $Res Function(PlayerListModel) _then;

  @override
  $Res call({
    Object? players = freezed,
    Object? visible = freezed,
  }) {
    return _then(_value.copyWith(
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      visible: visible == freezed
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_PlayerListModelCopyWith<$Res>
    implements $PlayerListModelCopyWith<$Res> {
  factory _$$_PlayerListModelCopyWith(
          _$_PlayerListModel value, $Res Function(_$_PlayerListModel) then) =
      __$$_PlayerListModelCopyWithImpl<$Res>;
  @override
  $Res call({List<Player> players, bool visible});
}

/// @nodoc
class __$$_PlayerListModelCopyWithImpl<$Res>
    extends _$PlayerListModelCopyWithImpl<$Res>
    implements _$$_PlayerListModelCopyWith<$Res> {
  __$$_PlayerListModelCopyWithImpl(
      _$_PlayerListModel _value, $Res Function(_$_PlayerListModel) _then)
      : super(_value, (v) => _then(v as _$_PlayerListModel));

  @override
  _$_PlayerListModel get _value => super._value as _$_PlayerListModel;

  @override
  $Res call({
    Object? players = freezed,
    Object? visible = freezed,
  }) {
    return _then(_$_PlayerListModel(
      players: players == freezed
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      visible: visible == freezed
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PlayerListModel implements _PlayerListModel {
  const _$_PlayerListModel(
      {required final List<Player> players, required this.visible})
      : _players = players;

  final List<Player> _players;
  @override
  List<Player> get players {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  final bool visible;

  @override
  String toString() {
    return 'PlayerListModel(players: $players, visible: $visible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerListModel &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            const DeepCollectionEquality().equals(other.visible, visible));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_players),
      const DeepCollectionEquality().hash(visible));

  @JsonKey(ignore: true)
  @override
  _$$_PlayerListModelCopyWith<_$_PlayerListModel> get copyWith =>
      __$$_PlayerListModelCopyWithImpl<_$_PlayerListModel>(this, _$identity);
}

abstract class _PlayerListModel implements PlayerListModel {
  const factory _PlayerListModel(
      {required final List<Player> players,
      required final bool visible}) = _$_PlayerListModel;

  @override
  List<Player> get players;
  @override
  bool get visible;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerListModelCopyWith<_$_PlayerListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
