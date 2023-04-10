// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeModel {
  List<dynamic> get teamStat => throw _privateConstructorUsedError;
  List<List<dynamic>> get playerStats => throw _privateConstructorUsedError;
  Team get team => throw _privateConstructorUsedError;
  int get win => throw _privateConstructorUsedError;
  int get lost => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeModelCopyWith<HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeModelCopyWith<$Res> {
  factory $HomeModelCopyWith(HomeModel value, $Res Function(HomeModel) then) =
      _$HomeModelCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> teamStat,
      List<List<dynamic>> playerStats,
      Team team,
      int win,
      int lost});
}

/// @nodoc
class _$HomeModelCopyWithImpl<$Res> implements $HomeModelCopyWith<$Res> {
  _$HomeModelCopyWithImpl(this._value, this._then);

  final HomeModel _value;
  // ignore: unused_field
  final $Res Function(HomeModel) _then;

  @override
  $Res call({
    Object? teamStat = freezed,
    Object? playerStats = freezed,
    Object? team = freezed,
    Object? win = freezed,
    Object? lost = freezed,
  }) {
    return _then(_value.copyWith(
      teamStat: teamStat == freezed
          ? _value.teamStat
          : teamStat // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      playerStats: playerStats == freezed
          ? _value.playerStats
          : playerStats // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      win: win == freezed
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as int,
      lost: lost == freezed
          ? _value.lost
          : lost // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_HomeModelCopyWith<$Res> implements $HomeModelCopyWith<$Res> {
  factory _$$_HomeModelCopyWith(
          _$_HomeModel value, $Res Function(_$_HomeModel) then) =
      __$$_HomeModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> teamStat,
      List<List<dynamic>> playerStats,
      Team team,
      int win,
      int lost});
}

/// @nodoc
class __$$_HomeModelCopyWithImpl<$Res> extends _$HomeModelCopyWithImpl<$Res>
    implements _$$_HomeModelCopyWith<$Res> {
  __$$_HomeModelCopyWithImpl(
      _$_HomeModel _value, $Res Function(_$_HomeModel) _then)
      : super(_value, (v) => _then(v as _$_HomeModel));

  @override
  _$_HomeModel get _value => super._value as _$_HomeModel;

  @override
  $Res call({
    Object? teamStat = freezed,
    Object? playerStats = freezed,
    Object? team = freezed,
    Object? win = freezed,
    Object? lost = freezed,
  }) {
    return _then(_$_HomeModel(
      teamStat: teamStat == freezed
          ? _value._teamStat
          : teamStat // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      playerStats: playerStats == freezed
          ? _value._playerStats
          : playerStats // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      win: win == freezed
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as int,
      lost: lost == freezed
          ? _value.lost
          : lost // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HomeModel implements _HomeModel {
  const _$_HomeModel(
      {required final List<dynamic> teamStat,
      required final List<List<dynamic>> playerStats,
      required this.team,
      required this.win,
      required this.lost})
      : _teamStat = teamStat,
        _playerStats = playerStats;

  final List<dynamic> _teamStat;
  @override
  List<dynamic> get teamStat {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teamStat);
  }

  final List<List<dynamic>> _playerStats;
  @override
  List<List<dynamic>> get playerStats {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerStats);
  }

  @override
  final Team team;
  @override
  final int win;
  @override
  final int lost;

  @override
  String toString() {
    return 'HomeModel(teamStat: $teamStat, playerStats: $playerStats, team: $team, win: $win, lost: $lost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeModel &&
            const DeepCollectionEquality().equals(other._teamStat, _teamStat) &&
            const DeepCollectionEquality()
                .equals(other._playerStats, _playerStats) &&
            const DeepCollectionEquality().equals(other.team, team) &&
            const DeepCollectionEquality().equals(other.win, win) &&
            const DeepCollectionEquality().equals(other.lost, lost));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_teamStat),
      const DeepCollectionEquality().hash(_playerStats),
      const DeepCollectionEquality().hash(team),
      const DeepCollectionEquality().hash(win),
      const DeepCollectionEquality().hash(lost));

  @JsonKey(ignore: true)
  @override
  _$$_HomeModelCopyWith<_$_HomeModel> get copyWith =>
      __$$_HomeModelCopyWithImpl<_$_HomeModel>(this, _$identity);
}

abstract class _HomeModel implements HomeModel {
  const factory _HomeModel(
      {required final List<dynamic> teamStat,
      required final List<List<dynamic>> playerStats,
      required final Team team,
      required final int win,
      required final int lost}) = _$_HomeModel;

  @override
  List<dynamic> get teamStat;
  @override
  List<List<dynamic>> get playerStats;
  @override
  Team get team;
  @override
  int get win;
  @override
  int get lost;
  @override
  @JsonKey(ignore: true)
  _$$_HomeModelCopyWith<_$_HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
