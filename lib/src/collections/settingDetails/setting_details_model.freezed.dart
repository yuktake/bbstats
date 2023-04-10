// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setting_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingDetailsModel {
  int get quarterMin => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingDetailsModelCopyWith<SettingDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingDetailsModelCopyWith<$Res> {
  factory $SettingDetailsModelCopyWith(
          SettingDetailsModel value, $Res Function(SettingDetailsModel) then) =
      _$SettingDetailsModelCopyWithImpl<$Res>;
  $Res call({int quarterMin});
}

/// @nodoc
class _$SettingDetailsModelCopyWithImpl<$Res>
    implements $SettingDetailsModelCopyWith<$Res> {
  _$SettingDetailsModelCopyWithImpl(this._value, this._then);

  final SettingDetailsModel _value;
  // ignore: unused_field
  final $Res Function(SettingDetailsModel) _then;

  @override
  $Res call({
    Object? quarterMin = freezed,
  }) {
    return _then(_value.copyWith(
      quarterMin: quarterMin == freezed
          ? _value.quarterMin
          : quarterMin // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_SettingDetailsModelCopyWith<$Res>
    implements $SettingDetailsModelCopyWith<$Res> {
  factory _$$_SettingDetailsModelCopyWith(_$_SettingDetailsModel value,
          $Res Function(_$_SettingDetailsModel) then) =
      __$$_SettingDetailsModelCopyWithImpl<$Res>;
  @override
  $Res call({int quarterMin});
}

/// @nodoc
class __$$_SettingDetailsModelCopyWithImpl<$Res>
    extends _$SettingDetailsModelCopyWithImpl<$Res>
    implements _$$_SettingDetailsModelCopyWith<$Res> {
  __$$_SettingDetailsModelCopyWithImpl(_$_SettingDetailsModel _value,
      $Res Function(_$_SettingDetailsModel) _then)
      : super(_value, (v) => _then(v as _$_SettingDetailsModel));

  @override
  _$_SettingDetailsModel get _value => super._value as _$_SettingDetailsModel;

  @override
  $Res call({
    Object? quarterMin = freezed,
  }) {
    return _then(_$_SettingDetailsModel(
      quarterMin: quarterMin == freezed
          ? _value.quarterMin
          : quarterMin // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SettingDetailsModel implements _SettingDetailsModel {
  const _$_SettingDetailsModel({required this.quarterMin});

  @override
  final int quarterMin;

  @override
  String toString() {
    return 'SettingDetailsModel(quarterMin: $quarterMin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingDetailsModel &&
            const DeepCollectionEquality()
                .equals(other.quarterMin, quarterMin));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(quarterMin));

  @JsonKey(ignore: true)
  @override
  _$$_SettingDetailsModelCopyWith<_$_SettingDetailsModel> get copyWith =>
      __$$_SettingDetailsModelCopyWithImpl<_$_SettingDetailsModel>(
          this, _$identity);
}

abstract class _SettingDetailsModel implements SettingDetailsModel {
  const factory _SettingDetailsModel({required final int quarterMin}) =
      _$_SettingDetailsModel;

  @override
  int get quarterMin;
  @override
  @JsonKey(ignore: true)
  _$$_SettingDetailsModelCopyWith<_$_SettingDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
