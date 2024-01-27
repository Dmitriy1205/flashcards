// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lists_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isEditMode) started,
    required TResult Function(CollectionEntity collection) selectCollection,
    required TResult Function(String name) createNewList,
    required TResult Function(String name, String id) editListName,
    required TResult Function(List<CollectionEntity> collectionsList)
        deleteSelectedCollection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isEditMode)? started,
    TResult? Function(CollectionEntity collection)? selectCollection,
    TResult? Function(String name)? createNewList,
    TResult? Function(String name, String id)? editListName,
    TResult? Function(List<CollectionEntity> collectionsList)?
        deleteSelectedCollection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isEditMode)? started,
    TResult Function(CollectionEntity collection)? selectCollection,
    TResult Function(String name)? createNewList,
    TResult Function(String name, String id)? editListName,
    TResult Function(List<CollectionEntity> collectionsList)?
        deleteSelectedCollection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectCollection value) selectCollection,
    required TResult Function(_CreateNewList value) createNewList,
    required TResult Function(_EditListName value) editListName,
    required TResult Function(_DeleteSelecteCollection value)
        deleteSelectedCollection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectCollection value)? selectCollection,
    TResult? Function(_CreateNewList value)? createNewList,
    TResult? Function(_EditListName value)? editListName,
    TResult? Function(_DeleteSelecteCollection value)? deleteSelectedCollection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectCollection value)? selectCollection,
    TResult Function(_CreateNewList value)? createNewList,
    TResult Function(_EditListName value)? editListName,
    TResult Function(_DeleteSelecteCollection value)? deleteSelectedCollection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListsEventCopyWith<$Res> {
  factory $ListsEventCopyWith(
          ListsEvent value, $Res Function(ListsEvent) then) =
      _$ListsEventCopyWithImpl<$Res, ListsEvent>;
}

/// @nodoc
class _$ListsEventCopyWithImpl<$Res, $Val extends ListsEvent>
    implements $ListsEventCopyWith<$Res> {
  _$ListsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isEditMode});
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$ListsEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEditMode = null,
  }) {
    return _then(_$StartedImpl(
      isEditMode: null == isEditMode
          ? _value.isEditMode
          : isEditMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl({required this.isEditMode});

  @override
  final bool isEditMode;

  @override
  String toString() {
    return 'ListsEvent.started(isEditMode: $isEditMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            (identical(other.isEditMode, isEditMode) ||
                other.isEditMode == isEditMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEditMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isEditMode) started,
    required TResult Function(CollectionEntity collection) selectCollection,
    required TResult Function(String name) createNewList,
    required TResult Function(String name, String id) editListName,
    required TResult Function(List<CollectionEntity> collectionsList)
        deleteSelectedCollection,
  }) {
    return started(isEditMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isEditMode)? started,
    TResult? Function(CollectionEntity collection)? selectCollection,
    TResult? Function(String name)? createNewList,
    TResult? Function(String name, String id)? editListName,
    TResult? Function(List<CollectionEntity> collectionsList)?
        deleteSelectedCollection,
  }) {
    return started?.call(isEditMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isEditMode)? started,
    TResult Function(CollectionEntity collection)? selectCollection,
    TResult Function(String name)? createNewList,
    TResult Function(String name, String id)? editListName,
    TResult Function(List<CollectionEntity> collectionsList)?
        deleteSelectedCollection,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(isEditMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectCollection value) selectCollection,
    required TResult Function(_CreateNewList value) createNewList,
    required TResult Function(_EditListName value) editListName,
    required TResult Function(_DeleteSelecteCollection value)
        deleteSelectedCollection,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectCollection value)? selectCollection,
    TResult? Function(_CreateNewList value)? createNewList,
    TResult? Function(_EditListName value)? editListName,
    TResult? Function(_DeleteSelecteCollection value)? deleteSelectedCollection,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectCollection value)? selectCollection,
    TResult Function(_CreateNewList value)? createNewList,
    TResult Function(_EditListName value)? editListName,
    TResult Function(_DeleteSelecteCollection value)? deleteSelectedCollection,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ListsEvent {
  const factory _Started({required final bool isEditMode}) = _$StartedImpl;

  bool get isEditMode;
  @JsonKey(ignore: true)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectCollectionImplCopyWith<$Res> {
  factory _$$SelectCollectionImplCopyWith(_$SelectCollectionImpl value,
          $Res Function(_$SelectCollectionImpl) then) =
      __$$SelectCollectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CollectionEntity collection});

  $CollectionEntityCopyWith<$Res> get collection;
}

