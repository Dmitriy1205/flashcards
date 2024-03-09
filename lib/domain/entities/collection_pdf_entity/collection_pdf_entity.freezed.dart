// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_pdf_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CollectionPdfEntity _$CollectionPdfEntityFromJson(Map<String, dynamic> json) {
  return _CollectionPdfEntity.fromJson(json);
}

/// @nodoc
mixin _$CollectionPdfEntity {
  String get id => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: FirebaseTimestampConverters.fromTimestamp, includeToJson: false)
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectionPdfEntityCopyWith<CollectionPdfEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionPdfEntityCopyWith<$Res> {
  factory $CollectionPdfEntityCopyWith(
          CollectionPdfEntity value, $Res Function(CollectionPdfEntity) then) =
      _$CollectionPdfEntityCopyWithImpl<$Res, CollectionPdfEntity>;
  @useResult
  $Res call(
      {String id,
      String path,
      @JsonKey(
          fromJson: FirebaseTimestampConverters.fromTimestamp,
          includeToJson: false)
      DateTime createdAt});
}

/// @nodoc
class _$CollectionPdfEntityCopyWithImpl<$Res, $Val extends CollectionPdfEntity>
    implements $CollectionPdfEntityCopyWith<$Res> {
  _$CollectionPdfEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionPdfEntityImplCopyWith<$Res>
    implements $CollectionPdfEntityCopyWith<$Res> {
  factory _$$CollectionPdfEntityImplCopyWith(_$CollectionPdfEntityImpl value,
          $Res Function(_$CollectionPdfEntityImpl) then) =
      __$$CollectionPdfEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String path,
      @JsonKey(
          fromJson: FirebaseTimestampConverters.fromTimestamp,
          includeToJson: false)
      DateTime createdAt});
}

/// @nodoc
class __$$CollectionPdfEntityImplCopyWithImpl<$Res>
    extends _$CollectionPdfEntityCopyWithImpl<$Res, _$CollectionPdfEntityImpl>
    implements _$$CollectionPdfEntityImplCopyWith<$Res> {
  __$$CollectionPdfEntityImplCopyWithImpl(_$CollectionPdfEntityImpl _value,
      $Res Function(_$CollectionPdfEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
    Object? createdAt = null,
  }) {
    return _then(_$CollectionPdfEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionPdfEntityImpl extends _CollectionPdfEntity {
  const _$CollectionPdfEntityImpl(
      {required this.id,
      required this.path,
      @JsonKey(
          fromJson: FirebaseTimestampConverters.fromTimestamp,
          includeToJson: false)
      required this.createdAt})
      : super._();

  factory _$CollectionPdfEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectionPdfEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String path;
  @override
  @JsonKey(
      fromJson: FirebaseTimestampConverters.fromTimestamp, includeToJson: false)
  final DateTime createdAt;

  @override
  String toString() {
    return 'CollectionPdfEntity(id: $id, path: $path, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionPdfEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, path, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionPdfEntityImplCopyWith<_$CollectionPdfEntityImpl> get copyWith =>
      __$$CollectionPdfEntityImplCopyWithImpl<_$CollectionPdfEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionPdfEntityImplToJson(
      this,
    );
  }
}

abstract class _CollectionPdfEntity extends CollectionPdfEntity {
  const factory _CollectionPdfEntity(
      {required final String id,
      required final String path,
      @JsonKey(
          fromJson: FirebaseTimestampConverters.fromTimestamp,
          includeToJson: false)
      required final DateTime createdAt}) = _$CollectionPdfEntityImpl;
  const _CollectionPdfEntity._() : super._();

  factory _CollectionPdfEntity.fromJson(Map<String, dynamic> json) =
      _$CollectionPdfEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get path;
  @override
  @JsonKey(
      fromJson: FirebaseTimestampConverters.fromTimestamp, includeToJson: false)
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$CollectionPdfEntityImplCopyWith<_$CollectionPdfEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
