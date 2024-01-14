// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardEntity _$CardEntityFromJson(Map<String, dynamic> json) {
  return _CardEntity.fromJson(json);
}

/// @nodoc
mixin _$CardEntity {

  String get id => throw _privateConstructorUsedError;

  String get front => throw _privateConstructorUsedError;
  String get back => throw _privateConstructorUsedError;
  List<String>? get frontImages => throw _privateConstructorUsedError;
  List<String>? get backImages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardEntityCopyWith<CardEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardEntityCopyWith<$Res> {
  factory $CardEntityCopyWith(
          CardEntity value, $Res Function(CardEntity) then) =
      _$CardEntityCopyWithImpl<$Res, CardEntity>;
  @useResult

  $Res call(
      {String id,
      String front,
      String back,
      List<String>? frontImages,
      List<String>? backImages});

}

/// @nodoc
class _$CardEntityCopyWithImpl<$Res, $Val extends CardEntity>
    implements $CardEntityCopyWith<$Res> {
  _$CardEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({

    Object? id = null,

    Object? front = null,
    Object? back = null,
    Object? frontImages = freezed,
    Object? backImages = freezed,
  }) {
    return _then(_value.copyWith(

      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,

      front: null == front
          ? _value.front
          : front // ignore: cast_nullable_to_non_nullable
              as String,
      back: null == back
          ? _value.back
          : back // ignore: cast_nullable_to_non_nullable
              as String,
      frontImages: freezed == frontImages
          ? _value.frontImages
          : frontImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      backImages: freezed == backImages
          ? _value.backImages
          : backImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardEntityImplCopyWith<$Res>
    implements $CardEntityCopyWith<$Res> {
  factory _$$CardEntityImplCopyWith(
          _$CardEntityImpl value, $Res Function(_$CardEntityImpl) then) =
      __$$CardEntityImplCopyWithImpl<$Res>;
  @override
  @useResult

  $Res call(
      {String id,
      String front,
      String back,
      List<String>? frontImages,
      List<String>? backImages});

}

/// @nodoc
class __$$CardEntityImplCopyWithImpl<$Res>
    extends _$CardEntityCopyWithImpl<$Res, _$CardEntityImpl>
    implements _$$CardEntityImplCopyWith<$Res> {
  __$$CardEntityImplCopyWithImpl(
      _$CardEntityImpl _value, $Res Function(_$CardEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({

    Object? id = null,

    Object? front = null,
    Object? back = null,
    Object? frontImages = freezed,
    Object? backImages = freezed,
  }) {
    return _then(_$CardEntityImpl(

      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,

      front: null == front
          ? _value.front
          : front // ignore: cast_nullable_to_non_nullable
              as String,
      back: null == back
          ? _value.back
          : back // ignore: cast_nullable_to_non_nullable
              as String,
      frontImages: freezed == frontImages
          ? _value._frontImages
          : frontImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      backImages: freezed == backImages
          ? _value._backImages
          : backImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardEntityImpl implements _CardEntity {

  _$CardEntityImpl(
      {required this.id,
      required this.front,
      required this.back,
      final List<String>? frontImages,
      final List<String>? backImages})
      : _frontImages = frontImages,
        _backImages = backImages;


  factory _$CardEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardEntityImplFromJson(json);

  @override

  final String id;

  @override
  final String front;
  @override
  final String back;
  final List<String>? _frontImages;
  @override
  List<String>? get frontImages {
    final value = _frontImages;
    if (value == null) return null;
    if (_frontImages is EqualUnmodifiableListView) return _frontImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _backImages;
  @override
  List<String>? get backImages {
    final value = _backImages;
    if (value == null) return null;
    if (_backImages is EqualUnmodifiableListView) return _backImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {

    return 'CardEntity(id: $id, front: $front, back: $back, frontImages: $frontImages, backImages: $backImages)';

  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.front, front) || other.front == front) &&
            (identical(other.back, back) || other.back == back) &&
            const DeepCollectionEquality()
                .equals(other._frontImages, _frontImages) &&
            const DeepCollectionEquality()
                .equals(other._backImages, _backImages));
  }

  @JsonKey(ignore: true)
  @override

  int get hashCode => Object.hash(
      runtimeType,
      id,
      front,
      back,
      const DeepCollectionEquality().hash(_frontImages),
      const DeepCollectionEquality().hash(_backImages));


  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardEntityImplCopyWith<_$CardEntityImpl> get copyWith =>
      __$$CardEntityImplCopyWithImpl<_$CardEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardEntityImplToJson(
      this,
    );
  }
}

abstract class _CardEntity implements CardEntity {
  factory _CardEntity(

      {required final String id,
      required final String front,
      required final String back,
      final List<String>? frontImages,
      final List<String>? backImages}) = _$CardEntityImpl;


  factory _CardEntity.fromJson(Map<String, dynamic> json) =
      _$CardEntityImpl.fromJson;

  @override

  String get id;

  @override
  String get front;
  @override
  String get back;
  @override
  List<String>? get frontImages;
  @override
  List<String>? get backImages;
  @override
  @JsonKey(ignore: true)
  _$$CardEntityImplCopyWith<_$CardEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