/// @nodoc
class __$$SelectCollectionImplCopyWithImpl<$Res>
    extends _$ListsEventCopyWithImpl<$Res, _$SelectCollectionImpl>
    implements _$$SelectCollectionImplCopyWith<$Res> {
  __$$SelectCollectionImplCopyWithImpl(_$SelectCollectionImpl _value,
      $Res Function(_$SelectCollectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
  }) {
    return _then(_$SelectCollectionImpl(
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as CollectionEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CollectionEntityCopyWith<$Res> get collection {
    return $CollectionEntityCopyWith<$Res>(_value.collection, (value) {
      return _then(_value.copyWith(collection: value));
    });
  }
}

/// @nodoc

class _$SelectCollectionImpl implements _SelectCollection {
  const _$SelectCollectionImpl({required this.collection});

  @override
  final CollectionEntity collection;

  @override
  String toString() {
    return 'ListsEvent.selectCollection(collection: $collection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCollectionImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCollectionImplCopyWith<_$SelectCollectionImpl> get copyWith =>
      __$$SelectCollectionImplCopyWithImpl<_$SelectCollectionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isEditMode) started,
    required TResult Function(CollectionEntity collection) selectCollection,
    required TResult Function(String name) createNewList,
    required TResult Function(String name, String id) editListName,
    required TResult Function(List<CollectionEntity> collectionsList)
        deleteSelectedCollection,
  }) {
    return selectCollection(collection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isEditMode)? started,
    TResult? Function(CollectionEntity collection)? selectCollection,
    TResult? Function(String name)? createNewList,
    TResult? Function(String name, String id)? editListName,
    TResult? Function(List<CollectionEntity> collectionsList)?
        deleteSelectedCollection,
  }) {
    return selectCollection?.call(collection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isEditMode)? started,
    TResult Function(CollectionEntity collection)? selectCollection,
    TResult Function(String name)? createNewList,
    TResult Function(String name, String id)? editListName,
    TResult Function(List<CollectionEntity> collectionsList)?
        deleteSelectedCollection,
    required TResult orElse(),
  }) {
    if (selectCollection != null) {
      return selectCollection(collection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectCollection value) selectCollection,
    required TResult Function(_CreateNewList value) createNewList,
    required TResult Function(_EditListName value) editListName,
    required TResult Function(_DeleteSelecteCollection value)
        deleteSelectedCollection,
  }) {
    return selectCollection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectCollection value)? selectCollection,
    TResult? Function(_CreateNewList value)? createNewList,
    TResult? Function(_EditListName value)? editListName,
    TResult? Function(_DeleteSelecteCollection value)? deleteSelectedCollection,
  }) {
    return selectCollection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectCollection value)? selectCollection,
    TResult Function(_CreateNewList value)? createNewList,
    TResult Function(_EditListName value)? editListName,
    TResult Function(_DeleteSelecteCollection value)? deleteSelectedCollection,
    required TResult orElse(),
  }) {
    if (selectCollection != null) {
      return selectCollection(this);
    }
    return orElse();
  }
}

abstract class _SelectCollection implements ListsEvent {
  const factory _SelectCollection(
      {required final CollectionEntity collection}) = _$SelectCollectionImpl;

