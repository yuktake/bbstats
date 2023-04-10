// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameListModel {
  List<Game> get games => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameListModelCopyWith<GameListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameListModelCopyWith<$Res> {
  factory $GameListModelCopyWith(
          GameListModel value, $Res Function(GameListModel) then) =
      _$GameListModelCopyWithImpl<$Res>;
  $Res call({List<Game> games, DateTime dateTime});
}

/// @nodoc
class _$GameListModelCopyWithImpl<$Res>
    implements $GameListModelCopyWith<$Res> {
  _$GameListModelCopyWithImpl(this._value, this._then);

  final GameListModel _value;
  // ignore: unused_field
  final $Res Function(GameListModel) _then;

  @override
  $Res call({
    Object? games = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      games: games == freezed
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_GameListModelCopyWith<$Res>
    implements $GameListModelCopyWith<$Res> {
  factory _$$_GameListModelCopyWith(
          _$_GameListModel value, $Res Function(_$_GameListModel) then) =
      __$$_GameListModelCopyWithImpl<$Res>;
  @override
  $Res call({List<Game> games, DateTime dateTime});
}

/// @nodoc
class __$$_GameListModelCopyWithImpl<$Res>
    extends _$GameListModelCopyWithImpl<$Res>
    implements _$$_GameListModelCopyWith<$Res> {
  __$$_GameListModelCopyWithImpl(
      _$_GameListModel _value, $Res Function(_$_GameListModel) _then)
      : super(_value, (v) => _then(v as _$_GameListModel));

  @override
  _$_GameListModel get _value => super._value as _$_GameListModel;

  @override
  $Res call({
    Object? games = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_$_GameListModel(
      games: games == freezed
          ? _value._games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_GameListModel implements _GameListModel {
  const _$_GameListModel(
      {required final List<Game> games, required this.dateTime})
      : _games = games;

  final List<Game> _games;
  @override
  List<Game> get games {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_games);
  }

  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'GameListModel(games: $games, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameListModel &&
            const DeepCollectionEquality().equals(other._games, _games) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_games),
      const DeepCollectionEquality().hash(dateTime));

  @JsonKey(ignore: true)
  @override
  _$$_GameListModelCopyWith<_$_GameListModel> get copyWith =>
      __$$_GameListModelCopyWithImpl<_$_GameListModel>(this, _$identity);
}

abstract class _GameListModel implements GameListModel {
  const factory _GameListModel(
      {required final List<Game> games,
      required final DateTime dateTime}) = _$_GameListModel;

  @override
  List<Game> get games;
  @override
  DateTime get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$_GameListModelCopyWith<_$_GameListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
