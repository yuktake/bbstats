// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TeamModel {
  String get name => throw _privateConstructorUsedError;
  String get editName => throw _privateConstructorUsedError;
  TextEditingController get teamNameInputController =>
      throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  bool get showPreview => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeamModelCopyWith<TeamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamModelCopyWith<$Res> {
  factory $TeamModelCopyWith(TeamModel value, $Res Function(TeamModel) then) =
      _$TeamModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String editName,
      TextEditingController teamNameInputController,
      String? image,
      bool showPreview});
}

/// @nodoc
class _$TeamModelCopyWithImpl<$Res> implements $TeamModelCopyWith<$Res> {
  _$TeamModelCopyWithImpl(this._value, this._then);

  final TeamModel _value;
  // ignore: unused_field
  final $Res Function(TeamModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? editName = freezed,
    Object? teamNameInputController = freezed,
    Object? image = freezed,
    Object? showPreview = freezed,
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
      teamNameInputController: teamNameInputController == freezed
          ? _value.teamNameInputController
          : teamNameInputController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      showPreview: showPreview == freezed
          ? _value.showPreview
          : showPreview // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_TeamModelCopyWith<$Res> implements $TeamModelCopyWith<$Res> {
  factory _$$_TeamModelCopyWith(
          _$_TeamModel value, $Res Function(_$_TeamModel) then) =
      __$$_TeamModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String editName,
      TextEditingController teamNameInputController,
      String? image,
      bool showPreview});
}

/// @nodoc
class __$$_TeamModelCopyWithImpl<$Res> extends _$TeamModelCopyWithImpl<$Res>
    implements _$$_TeamModelCopyWith<$Res> {
  __$$_TeamModelCopyWithImpl(
      _$_TeamModel _value, $Res Function(_$_TeamModel) _then)
      : super(_value, (v) => _then(v as _$_TeamModel));

  @override
  _$_TeamModel get _value => super._value as _$_TeamModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? editName = freezed,
    Object? teamNameInputController = freezed,
    Object? image = freezed,
    Object? showPreview = freezed,
  }) {
    return _then(_$_TeamModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      editName: editName == freezed
          ? _value.editName
          : editName // ignore: cast_nullable_to_non_nullable
              as String,
      teamNameInputController: teamNameInputController == freezed
          ? _value.teamNameInputController
          : teamNameInputController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      showPreview: showPreview == freezed
          ? _value.showPreview
          : showPreview // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TeamModel implements _TeamModel {
  const _$_TeamModel(
      {required this.name,
      required this.editName,
      required this.teamNameInputController,
      required this.image,
      required this.showPreview});

  @override
  final String name;
  @override
  final String editName;
  @override
  final TextEditingController teamNameInputController;
  @override
  final String? image;
  @override
  final bool showPreview;

  @override
  String toString() {
    return 'TeamModel(name: $name, editName: $editName, teamNameInputController: $teamNameInputController, image: $image, showPreview: $showPreview)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.editName, editName) &&
            const DeepCollectionEquality().equals(
                other.teamNameInputController, teamNameInputController) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality()
                .equals(other.showPreview, showPreview));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(editName),
      const DeepCollectionEquality().hash(teamNameInputController),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(showPreview));

  @JsonKey(ignore: true)
  @override
  _$$_TeamModelCopyWith<_$_TeamModel> get copyWith =>
      __$$_TeamModelCopyWithImpl<_$_TeamModel>(this, _$identity);
}

abstract class _TeamModel implements TeamModel {
  const factory _TeamModel(
      {required final String name,
      required final String editName,
      required final TextEditingController teamNameInputController,
      required final String? image,
      required final bool showPreview}) = _$_TeamModel;

  @override
  String get name;
  @override
  String get editName;
  @override
  TextEditingController get teamNameInputController;
  @override
  String? get image;
  @override
  bool get showPreview;
  @override
  @JsonKey(ignore: true)
  _$$_TeamModelCopyWith<_$_TeamModel> get copyWith =>
      throw _privateConstructorUsedError;
}