  CollectionEntity get collection;
  @JsonKey(ignore: true)
  _$$SelectCollectionImplCopyWith<_$SelectCollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateNewListImplCopyWith<$Res> {
  factory _$$CreateNewListImplCopyWith(
          _$CreateNewListImpl value, $Res Function(_$CreateNewListImpl) then) =
      __$$CreateNewListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$CreateNewListImplCopyWithImpl<$Res>
    extends _$ListsEventCopyWithImpl<$Res, _$CreateNewListImpl>
    implements _$$CreateNewListImplCopyWith<$Res> {
  __$$CreateNewListImplCopyWithImpl(
      _$CreateNewListImpl _value, $Res Function(_$CreateNewListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$CreateNewListImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateNewListImpl implements _CreateNewList {
  const _$CreateNewListImpl({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'ListsEvent.createNewList(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNewListImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNewListImplCopyWith<_$CreateNewListImpl> get copyWith =>
      __$$CreateNewListImplCopyWithImpl<_$CreateNewListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isEditMode) started,
    required TResult Function(CollectionEntity collection) selectCollection,
    required TResult Function(String name) createNewList,
    required TResult Function(String name, String id) editListName,
    required TResult Function(List<CollectionEntity> collectionsList)
        deleteSelectedCollection,
  }) {
    return createNewList(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isEditMode)? started,
    TResult? Function(CollectionEntity collection)? selectCollection,
    TResult? Function(String name)? createNewList,
    TResult? Function(String name, String id)? editListName,
    TResult? Function(List<CollectionEntity> collectionsList)?
        deleteSelectedCollection,
  }) {
    return createNewList?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isEditMode)? started,
    TResult Function(CollectionEntity collection)? selectCollection,
    TResult Function(String name)? createNewList,
    TResult Function(String name, String id)? editListName,
    TResult Function(List<CollectionEntity> collectionsList)?
        deleteSelectedCollection,
    required TResult orElse(),
  }) {
    if (createNewList != null) {
      return createNewList(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectCollection value) selectCollection,
    required TResult Function(_CreateNewList value) createNewList,
    required TResult Function(_EditListName value) editListName,
    required TResult Function(_DeleteSelecteCollection value)
        deleteSelectedCollection,
  }) {
    return createNewList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectCollection value)? selectCollection,
    TResult? Function(_CreateNewList value)? createNewList,
    TResult? Function(_EditListName value)? editListName,
    TResult? Function(_DeleteSelecteCollection value)? deleteSelectedCollection,
  }) {
    return createNewList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectCollection value)? selectCollection,
    TResult Function(_CreateNewList value)? createNewList,
    TResult Function(_EditListName value)? editListName,
    TResult Function(_DeleteSelecteCollection value)? deleteSelectedCollection,
    required TResult orElse(),
  }) {
    if (createNewList != null) {
      return createNewList(this);
    }
    return orElse();
  }
}

abstract class _CreateNewList implements ListsEvent {
  const factory _CreateNewList({required final String name}) =
      _$CreateNewListImpl;

  String get name;
  @JsonKey(ignore: true)
  _$$CreateNewListImplCopyWith<_$CreateNewListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditListNameImplCopyWith<$Res> {
  factory _$$EditListNameImplCopyWith(
          _$EditListNameImpl value, $Res Function(_$EditListNameImpl) then) =
      __$$EditListNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String id});
}

/// @nodoc
class __$$EditListNameImplCopyWithImpl<$Res>
    extends _$ListsEventCopyWithImpl<$Res, _$EditListNameImpl>
    implements _$$EditListNameImplCopyWith<$Res> {
  __$$EditListNameImplCopyWithImpl(
      _$EditListNameImpl _value, $Res Function(_$EditListNameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_$EditListNameImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditListNameImpl implements _EditListName {
  const _$EditListNameImpl({required this.name, required this.id});

  @override
  final String name;
  @override
  final String id;

  @override
  String toString() {
    return 'ListsEvent.editListName(name: $name, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditListNameImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditListNameImplCopyWith<_$EditListNameImpl> get copyWith =>
      __$$EditListNameImplCopyWithImpl<_$EditListNameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isEditMode) started,
    required TResult Function(CollectionEntity collection) selectCollection,
    required TResult Function(String name) createNewList,
    required TResult Function(String name, String id) editListName,
    required TResult Function(List<CollectionEntity> collectionsList)
        deleteSelectedCollection,
  }) {
    return editListName(name, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isEditMode)? started,
    TResult? Function(CollectionEntity collection)? selectCollection,
    TResult? Function(String name)? createNewList,
    TResult? Function(String name, String id)? editListName,
    TResult? Function(List<CollectionEntity> collectionsList)?
        deleteSelectedCollection,
  }) {
    return editListName?.call(name, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isEditMode)? started,
    TResult Function(CollectionEntity collection)? selectCollection,
    TResult Function(String name)? createNewList,
    TResult Function(String name, String id)? editListName,
    TResult Function(List<CollectionEntity> collectionsList)?
        deleteSelectedCollection,
    required TResult orElse(),
  }) {
    if (editListName != null) {
      return editListName(name, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectCollection value) selectCollection,
    required TResult Function(_CreateNewList value) createNewList,
    required TResult Function(_EditListName value) editListName,
    required TResult Function(_DeleteSelecteCollection value)
        deleteSelectedCollection,
  }) {
    return editListName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectCollection value)? selectCollection,
    TResult? Function(_CreateNewList value)? createNewList,
    TResult? Function(_EditListName value)? editListName,
    TResult? Function(_DeleteSelecteCollection value)? deleteSelectedCollection,
  }) {
    return editListName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectCollection value)? selectCollection,
    TResult Function(_CreateNewList value)? createNewList,
    TResult Function(_EditListName value)? editListName,
    TResult Function(_DeleteSelecteCollection value)? deleteSelectedCollection,
    required TResult orElse(),
  }) {
    if (editListName != null) {
      return editListName(this);
    }
    return orElse();
  }
}

