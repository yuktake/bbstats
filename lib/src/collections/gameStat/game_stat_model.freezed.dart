// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_stat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameStatModel {
  Game get game => throw _privateConstructorUsedError;
  ImageProvider<Object>? get image => throw _privateConstructorUsedError;
  BlendMode get blendMode => throw _privateConstructorUsedError;
  Uint8List? get src => throw _privateConstructorUsedError;
  List<Pbp> get pbps => throw _privateConstructorUsedError;
  int get shotFilter => throw _privateConstructorUsedError;
  int? get selectedPlayerId => throw _privateConstructorUsedError;
  List<List<dynamic>> get comparisonStats => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStatModelCopyWith<GameStatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStatModelCopyWith<$Res> {
  factory $GameStatModelCopyWith(
          GameStatModel value, $Res Function(GameStatModel) then) =
      _$GameStatModelCopyWithImpl<$Res>;
  $Res call(
      {Game game,
      ImageProvider<Object>? image,
      BlendMode blendMode,
      Uint8List? src,
      List<Pbp> pbps,
      int shotFilter,
      int? selectedPlayerId,
      List<List<dynamic>> comparisonStats});
}

/// @nodoc
class _$GameStatModelCopyWithImpl<$Res>
    implements $GameStatModelCopyWith<$Res> {
  _$GameStatModelCopyWithImpl(this._value, this._then);

  final GameStatModel _value;
  // ignore: unused_field
  final $Res Function(GameStatModel) _then;

  @override
  $Res call({
    Object? game = freezed,
    Object? image = freezed,
    Object? blendMode = freezed,
    Object? src = freezed,
    Object? pbps = freezed,
    Object? shotFilter = freezed,
    Object? selectedPlayerId = freezed,
    Object? comparisonStats = freezed,
  }) {
    return _then(_value.copyWith(
      game: game == freezed
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as Game,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageProvider<Object>?,
      blendMode: blendMode == freezed
          ? _value.blendMode
          : blendMode // ignore: cast_nullable_to_non_nullable
              as BlendMode,
      src: src == freezed
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      pbps: pbps == freezed
          ? _value.pbps
          : pbps // ignore: cast_nullable_to_non_nullable
              as List<Pbp>,
      shotFilter: shotFilter == freezed
          ? _value.shotFilter
          : shotFilter // ignore: cast_nullable_to_non_nullable
              as int,
      selectedPlayerId: selectedPlayerId == freezed
          ? _value.selectedPlayerId
          : selectedPlayerId // ignore: cast_nullable_to_non_nullable
              as int?,
      comparisonStats: comparisonStats == freezed
          ? _value.comparisonStats
          : comparisonStats // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>,
    ));
  }
}

/// @nodoc
abstract class _$$_GameStatModelCopyWith<$Res>
    implements $GameStatModelCopyWith<$Res> {
  factory _$$_GameStatModelCopyWith(
          _$_GameStatModel value, $Res Function(_$_GameStatModel) then) =
      __$$_GameStatModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {Game game,
      ImageProvider<Object>? image,
      BlendMode blendMode,
      Uint8List? src,
      List<Pbp> pbps,
      int shotFilter,
      int? selectedPlayerId,
      List<List<dynamic>> comparisonStats});
}

