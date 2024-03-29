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
  DateTime? get start => throw _privateConstructorUsedError;
  DateTime? get end => throw _privateConstructorUsedError;
  Team get team => throw _privateConstructorUsedError;
  int get sortTargetIndex => throw _privateConstructorUsedError;
  bool get ascending => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeModelCopyWith<HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeModelCopyWith<$Res> {
  factory $HomeModelCopyWith(HomeModel value, $Res Function(HomeModel) then) =
      _$HomeModelCopyWithImpl<$Res>;
  $Res call(
      {DateTime? start,
      DateTime? end,
      Team team,
      int sortTargetIndex,
      bool ascending});
}

/// @nodoc
class _$HomeModelCopyWithImpl<$Res> implements $HomeModelCopyWith<$Res> {
  _$HomeModelCopyWithImpl(this._value, this._then);

  final HomeModel _value;
  // ignore: unused_field
  final $Res Function(HomeModel) _then;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
    Object? team = freezed,
    Object? sortTargetIndex = freezed,
    Object? ascending = freezed,
  }) {
    return _then(_value.copyWith(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      sortTargetIndex: sortTargetIndex == freezed
          ? _value.sortTargetIndex
          : sortTargetIndex // ignore: cast_nullable_to_non_nullable
              as int,
      ascending: ascending == freezed
          ? _value.ascending
          : ascending // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {DateTime? start,
      DateTime? end,
      Team team,
      int sortTargetIndex,
      bool ascending});
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
    Object? start = freezed,
    Object? end = freezed,
    Object? team = freezed,
    Object? sortTargetIndex = freezed,
    Object? ascending = freezed,
  }) {
    return _then(_$_HomeModel(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      sortTargetIndex: sortTargetIndex == freezed
          ? _value.sortTargetIndex
          : sortTargetIndex // ignore: cast_nullable_to_non_nullable
              as int,
      ascending: ascending == freezed
          ? _value.ascending
          : ascending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomeModel implements _HomeModel {
  const _$_HomeModel(
      {required this.start,
      required this.end,
      required this.team,
      required this.sortTargetIndex,
      required this.ascending});

  @override
  final DateTime? start;
  @override
  final DateTime? end;
  @override
  final Team team;
  @override
  final int sortTargetIndex;
  @override
  final bool ascending;

  @override
  String toString() {
    return 'HomeModel(start: $start, end: $end, team: $team, sortTargetIndex: $sortTargetIndex, ascending: $ascending)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeModel &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.end, end) &&
            const DeepCollectionEquality().equals(other.team, team) &&
            const DeepCollectionEquality()
                .equals(other.sortTargetIndex, sortTargetIndex) &&
            const DeepCollectionEquality().equals(other.ascending, ascending));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(end),
      const DeepCollectionEquality().hash(team),
      const DeepCollectionEquality().hash(sortTargetIndex),
      const DeepCollectionEquality().hash(ascending));

  @JsonKey(ignore: true)
  @override
  _$$_HomeModelCopyWith<_$_HomeModel> get copyWith =>
      __$$_HomeModelCopyWithImpl<_$_HomeModel>(this, _$identity);
}

abstract class _HomeModel implements HomeModel {
  const factory _HomeModel(
      {required final DateTime? start,
      required final DateTime? end,
      required final Team team,
      required final int sortTargetIndex,
      required final bool ascending}) = _$_HomeModel;

  @override
  DateTime? get start;
  @override
  DateTime? get end;
  @override
  Team get team;
  @override
  int get sortTargetIndex;
  @override
  bool get ascending;
  @override
  @JsonKey(ignore: true)
  _$$_HomeModelCopyWith<_$_HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