abstract class _EditListName implements ListsEvent {
  const factory _EditListName(
      {required final String name,
      required final String id}) = _$EditListNameImpl;

  String get name;
  String get id;
  @JsonKey(ignore: true)
  _$$EditListNameImplCopyWith<_$EditListNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteSelecteCollectionImplCopyWith<$Res> {
  factory _$$DeleteSelecteCollectionImplCopyWith(
          _$DeleteSelecteCollectionImpl value,
          $Res Function(_$DeleteSelecteCollectionImpl) then) =
      __$$DeleteSelecteCollectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CollectionEntity> collectionsList});
}

/// @nodoc
class __$$DeleteSelecteCollectionImplCopyWithImpl<$Res>
    extends _$ListsEventCopyWithImpl<$Res, _$DeleteSelecteCollectionImpl>
    implements _$$DeleteSelecteCollectionImplCopyWith<$Res> {
  __$$DeleteSelecteCollectionImplCopyWithImpl(
      _$DeleteSelecteCollectionImpl _value,
      $Res Function(_$DeleteSelecteCollectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionsList = null,
  }) {
    return _then(_$DeleteSelecteCollectionImpl(
      collectionsList: null == collectionsList
          ? _value._collectionsList
          : collectionsList // ignore: cast_nullable_to_non_nullable
              as List<CollectionEntity>,
    ));
  }
}

/// @nodoc

class _$DeleteSelecteCollectionImpl implements _DeleteSelecteCollection {
  const _$DeleteSelecteCollectionImpl(
      {required final List<CollectionEntity> collectionsList})
      : _collectionsList = collectionsList;

  final List<CollectionEntity> _collectionsList;
  @override
  List<CollectionEntity> get collectionsList {
    if (_collectionsList is EqualUnmodifiableListView) return _collectionsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collectionsList);
  }

  @override
  String toString() {
    return 'ListsEvent.deleteSelectedCollection(collectionsList: $collectionsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteSelecteCollectionImpl &&
            const DeepCollectionEquality()
                .equals(other._collectionsList, _collectionsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_collectionsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteSelecteCollectionImplCopyWith<_$DeleteSelecteCollectionImpl>
      get copyWith => __$$DeleteSelecteCollectionImplCopyWithImpl<
          _$DeleteSelecteCollectionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isEditMode) started,
    required TResult Function(CollectionEntity collection) selectCollection,
    required TResult Function(String name) createNewList,
    required TResult Function(String name, String id) editListName,
    required TResult Function(List<CollectionEntity> collectionsList)
        deleteSelectedCollection,
  }) {
    return deleteSelectedCollection(collectionsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isEditMode)? started,
    TResult? Function(CollectionEntity collection)? selectCollection,
    TResult? Function(String name)? createNewList,
    TResult? Function(String name, String id)? editListName,
    TResult? Function(List<CollectionEntity> collectionsList)?
        deleteSelectedCollection,
  }) {
    return deleteSelectedCollection?.call(collectionsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isEditMode)? started,
    TResult Function(CollectionEntity collection)? selectCollection,
    TResult Function(String name)? createNewList,
    TResult Function(String name, String id)? editListName,
    TResult Function(List<CollectionEntity> collectionsList)?
        deleteSelectedCollection,
    required TResult orElse(),
  }) {
    if (deleteSelectedCollection != null) {
      return deleteSelectedCollection(collectionsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectCollection value) selectCollection,
    required TResult Function(_CreateNewList value) createNewList,
    required TResult Function(_EditListName value) editListName,
    required TResult Function(_DeleteSelecteCollection value)
        deleteSelectedCollection,
  }) {
    return deleteSelectedCollection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectCollection value)? selectCollection,
    TResult? Function(_CreateNewList value)? createNewList,
    TResult? Function(_EditListName value)? editListName,
    TResult? Function(_DeleteSelecteCollection value)? deleteSelectedCollection,
  }) {
    return deleteSelectedCollection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectCollection value)? selectCollection,
    TResult Function(_CreateNewList value)? createNewList,
    TResult Function(_EditListName value)? editListName,
    TResult Function(_DeleteSelecteCollection value)? deleteSelectedCollection,
    required TResult orElse(),
  }) {
    if (deleteSelectedCollection != null) {
      return deleteSelectedCollection(this);
    }
    return orElse();
  }
}