/// @nodoc
class __$$_GameStatModelCopyWithImpl<$Res>
    extends _$GameStatModelCopyWithImpl<$Res>
    implements _$$_GameStatModelCopyWith<$Res> {
  __$$_GameStatModelCopyWithImpl(
      _$_GameStatModel _value, $Res Function(_$_GameStatModel) _then)
      : super(_value, (v) => _then(v as _$_GameStatModel));

  @override
  _$_GameStatModel get _value => super._value as _$_GameStatModel;

  @override
  $Res call({
    Object? game = freezed,
    Object? image = freezed,
    Object? blendMode = freezed,
    Object? src = freezed,
    Object? pbps = freezed,
    Object? shotFilter = freezed,
    Object? selectedPlayerId = freezed,
    Object? comparisonStats = freezed,
  }) {
    return _then(_$_GameStatModel(
      game: game == freezed
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as Game,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageProvider<Object>?,
      blendMode: blendMode == freezed
          ? _value.blendMode
          : blendMode // ignore: cast_nullable_to_non_nullable
              as BlendMode,
      src: src == freezed
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      pbps: pbps == freezed
          ? _value._pbps
          : pbps // ignore: cast_nullable_to_non_nullable
              as List<Pbp>,
      shotFilter: shotFilter == freezed
          ? _value.shotFilter
          : shotFilter // ignore: cast_nullable_to_non_nullable
              as int,
      selectedPlayerId: selectedPlayerId == freezed
          ? _value.selectedPlayerId
          : selectedPlayerId // ignore: cast_nullable_to_non_nullable
              as int?,
      comparisonStats: comparisonStats == freezed
          ? _value._comparisonStats
          : comparisonStats // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>,
    ));
  }
}

/// @nodoc

class _$_GameStatModel implements _GameStatModel {
  const _$_GameStatModel(
      {required this.game,
      required this.image,
      required this.blendMode,
      required this.src,
      required final List<Pbp> pbps,
      required this.shotFilter,
      required this.selectedPlayerId,
      required final List<List<dynamic>> comparisonStats})
      : _pbps = pbps,
        _comparisonStats = comparisonStats;

  @override
  final Game game;
  @override
  final ImageProvider<Object>? image;
  @override
  final BlendMode blendMode;
  @override
  final Uint8List? src;
  final List<Pbp> _pbps;
  @override
  List<Pbp> get pbps {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pbps);
  }

  @override
  final int shotFilter;
  @override
  final int? selectedPlayerId;
  final List<List<dynamic>> _comparisonStats;
  @override
  List<List<dynamic>> get comparisonStats {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comparisonStats);
  }

  @override
  String toString() {
    return 'GameStatModel(game: $game, image: $image, blendMode: $blendMode, src: $src, pbps: $pbps, shotFilter: $shotFilter, selectedPlayerId: $selectedPlayerId, comparisonStats: $comparisonStats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameStatModel &&
            const DeepCollectionEquality().equals(other.game, game) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.blendMode, blendMode) &&
            const DeepCollectionEquality().equals(other.src, src) &&
            const DeepCollectionEquality().equals(other._pbps, _pbps) &&
            const DeepCollectionEquality()
                .equals(other.shotFilter, shotFilter) &&
            const DeepCollectionEquality()
                .equals(other.selectedPlayerId, selectedPlayerId) &&
            const DeepCollectionEquality()
                .equals(other._comparisonStats, _comparisonStats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(game),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(blendMode),
      const DeepCollectionEquality().hash(src),
      const DeepCollectionEquality().hash(_pbps),
      const DeepCollectionEquality().hash(shotFilter),
      const DeepCollectionEquality().hash(selectedPlayerId),
      const DeepCollectionEquality().hash(_comparisonStats));

  @JsonKey(ignore: true)
  @override
  _$$_GameStatModelCopyWith<_$_GameStatModel> get copyWith =>
      __$$_GameStatModelCopyWithImpl<_$_GameStatModel>(this, _$identity);
}

abstract class _GameStatModel implements GameStatModel {
  const factory _GameStatModel(
      {required final Game game,
      required final ImageProvider<Object>? image,
      required final BlendMode blendMode,
      required final Uint8List? src,
      required final List<Pbp> pbps,
      required final int shotFilter,
      required final int? selectedPlayerId,
      required final List<List<dynamic>> comparisonStats}) = _$_GameStatModel;

  @override
  Game get game;
  @override
  ImageProvider<Object>? get image;
  @override
  BlendMode get blendMode;
  @override
  Uint8List? get src;
  @override
  List<Pbp> get pbps;
  @override
  int get shotFilter;
  @override
  int? get selectedPlayerId;
  @override
  List<List<dynamic>> get comparisonStats;
  @override
  @JsonKey(ignore: true)
  _$$_GameStatModelCopyWith<_$_GameStatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
