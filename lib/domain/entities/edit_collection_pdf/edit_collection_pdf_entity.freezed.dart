// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_collection_pdf_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EditCollectionPdfEntity _$EditCollectionPdfEntityFromJson(
    Map<String, dynamic> json) {
  return _EditCollectionPdfEntity.fromJson(json);
}

/// @nodoc
mixin _$EditCollectionPdfEntity {
  String? get localPath => throw _privateConstructorUsedError;
  String? get remoteCollectionPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditCollectionPdfEntityCopyWith<EditCollectionPdfEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditCollectionPdfEntityCopyWith<$Res> {
  factory $EditCollectionPdfEntityCopyWith(EditCollectionPdfEntity value,
          $Res Function(EditCollectionPdfEntity) then) =
      _$EditCollectionPdfEntityCopyWithImpl<$Res, EditCollectionPdfEntity>;
  @useResult
  $Res call({String? localPath, String? remoteCollectionPath});
}

/// @nodoc
class _$EditCollectionPdfEntityCopyWithImpl<$Res,
        $Val extends EditCollectionPdfEntity>
    implements $EditCollectionPdfEntityCopyWith<$Res> {
  _$EditCollectionPdfEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localPath = freezed,
    Object? remoteCollectionPath = freezed,
  }) {
    return _then(_value.copyWith(
      localPath: freezed == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteCollectionPath: freezed == remoteCollectionPath
          ? _value.remoteCollectionPath
          : remoteCollectionPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditCollectionPdfEntityImplCopyWith<$Res>
    implements $EditCollectionPdfEntityCopyWith<$Res> {
  factory _$$EditCollectionPdfEntityImplCopyWith(
          _$EditCollectionPdfEntityImpl value,
          $Res Function(_$EditCollectionPdfEntityImpl) then) =
      __$$EditCollectionPdfEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? localPath, String? remoteCollectionPath});
}

/// @nodoc
class __$$EditCollectionPdfEntityImplCopyWithImpl<$Res>
    extends _$EditCollectionPdfEntityCopyWithImpl<$Res,
        _$EditCollectionPdfEntityImpl>
    implements _$$EditCollectionPdfEntityImplCopyWith<$Res> {
  __$$EditCollectionPdfEntityImplCopyWithImpl(
      _$EditCollectionPdfEntityImpl _value,
      $Res Function(_$EditCollectionPdfEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localPath = freezed,
    Object? remoteCollectionPath = freezed,
  }) {
    return _then(_$EditCollectionPdfEntityImpl(
      localPath: freezed == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteCollectionPath: freezed == remoteCollectionPath
          ? _value.remoteCollectionPath
          : remoteCollectionPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditCollectionPdfEntityImpl extends _EditCollectionPdfEntity {
  const _$EditCollectionPdfEntityImpl(
      {this.localPath, this.remoteCollectionPath})
      : super._();

  factory _$EditCollectionPdfEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditCollectionPdfEntityImplFromJson(json);

  @override
  final String? localPath;
  @override
  final String? remoteCollectionPath;

  @override
  String toString() {
    return 'EditCollectionPdfEntity(localPath: $localPath, remoteCollectionPath: $remoteCollectionPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditCollectionPdfEntityImpl &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath) &&
            (identical(other.remoteCollectionPath, remoteCollectionPath) ||
                other.remoteCollectionPath == remoteCollectionPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, localPath, remoteCollectionPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditCollectionPdfEntityImplCopyWith<_$EditCollectionPdfEntityImpl>
      get copyWith => __$$EditCollectionPdfEntityImplCopyWithImpl<
          _$EditCollectionPdfEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditCollectionPdfEntityImplToJson(
      this,
    );
  }
}

abstract class _EditCollectionPdfEntity extends EditCollectionPdfEntity {
  const factory _EditCollectionPdfEntity(
      {final String? localPath,
      final String? remoteCollectionPath}) = _$EditCollectionPdfEntityImpl;
  const _EditCollectionPdfEntity._() : super._();

  factory _EditCollectionPdfEntity.fromJson(Map<String, dynamic> json) =
      _$EditCollectionPdfEntityImpl.fromJson;

  @override
  String? get localPath;
  @override
  String? get remoteCollectionPath;
  @override
  @JsonKey(ignore: true)
  _$$EditCollectionPdfEntityImplCopyWith<_$EditCollectionPdfEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