abstract class _DeleteSelecteCollection implements ListsEvent {
  const factory _DeleteSelecteCollection(
          {required final List<CollectionEntity> collectionsList}) =
      _$DeleteSelecteCollectionImpl;

  List<CollectionEntity> get collectionsList;
  @JsonKey(ignore: true)
  _$$DeleteSelecteCollectionImplCopyWith<_$DeleteSelecteCollectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ListsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CollectionEntity collection) viewCards,
    required TResult Function() loading,
    required TResult Function() operationSucceeded,
    required TResult Function(List<CollectionEntity> collectionsList,
            bool isEditMode, List<String> listToDelete)
        viewCollections,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CollectionEntity collection)? viewCards,
    TResult? Function()? loading,
    TResult? Function()? operationSucceeded,
    TResult? Function(List<CollectionEntity> collectionsList, bool isEditMode,
            List<String> listToDelete)?
        viewCollections,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CollectionEntity collection)? viewCards,
    TResult Function()? loading,
    TResult Function()? operationSucceeded,
    TResult Function(List<CollectionEntity> collectionsList, bool isEditMode,
            List<String> listToDelete)?
        viewCollections,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ViewCards value) viewCards,
    required TResult Function(_Loading value) loading,
    required TResult Function(_OperationSucceeded value) operationSucceeded,
    required TResult Function(_ViewCollections value) viewCollections,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewCards value)? viewCards,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OperationSucceeded value)? operationSucceeded,
    TResult? Function(_ViewCollections value)? viewCollections,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewCards value)? viewCards,
    TResult Function(_Loading value)? loading,
    TResult Function(_OperationSucceeded value)? operationSucceeded,
    TResult Function(_ViewCollections value)? viewCollections,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListsStateCopyWith<$Res> {
  factory $ListsStateCopyWith(
          ListsState value, $Res Function(ListsState) then) =
      _$ListsStateCopyWithImpl<$Res, ListsState>;
}

/// @nodoc
class _$ListsStateCopyWithImpl<$Res, $Val extends ListsState>
    implements $ListsStateCopyWith<$Res> {
  _$ListsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ListsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl() : super._();

  @override
  String toString() {
    return 'ListsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CollectionEntity collection) viewCards,
    required TResult Function() loading,
    required TResult Function() operationSucceeded,
    required TResult Function(List<CollectionEntity> collectionsList,
            bool isEditMode, List<String> listToDelete)
        viewCollections,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CollectionEntity collection)? viewCards,
    TResult? Function()? loading,
    TResult? Function()? operationSucceeded,
    TResult? Function(List<CollectionEntity> collectionsList, bool isEditMode,
            List<String> listToDelete)?
        viewCollections,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CollectionEntity collection)? viewCards,
    TResult Function()? loading,
    TResult Function()? operationSucceeded,
    TResult Function(List<CollectionEntity> collectionsList, bool isEditMode,
            List<String> listToDelete)?
        viewCollections,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ViewCards value) viewCards,
    required TResult Function(_Loading value) loading,
    required TResult Function(_OperationSucceeded value) operationSucceeded,
    required TResult Function(_ViewCollections value) viewCollections,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewCards value)? viewCards,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OperationSucceeded value)? operationSucceeded,
    TResult? Function(_ViewCollections value)? viewCollections,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewCards value)? viewCards,
    TResult Function(_Loading value)? loading,
    TResult Function(_OperationSucceeded value)? operationSucceeded,
    TResult Function(_ViewCollections value)? viewCollections,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends ListsState {
  const factory _Initial() = _$InitialImpl;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$ViewCardsImplCopyWith<$Res> {
  factory _$$ViewCardsImplCopyWith(
          _$ViewCardsImpl value, $Res Function(_$ViewCardsImpl) then) =
      __$$ViewCardsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CollectionEntity collection});

  $CollectionEntityCopyWith<$Res> get collection;
}

