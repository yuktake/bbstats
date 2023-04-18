// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'boxscore_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BoxScoreListModel {
  List<Boxscore> get boxScores => throw _privateConstructorUsedError;
  int get sortTargetIndex => throw _privateConstructorUsedError;
  bool get ascending => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoxScoreListModelCopyWith<BoxScoreListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoxScoreListModelCopyWith<$Res> {
  factory $BoxScoreListModelCopyWith(
          BoxScoreListModel value, $Res Function(BoxScoreListModel) then) =
      _$BoxScoreListModelCopyWithImpl<$Res>;
  $Res call({List<Boxscore> boxScores, int sortTargetIndex, bool ascending});
}

/// @nodoc
class _$BoxScoreListModelCopyWithImpl<$Res>
    implements $BoxScoreListModelCopyWith<$Res> {
  _$BoxScoreListModelCopyWithImpl(this._value, this._then);

  final BoxScoreListModel _value;
  // ignore: unused_field
  final $Res Function(BoxScoreListModel) _then;

  @override
  $Res call({
    Object? boxScores = freezed,
    Object? sortTargetIndex = freezed,
    Object? ascending = freezed,
  }) {
    return _then(_value.copyWith(
      boxScores: boxScores == freezed
          ? _value.boxScores
          : boxScores // ignore: cast_nullable_to_non_nullable
              as List<Boxscore>,
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
abstract class _$$_BoxScoreListModelCopyWith<$Res>
    implements $BoxScoreListModelCopyWith<$Res> {
  factory _$$_BoxScoreListModelCopyWith(_$_BoxScoreListModel value,
          $Res Function(_$_BoxScoreListModel) then) =
      __$$_BoxScoreListModelCopyWithImpl<$Res>;
  @override
  $Res call({List<Boxscore> boxScores, int sortTargetIndex, bool ascending});
}

/// @nodoc
class __$$_BoxScoreListModelCopyWithImpl<$Res>
    extends _$BoxScoreListModelCopyWithImpl<$Res>
    implements _$$_BoxScoreListModelCopyWith<$Res> {
  __$$_BoxScoreListModelCopyWithImpl(
      _$_BoxScoreListModel _value, $Res Function(_$_BoxScoreListModel) _then)
      : super(_value, (v) => _then(v as _$_BoxScoreListModel));

  @override
  _$_BoxScoreListModel get _value => super._value as _$_BoxScoreListModel;

  @override
  $Res call({
    Object? boxScores = freezed,
    Object? sortTargetIndex = freezed,
    Object? ascending = freezed,
  }) {
    return _then(_$_BoxScoreListModel(
      boxScores: boxScores == freezed
          ? _value._boxScores
          : boxScores // ignore: cast_nullable_to_non_nullable
              as List<Boxscore>,
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

class _$_BoxScoreListModel implements _BoxScoreListModel {
  const _$_BoxScoreListModel(
      {required final List<Boxscore> boxScores,
      required this.sortTargetIndex,
      required this.ascending})
      : _boxScores = boxScores;

  final List<Boxscore> _boxScores;
  @override
  List<Boxscore> get boxScores {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boxScores);
  }

  @override
  final int sortTargetIndex;
  @override
  final bool ascending;

  @override
  String toString() {
    return 'BoxScoreListModel(boxScores: $boxScores, sortTargetIndex: $sortTargetIndex, ascending: $ascending)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BoxScoreListModel &&
            const DeepCollectionEquality()
                .equals(other._boxScores, _boxScores) &&
            const DeepCollectionEquality()
                .equals(other.sortTargetIndex, sortTargetIndex) &&
            const DeepCollectionEquality().equals(other.ascending, ascending));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_boxScores),
      const DeepCollectionEquality().hash(sortTargetIndex),
      const DeepCollectionEquality().hash(ascending));

  @JsonKey(ignore: true)
  @override
  _$$_BoxScoreListModelCopyWith<_$_BoxScoreListModel> get copyWith =>
      __$$_BoxScoreListModelCopyWithImpl<_$_BoxScoreListModel>(
          this, _$identity);
}

abstract class _BoxScoreListModel implements BoxScoreListModel {
  const factory _BoxScoreListModel(
      {required final List<Boxscore> boxScores,
      required final int sortTargetIndex,
      required final bool ascending}) = _$_BoxScoreListModel;

  @override
  List<Boxscore> get boxScores;
  @override
  int get sortTargetIndex;
  @override
  bool get ascending;
  @override
  @JsonKey(ignore: true)
  _$$_BoxScoreListModelCopyWith<_$_BoxScoreListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
