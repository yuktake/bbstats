// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'team_select_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TeamSelectModel {
  List<Team> get teams => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeamSelectModelCopyWith<TeamSelectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamSelectModelCopyWith<$Res> {
  factory $TeamSelectModelCopyWith(
          TeamSelectModel value, $Res Function(TeamSelectModel) then) =
      _$TeamSelectModelCopyWithImpl<$Res>;
  $Res call({List<Team> teams});
}

/// @nodoc
class _$TeamSelectModelCopyWithImpl<$Res>
    implements $TeamSelectModelCopyWith<$Res> {
  _$TeamSelectModelCopyWithImpl(this._value, this._then);

  final TeamSelectModel _value;
  // ignore: unused_field
  final $Res Function(TeamSelectModel) _then;

  @override
  $Res call({
    Object? teams = freezed,
  }) {
    return _then(_value.copyWith(
      teams: teams == freezed
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<Team>,
    ));
  }
}

/// @nodoc
abstract class _$$_TeamSelectModelCopyWith<$Res>
    implements $TeamSelectModelCopyWith<$Res> {
  factory _$$_TeamSelectModelCopyWith(
          _$_TeamSelectModel value, $Res Function(_$_TeamSelectModel) then) =
      __$$_TeamSelectModelCopyWithImpl<$Res>;
  @override
  $Res call({List<Team> teams});
}

/// @nodoc
class __$$_TeamSelectModelCopyWithImpl<$Res>
    extends _$TeamSelectModelCopyWithImpl<$Res>
    implements _$$_TeamSelectModelCopyWith<$Res> {
  __$$_TeamSelectModelCopyWithImpl(
      _$_TeamSelectModel _value, $Res Function(_$_TeamSelectModel) _then)
      : super(_value, (v) => _then(v as _$_TeamSelectModel));

  @override
  _$_TeamSelectModel get _value => super._value as _$_TeamSelectModel;

  @override
  $Res call({
    Object? teams = freezed,
  }) {
    return _then(_$_TeamSelectModel(
      teams: teams == freezed
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<Team>,
    ));
  }
}

/// @nodoc

class _$_TeamSelectModel implements _TeamSelectModel {
  const _$_TeamSelectModel({required final List<Team> teams}) : _teams = teams;

  final List<Team> _teams;
  @override
  List<Team> get teams {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  @override
  String toString() {
    return 'TeamSelectModel(teams: $teams)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamSelectModel &&
            const DeepCollectionEquality().equals(other._teams, _teams));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_teams));

  @JsonKey(ignore: true)
  @override
  _$$_TeamSelectModelCopyWith<_$_TeamSelectModel> get copyWith =>
      __$$_TeamSelectModelCopyWithImpl<_$_TeamSelectModel>(this, _$identity);
}

abstract class _TeamSelectModel implements TeamSelectModel {
  const factory _TeamSelectModel({required final List<Team> teams}) =
      _$_TeamSelectModel;

  @override
  List<Team> get teams;
  @override
  @JsonKey(ignore: true)
  _$$_TeamSelectModelCopyWith<_$_TeamSelectModel> get copyWith =>
      throw _privateConstructorUsedError;
}