/// @nodoc
class __$$ViewCardsImplCopyWithImpl<$Res>
    extends _$ListsStateCopyWithImpl<$Res, _$ViewCardsImpl>
    implements _$$ViewCardsImplCopyWith<$Res> {
  __$$ViewCardsImplCopyWithImpl(
      _$ViewCardsImpl _value, $Res Function(_$ViewCardsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
  }) {
    return _then(_$ViewCardsImpl(
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as CollectionEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CollectionEntityCopyWith<$Res> get collection {
    return $CollectionEntityCopyWith<$Res>(_value.collection, (value) {
      return _then(_value.copyWith(collection: value));
    });
  }
}

/// @nodoc

class _$ViewCardsImpl extends _ViewCards {
  const _$ViewCardsImpl({required this.collection}) : super._();

  @override
  final CollectionEntity collection;

  @override
  String toString() {
    return 'ListsState.viewCards(collection: $collection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewCardsImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewCardsImplCopyWith<_$ViewCardsImpl> get copyWith =>
      __$$ViewCardsImplCopyWithImpl<_$ViewCardsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CollectionEntity collection) viewCards,
    required TResult Function() loading,
    required TResult Function() operationSucceeded,
    required TResult Function(List<CollectionEntity> collectionsList,
            bool isEditMode, List<String> listToDelete)
        viewCollections,
    required TResult Function(String error) error,
  }) {
    return viewCards(collection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CollectionEntity collection)? viewCards,
    TResult? Function()? loading,
    TResult? Function()? operationSucceeded,
    TResult? Function(List<CollectionEntity> collectionsList, bool isEditMode,
            List<String> listToDelete)?
        viewCollections,
    TResult? Function(String error)? error,
  }) {
    return viewCards?.call(collection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CollectionEntity collection)? viewCards,
    TResult Function()? loading,
    TResult Function()? operationSucceeded,
    TResult Function(List<CollectionEntity> collectionsList, bool isEditMode,
            List<String> listToDelete)?
        viewCollections,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (viewCards != null) {
      return viewCards(collection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ViewCards value) viewCards,
    required TResult Function(_Loading value) loading,
    required TResult Function(_OperationSucceeded value) operationSucceeded,
    required TResult Function(_ViewCollections value) viewCollections,
    required TResult Function(_Error value) error,
  }) {
    return viewCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewCards value)? viewCards,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OperationSucceeded value)? operationSucceeded,
    TResult? Function(_ViewCollections value)? viewCollections,
    TResult? Function(_Error value)? error,
  }) {
    return viewCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewCards value)? viewCards,
    TResult Function(_Loading value)? loading,
    TResult Function(_OperationSucceeded value)? operationSucceeded,
    TResult Function(_ViewCollections value)? viewCollections,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (viewCards != null) {
      return viewCards(this);
    }
    return orElse();
  }
}

abstract class _ViewCards extends ListsState {
  const factory _ViewCards({required final CollectionEntity collection}) =
      _$ViewCardsImpl;
  const _ViewCards._() : super._();

  CollectionEntity get collection;
  @JsonKey(ignore: true)
  _$$ViewCardsImplCopyWith<_$ViewCardsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ListsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl() : super._();

