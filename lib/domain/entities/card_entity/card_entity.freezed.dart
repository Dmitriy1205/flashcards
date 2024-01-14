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
  String? get id => throw _privateConstructorUsedError;
  String get front => throw _privateConstructorUsedError;
  String get back => throw _privateConstructorUsedError;

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
  $Res call({String? id, String front, String back});
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
    Object? id = freezed,
    Object? front = null,
    Object? back = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      front: null == front
          ? _value.front
          : front // ignore: cast_nullable_to_non_nullable
              as String,
      back: null == back
          ? _value.back
          : back // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String? id, String front, String back});
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
    Object? id = freezed,
    Object? front = null,
    Object? back = null,
  }) {
    return _then(_$CardEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      front: null == front
          ? _value.front
          : front // ignore: cast_nullable_to_non_nullable
              as String,
      back: null == back
          ? _value.back
          : back // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardEntityImpl implements _CardEntity {
  _$CardEntityImpl({this.id, required this.front, required this.back});

  factory _$CardEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardEntityImplFromJson(json);

  @override
  final String? id;
  @override
  final String front;
  @override
  final String back;

  @override
  String toString() {
    return 'CardEntity(id: $id, front: $front, back: $back)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.front, front) || other.front == front) &&
            (identical(other.back, back) || other.back == back));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, front, back);

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
      {final String? id,
      required final String front,
      required final String back}) = _$CardEntityImpl;

  factory _CardEntity.fromJson(Map<String, dynamic> json) =
      _$CardEntityImpl.fromJson;

  @override
  String? get id;
  @override
  String get front;
  @override
  String get back;
  @override
  @JsonKey(ignore: true)
  _$$CardEntityImplCopyWith<_$CardEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
