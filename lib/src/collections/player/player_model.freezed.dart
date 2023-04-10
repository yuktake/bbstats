// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayerModel {
  String get name => throw _privateConstructorUsedError;
  String get editName => throw _privateConstructorUsedError;
  TextEditingController get playerNameInputController =>
      throw _privateConstructorUsedError;
  bool get showPreview => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  bool get visible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerModelCopyWith<PlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerModelCopyWith<$Res> {
  factory $PlayerModelCopyWith(
          PlayerModel value, $Res Function(PlayerModel) then) =
      _$PlayerModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String editName,
      TextEditingController playerNameInputController,
      bool showPreview,
      String? imagePath,
      bool visible});
}

/// @nodoc
class _$PlayerModelCopyWithImpl<$Res> implements $PlayerModelCopyWith<$Res> {
  _$PlayerModelCopyWithImpl(this._value, this._then);

  final PlayerModel _value;
  // ignore: unused_field
  final $Res Function(PlayerModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? editName = freezed,
    Object? playerNameInputController = freezed,
    Object? showPreview = freezed,
    Object? imagePath = freezed,
    Object? visible = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      editName: editName == freezed
          ? _value.editName
          : editName // ignore: cast_nullable_to_non_nullable
              as String,
      playerNameInputController: playerNameInputController == freezed
          ? _value.playerNameInputController
          : playerNameInputController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      showPreview: showPreview == freezed
          ? _value.showPreview
          : showPreview // ignore: cast_nullable_to_non_nullable
              as bool,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      visible: visible == freezed
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_PlayerModelCopyWith<$Res>
    implements $PlayerModelCopyWith<$Res> {
  factory _$$_PlayerModelCopyWith(
          _$_PlayerModel value, $Res Function(_$_PlayerModel) then) =
      __$$_PlayerModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String editName,
      TextEditingController playerNameInputController,
      bool showPreview,
      String? imagePath,
      bool visible});
}

/// @nodoc
class __$$_PlayerModelCopyWithImpl<$Res> extends _$PlayerModelCopyWithImpl<$Res>
    implements _$$_PlayerModelCopyWith<$Res> {
  __$$_PlayerModelCopyWithImpl(
      _$_PlayerModel _value, $Res Function(_$_PlayerModel) _then)
      : super(_value, (v) => _then(v as _$_PlayerModel));

  @override
  _$_PlayerModel get _value => super._value as _$_PlayerModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? editName = freezed,
    Object? playerNameInputController = freezed,
    Object? showPreview = freezed,
    Object? imagePath = freezed,
    Object? visible = freezed,
  }) {
    return _then(_$_PlayerModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      editName: editName == freezed
          ? _value.editName
          : editName // ignore: cast_nullable_to_non_nullable
              as String,
      playerNameInputController: playerNameInputController == freezed
          ? _value.playerNameInputController
          : playerNameInputController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      showPreview: showPreview == freezed
          ? _value.showPreview
          : showPreview // ignore: cast_nullable_to_non_nullable
              as bool,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      visible: visible == freezed
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PlayerModel implements _PlayerModel {
  const _$_PlayerModel(
      {required this.name,
      required this.editName,
      required this.playerNameInputController,
      required this.showPreview,
      required this.imagePath,
      required this.visible});

  @override
  final String name;
  @override
  final String editName;
  @override
  final TextEditingController playerNameInputController;
  @override
  final bool showPreview;
  @override
  final String? imagePath;
  @override
  final bool visible;

  @override
  String toString() {
    return 'PlayerModel(name: $name, editName: $editName, playerNameInputController: $playerNameInputController, showPreview: $showPreview, imagePath: $imagePath, visible: $visible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.editName, editName) &&
            const DeepCollectionEquality().equals(
                other.playerNameInputController, playerNameInputController) &&
            const DeepCollectionEquality()
                .equals(other.showPreview, showPreview) &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath) &&
            const DeepCollectionEquality().equals(other.visible, visible));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(editName),
      const DeepCollectionEquality().hash(playerNameInputController),
      const DeepCollectionEquality().hash(showPreview),
      const DeepCollectionEquality().hash(imagePath),
      const DeepCollectionEquality().hash(visible));

  @JsonKey(ignore: true)
  @override
  _$$_PlayerModelCopyWith<_$_PlayerModel> get copyWith =>
      __$$_PlayerModelCopyWithImpl<_$_PlayerModel>(this, _$identity);
}

abstract class _PlayerModel implements PlayerModel {
  const factory _PlayerModel(
      {required final String name,
      required final String editName,
      required final TextEditingController playerNameInputController,
      required final bool showPreview,
      required final String? imagePath,
      required final bool visible}) = _$_PlayerModel;

  @override
  String get name;
  @override
  String get editName;
  @override
  TextEditingController get playerNameInputController;
  @override
  bool get showPreview;
  @override
  String? get imagePath;
  @override
  bool get visible;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerModelCopyWith<_$_PlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