  @override
  String toString() {
    return 'ListsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CollectionEntity collection) viewCards,
    required TResult Function() loading,
    required TResult Function() operationSucceeded,
    required TResult Function(List<CollectionEntity> collectionsList,
            bool isEditMode, List<String> listToDelete)
        viewCollections,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CollectionEntity collection)? viewCards,
    TResult? Function()? loading,
    TResult? Function()? operationSucceeded,
    TResult? Function(List<CollectionEntity> collectionsList, bool isEditMode,
            List<String> listToDelete)?
        viewCollections,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CollectionEntity collection)? viewCards,
    TResult Function()? loading,
    TResult Function()? operationSucceeded,
    TResult Function(List<CollectionEntity> collectionsList, bool isEditMode,
            List<String> listToDelete)?
        viewCollections,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ViewCards value) viewCards,
    required TResult Function(_Loading value) loading,
    required TResult Function(_OperationSucceeded value) operationSucceeded,
    required TResult Function(_ViewCollections value) viewCollections,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewCards value)? viewCards,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OperationSucceeded value)? operationSucceeded,
    TResult? Function(_ViewCollections value)? viewCollections,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewCards value)? viewCards,
    TResult Function(_Loading value)? loading,
    TResult Function(_OperationSucceeded value)? operationSucceeded,
    TResult Function(_ViewCollections value)? viewCollections,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends ListsState {
  const factory _Loading() = _$LoadingImpl;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$OperationSucceededImplCopyWith<$Res> {
  factory _$$OperationSucceededImplCopyWith(_$OperationSucceededImpl value,
          $Res Function(_$OperationSucceededImpl) then) =
      __$$OperationSucceededImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OperationSucceededImplCopyWithImpl<$Res>
    extends _$ListsStateCopyWithImpl<$Res, _$OperationSucceededImpl>
    implements _$$OperationSucceededImplCopyWith<$Res> {
  __$$OperationSucceededImplCopyWithImpl(_$OperationSucceededImpl _value,
      $Res Function(_$OperationSucceededImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OperationSucceededImpl extends _OperationSucceeded {
  const _$OperationSucceededImpl() : super._();

  @override
  String toString() {
    return 'ListsState.operationSucceeded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OperationSucceededImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CollectionEntity collection) viewCards,
    required TResult Function() loading,
    required TResult Function() operationSucceeded,
    required TResult Function(List<CollectionEntity> collectionsList,
            bool isEditMode, List<String> listToDelete)
        viewCollections,
    required TResult Function(String error) error,
  }) {
    return operationSucceeded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CollectionEntity collection)? viewCards,
    TResult? Function()? loading,
    TResult? Function()? operationSucceeded,
    TResult? Function(List<CollectionEntity> collectionsList, bool isEditMode,
            List<String> listToDelete)?
        viewCollections,
    TResult? Function(String error)? error,
  }) {
    return operationSucceeded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CollectionEntity collection)? viewCards,
    TResult Function()? loading,
    TResult Function()? operationSucceeded,
    TResult Function(List<CollectionEntity> collectionsList, bool isEditMode,
            List<String> listToDelete)?
        viewCollections,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (operationSucceeded != null) {
      return operationSucceeded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ViewCards value) viewCards,
    required TResult Function(_Loading value) loading,
    required TResult Function(_OperationSucceeded value) operationSucceeded,
    required TResult Function(_ViewCollections value) viewCollections,
    required TResult Function(_Error value) error,
  }) {
    return operationSucceeded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewCards value)? viewCards,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OperationSucceeded value)? operationSucceeded,
    TResult? Function(_ViewCollections value)? viewCollections,
    TResult? Function(_Error value)? error,
  }) {
    return operationSucceeded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewCards value)? viewCards,
    TResult Function(_Loading value)? loading,
    TResult Function(_OperationSucceeded value)? operationSucceeded,
    TResult Function(_ViewCollections value)? viewCollections,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (operationSucceeded != null) {
      return operationSucceeded(this);
    }
    return orElse();
  }
}

abstract class _OperationSucceeded extends ListsState {
  const factory _OperationSucceeded() = _$OperationSucceededImpl;
  const _OperationSucceeded._() : super._();
}

/// @nodoc
abstract class _$$ViewCollectionsImplCopyWith<$Res> {
  factory _$$ViewCollectionsImplCopyWith(_$ViewCollectionsImpl value,
          $Res Function(_$ViewCollectionsImpl) then) =
      __$$ViewCollectionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<CollectionEntity> collectionsList,
      bool isEditMode,
      List<String> listToDelete});
}

