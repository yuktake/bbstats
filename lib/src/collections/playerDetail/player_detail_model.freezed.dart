// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayerDetailModel {
  DateTime? get start => throw _privateConstructorUsedError;
  DateTime? get end => throw _privateConstructorUsedError;
  List<dynamic> get seasonStats => throw _privateConstructorUsedError;
  List<List<dynamic>> get shotTypeStats => throw _privateConstructorUsedError;
  List<List<dynamic>> get playTypeStats => throw _privateConstructorUsedError;
  List<List<dynamic>> get assistPlayerStats =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerDetailModelCopyWith<PlayerDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerDetailModelCopyWith<$Res> {
  factory $PlayerDetailModelCopyWith(
          PlayerDetailModel value, $Res Function(PlayerDetailModel) then) =
      _$PlayerDetailModelCopyWithImpl<$Res>;
  $Res call(
      {DateTime? start,
      DateTime? end,
      List<dynamic> seasonStats,
      List<List<dynamic>> shotTypeStats,
      List<List<dynamic>> playTypeStats,
      List<List<dynamic>> assistPlayerStats});
}

/// @nodoc
class _$PlayerDetailModelCopyWithImpl<$Res>
    implements $PlayerDetailModelCopyWith<$Res> {
  _$PlayerDetailModelCopyWithImpl(this._value, this._then);

  final PlayerDetailModel _value;
  // ignore: unused_field
  final $Res Function(PlayerDetailModel) _then;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
    Object? seasonStats = freezed,
    Object? shotTypeStats = freezed,
    Object? playTypeStats = freezed,
    Object? assistPlayerStats = freezed,
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
      seasonStats: seasonStats == freezed
          ? _value.seasonStats
          : seasonStats // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      shotTypeStats: shotTypeStats == freezed
          ? _value.shotTypeStats
          : shotTypeStats // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>,
      playTypeStats: playTypeStats == freezed
          ? _value.playTypeStats
          : playTypeStats // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>,
      assistPlayerStats: assistPlayerStats == freezed
          ? _value.assistPlayerStats
          : assistPlayerStats // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>,
    ));
  }
}

/// @nodoc
abstract class _$$_PlayerDetailModelCopyWith<$Res>
    implements $PlayerDetailModelCopyWith<$Res> {
  factory _$$_PlayerDetailModelCopyWith(_$_PlayerDetailModel value,
          $Res Function(_$_PlayerDetailModel) then) =
      __$$_PlayerDetailModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime? start,
      DateTime? end,
      List<dynamic> seasonStats,
      List<List<dynamic>> shotTypeStats,
      List<List<dynamic>> playTypeStats,
      List<List<dynamic>> assistPlayerStats});
}

/// @nodoc
class __$$_PlayerDetailModelCopyWithImpl<$Res>
    extends _$PlayerDetailModelCopyWithImpl<$Res>
    implements _$$_PlayerDetailModelCopyWith<$Res> {
  __$$_PlayerDetailModelCopyWithImpl(
      _$_PlayerDetailModel _value, $Res Function(_$_PlayerDetailModel) _then)
      : super(_value, (v) => _then(v as _$_PlayerDetailModel));

  @override
  _$_PlayerDetailModel get _value => super._value as _$_PlayerDetailModel;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
    Object? seasonStats = freezed,
    Object? shotTypeStats = freezed,
    Object? playTypeStats = freezed,
    Object? assistPlayerStats = freezed,
  }) {
    return _then(_$_PlayerDetailModel(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      seasonStats: seasonStats == freezed
          ? _value._seasonStats
          : seasonStats // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      shotTypeStats: shotTypeStats == freezed
          ? _value._shotTypeStats
          : shotTypeStats // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>,
      playTypeStats: playTypeStats == freezed
          ? _value._playTypeStats
          : playTypeStats // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>,
      assistPlayerStats: assistPlayerStats == freezed
          ? _value._assistPlayerStats
          : assistPlayerStats // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>,
    ));
  }
}

/// @nodoc

class _$_PlayerDetailModel implements _PlayerDetailModel {
  const _$_PlayerDetailModel(
      {required this.start,
      required this.end,
      required final List<dynamic> seasonStats,
      required final List<List<dynamic>> shotTypeStats,
      required final List<List<dynamic>> playTypeStats,
      required final List<List<dynamic>> assistPlayerStats})
      : _seasonStats = seasonStats,
        _shotTypeStats = shotTypeStats,
        _playTypeStats = playTypeStats,
        _assistPlayerStats = assistPlayerStats;

  @override
  final DateTime? start;
  @override
  final DateTime? end;
  final List<dynamic> _seasonStats;
  @override
  List<dynamic> get seasonStats {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seasonStats);
  }

  final List<List<dynamic>> _shotTypeStats;
  @override
  List<List<dynamic>> get shotTypeStats {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shotTypeStats);
  }

  final List<List<dynamic>> _playTypeStats;
  @override
  List<List<dynamic>> get playTypeStats {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playTypeStats);
  }

  final List<List<dynamic>> _assistPlayerStats;
  @override
  List<List<dynamic>> get assistPlayerStats {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assistPlayerStats);
  }

  @override
  String toString() {
    return 'PlayerDetailModel(start: $start, end: $end, seasonStats: $seasonStats, shotTypeStats: $shotTypeStats, playTypeStats: $playTypeStats, assistPlayerStats: $assistPlayerStats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerDetailModel &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.end, end) &&
            const DeepCollectionEquality()
                .equals(other._seasonStats, _seasonStats) &&
            const DeepCollectionEquality()
                .equals(other._shotTypeStats, _shotTypeStats) &&
            const DeepCollectionEquality()
                .equals(other._playTypeStats, _playTypeStats) &&
            const DeepCollectionEquality()
                .equals(other._assistPlayerStats, _assistPlayerStats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(end),
      const DeepCollectionEquality().hash(_seasonStats),
      const DeepCollectionEquality().hash(_shotTypeStats),
      const DeepCollectionEquality().hash(_playTypeStats),
      const DeepCollectionEquality().hash(_assistPlayerStats));

  @JsonKey(ignore: true)
  @override
  _$$_PlayerDetailModelCopyWith<_$_PlayerDetailModel> get copyWith =>
      __$$_PlayerDetailModelCopyWithImpl<_$_PlayerDetailModel>(
          this, _$identity);
}

abstract class _PlayerDetailModel implements PlayerDetailModel {
  const factory _PlayerDetailModel(
          {required final DateTime? start,
          required final DateTime? end,
          required final List<dynamic> seasonStats,
          required final List<List<dynamic>> shotTypeStats,
          required final List<List<dynamic>> playTypeStats,
          required final List<List<dynamic>> assistPlayerStats}) =
      _$_PlayerDetailModel;

  @override
  DateTime? get start;
  @override
  DateTime? get end;
  @override
  List<dynamic> get seasonStats;
  @override
  List<List<dynamic>> get shotTypeStats;
  @override
  List<List<dynamic>> get playTypeStats;
  @override
  List<List<dynamic>> get assistPlayerStats;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerDetailModelCopyWith<_$_PlayerDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}