/// @nodoc
class __$$ViewCollectionsImplCopyWithImpl<$Res>
    extends _$ListsStateCopyWithImpl<$Res, _$ViewCollectionsImpl>
    implements _$$ViewCollectionsImplCopyWith<$Res> {
  __$$ViewCollectionsImplCopyWithImpl(
      _$ViewCollectionsImpl _value, $Res Function(_$ViewCollectionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionsList = null,
    Object? isEditMode = null,
    Object? listToDelete = null,
  }) {
    return _then(_$ViewCollectionsImpl(
      collectionsList: null == collectionsList
          ? _value._collectionsList
          : collectionsList // ignore: cast_nullable_to_non_nullable
              as List<CollectionEntity>,
      isEditMode: null == isEditMode
          ? _value.isEditMode
          : isEditMode // ignore: cast_nullable_to_non_nullable
              as bool,
      listToDelete: null == listToDelete
          ? _value._listToDelete
          : listToDelete // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$ViewCollectionsImpl extends _ViewCollections {
  const _$ViewCollectionsImpl(
      {required final List<CollectionEntity> collectionsList,
      required this.isEditMode,
      required final List<String> listToDelete})
      : _collectionsList = collectionsList,
        _listToDelete = listToDelete,
        super._();

  final List<CollectionEntity> _collectionsList;
  @override
  List<CollectionEntity> get collectionsList {
    if (_collectionsList is EqualUnmodifiableListView) return _collectionsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collectionsList);
  }

  @override
  final bool isEditMode;
  final List<String> _listToDelete;
  @override
  List<String> get listToDelete {
    if (_listToDelete is EqualUnmodifiableListView) return _listToDelete;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listToDelete);
  }

  @override
  String toString() {
    return 'ListsState.viewCollections(collectionsList: $collectionsList, isEditMode: $isEditMode, listToDelete: $listToDelete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewCollectionsImpl &&
            const DeepCollectionEquality()
                .equals(other._collectionsList, _collectionsList) &&
            (identical(other.isEditMode, isEditMode) ||
                other.isEditMode == isEditMode) &&
            const DeepCollectionEquality()
                .equals(other._listToDelete, _listToDelete));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_collectionsList),
      isEditMode,
      const DeepCollectionEquality().hash(_listToDelete));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewCollectionsImplCopyWith<_$ViewCollectionsImpl> get copyWith =>
      __$$ViewCollectionsImplCopyWithImpl<_$ViewCollectionsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CollectionEntity collection) viewCards,
    required TResult Function() loading,
    required TResult Function() operationSucceeded,
    required TResult Function(List<CollectionEntity> collectionsList,
            bool isEditMode, List<String> listToDelete)
        viewCollections,
    required TResult Function(String error) error,
  }) {
    return viewCollections(collectionsList, isEditMode, listToDelete);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CollectionEntity collection)? viewCards,
    TResult? Function()? loading,
    TResult? Function()? operationSucceeded,
    TResult? Function(List<CollectionEntity> collectionsList, bool isEditMode,
            List<String> listToDelete)?
        viewCollections,
    TResult? Function(String error)? error,
  }) {
    return viewCollections?.call(collectionsList, isEditMode, listToDelete);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CollectionEntity collection)? viewCards,
    TResult Function()? loading,
    TResult Function()? operationSucceeded,
    TResult Function(List<CollectionEntity> collectionsList, bool isEditMode,
            List<String> listToDelete)?
        viewCollections,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (viewCollections != null) {
      return viewCollections(collectionsList, isEditMode, listToDelete);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ViewCards value) viewCards,
    required TResult Function(_Loading value) loading,
    required TResult Function(_OperationSucceeded value) operationSucceeded,
    required TResult Function(_ViewCollections value) viewCollections,
    required TResult Function(_Error value) error,
  }) {
    return viewCollections(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewCards value)? viewCards,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OperationSucceeded value)? operationSucceeded,
    TResult? Function(_ViewCollections value)? viewCollections,
    TResult? Function(_Error value)? error,
  }) {
    return viewCollections?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewCards value)? viewCards,
    TResult Function(_Loading value)? loading,
    TResult Function(_OperationSucceeded value)? operationSucceeded,
    TResult Function(_ViewCollections value)? viewCollections,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (viewCollections != null) {
      return viewCollections(this);
    }
    return orElse();
  }
}

abstract class _ViewCollections extends ListsState {
  const factory _ViewCollections(
      {required final List<CollectionEntity> collectionsList,
      required final bool isEditMode,
      required final List<String> listToDelete}) = _$ViewCollectionsImpl;
  const _ViewCollections._() : super._();

  List<CollectionEntity> get collectionsList;
  bool get isEditMode;
  List<String> get listToDelete;
  @JsonKey(ignore: true)
  _$$ViewCollectionsImplCopyWith<_$ViewCollectionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ListsStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl extends _Error {
  const _$ErrorImpl({required this.error}) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'ListsState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CollectionEntity collection) viewCards,
    required TResult Function() loading,
    required TResult Function() operationSucceeded,
    required TResult Function(List<CollectionEntity> collectionsList,
            bool isEditMode, List<String> listToDelete)
        viewCollections,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CollectionEntity collection)? viewCards,
    TResult? Function()? loading,
    TResult? Function()? operationSucceeded,
    TResult? Function(List<CollectionEntity> collectionsList, bool isEditMode,
            List<String> listToDelete)?
        viewCollections,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CollectionEntity collection)? viewCards,
    TResult Function()? loading,
    TResult Function()? operationSucceeded,
    TResult Function(List<CollectionEntity> collectionsList, bool isEditMode,
            List<String> listToDelete)?
        viewCollections,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ViewCards value) viewCards,
    required TResult Function(_Loading value) loading,
    required TResult Function(_OperationSucceeded value) operationSucceeded,
    required TResult Function(_ViewCollections value) viewCollections,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewCards value)? viewCards,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OperationSucceeded value)? operationSucceeded,
    TResult? Function(_ViewCollections value)? viewCollections,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewCards value)? viewCards,
    TResult Function(_Loading value)? loading,
    TResult Function(_OperationSucceeded value)? operationSucceeded,
    TResult Function(_ViewCollections value)? viewCollections,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends ListsState {
  const factory _Error({required final String error}) = _$ErrorImpl;
  const _Error._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
