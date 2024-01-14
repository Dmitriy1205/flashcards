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
    required TResult Function() started,
    required TResult Function(String collectionsListName) selectCollection,
    required TResult Function(String name) createNewList,
    required TResult Function() deleteSelectedCollection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String collectionsListName)? selectCollection,
    TResult? Function(String name)? createNewList,
    TResult? Function()? deleteSelectedCollection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String collectionsListName)? selectCollection,
    TResult Function(String name)? createNewList,
    TResult Function()? deleteSelectedCollection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectCollection value) selectCollection,
    required TResult Function(_CreateNewList value) createNewList,
    required TResult Function(_DeleteSelecteCollection value)
        deleteSelectedCollection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectCollection value)? selectCollection,
    TResult? Function(_CreateNewList value)? createNewList,
    TResult? Function(_DeleteSelecteCollection value)? deleteSelectedCollection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectCollection value)? selectCollection,
    TResult Function(_CreateNewList value)? createNewList,
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
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$ListsEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ListsEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String collectionsListName) selectCollection,
    required TResult Function(String name) createNewList,
    required TResult Function() deleteSelectedCollection,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String collectionsListName)? selectCollection,
    TResult? Function(String name)? createNewList,
    TResult? Function()? deleteSelectedCollection,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String collectionsListName)? selectCollection,
    TResult Function(String name)? createNewList,
    TResult Function()? deleteSelectedCollection,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectCollection value) selectCollection,
    required TResult Function(_CreateNewList value) createNewList,
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
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SelectCollectionImplCopyWith<$Res> {
  factory _$$SelectCollectionImplCopyWith(_$SelectCollectionImpl value,
          $Res Function(_$SelectCollectionImpl) then) =
      __$$SelectCollectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String collectionsListName});
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
    Object? collectionsListName = null,
  }) {
    return _then(_$SelectCollectionImpl(
      collectionsListName: null == collectionsListName
          ? _value.collectionsListName
          : collectionsListName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectCollectionImpl implements _SelectCollection {
  const _$SelectCollectionImpl({required this.collectionsListName});

  @override
  final String collectionsListName;

  @override
  String toString() {
    return 'ListsEvent.selectCollection(collectionsListName: $collectionsListName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCollectionImpl &&
            (identical(other.collectionsListName, collectionsListName) ||
                other.collectionsListName == collectionsListName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collectionsListName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCollectionImplCopyWith<_$SelectCollectionImpl> get copyWith =>
      __$$SelectCollectionImplCopyWithImpl<_$SelectCollectionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String collectionsListName) selectCollection,
    required TResult Function(String name) createNewList,
    required TResult Function() deleteSelectedCollection,
  }) {
    return selectCollection(collectionsListName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String collectionsListName)? selectCollection,
    TResult? Function(String name)? createNewList,
    TResult? Function()? deleteSelectedCollection,
  }) {
    return selectCollection?.call(collectionsListName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String collectionsListName)? selectCollection,
    TResult Function(String name)? createNewList,
    TResult Function()? deleteSelectedCollection,
    required TResult orElse(),
  }) {
    if (selectCollection != null) {
      return selectCollection(collectionsListName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectCollection value) selectCollection,
    required TResult Function(_CreateNewList value) createNewList,
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
  const factory _SelectCollection({required final String collectionsListName}) =
      _$SelectCollectionImpl;

  String get collectionsListName;
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
    required TResult Function() started,
    required TResult Function(String collectionsListName) selectCollection,
    required TResult Function(String name) createNewList,
    required TResult Function() deleteSelectedCollection,
  }) {
    return createNewList(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String collectionsListName)? selectCollection,
    TResult? Function(String name)? createNewList,
    TResult? Function()? deleteSelectedCollection,
  }) {
    return createNewList?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String collectionsListName)? selectCollection,
    TResult Function(String name)? createNewList,
    TResult Function()? deleteSelectedCollection,
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
abstract class _$$DeleteSelecteCollectionImplCopyWith<$Res> {
  factory _$$DeleteSelecteCollectionImplCopyWith(
          _$DeleteSelecteCollectionImpl value,
          $Res Function(_$DeleteSelecteCollectionImpl) then) =
      __$$DeleteSelecteCollectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteSelecteCollectionImplCopyWithImpl<$Res>
    extends _$ListsEventCopyWithImpl<$Res, _$DeleteSelecteCollectionImpl>
    implements _$$DeleteSelecteCollectionImplCopyWith<$Res> {
  __$$DeleteSelecteCollectionImplCopyWithImpl(
      _$DeleteSelecteCollectionImpl _value,
      $Res Function(_$DeleteSelecteCollectionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteSelecteCollectionImpl implements _DeleteSelecteCollection {
  const _$DeleteSelecteCollectionImpl();

  @override
  String toString() {
    return 'ListsEvent.deleteSelectedCollection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteSelecteCollectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String collectionsListName) selectCollection,
    required TResult Function(String name) createNewList,
    required TResult Function() deleteSelectedCollection,
  }) {
    return deleteSelectedCollection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String collectionsListName)? selectCollection,
    TResult? Function(String name)? createNewList,
    TResult? Function()? deleteSelectedCollection,
  }) {
    return deleteSelectedCollection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String collectionsListName)? selectCollection,
    TResult Function(String name)? createNewList,
    TResult Function()? deleteSelectedCollection,
    required TResult orElse(),
  }) {
    if (deleteSelectedCollection != null) {
      return deleteSelectedCollection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectCollection value) selectCollection,
    required TResult Function(_CreateNewList value) createNewList,
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
  const factory _DeleteSelecteCollection() = _$DeleteSelecteCollectionImpl;
}

/// @nodoc
mixin _$ListsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String collectionsListName) viewCards,
    required TResult Function() loading,
    required TResult Function(List<Map<String, dynamic>> collectionsList)
        viewCollections,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String collectionsListName)? viewCards,
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> collectionsList)?
        viewCollections,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String collectionsListName)? viewCards,
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> collectionsList)?
        viewCollections,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ViewCards value) viewCards,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ViewCollections value) viewCollections,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewCards value)? viewCards,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ViewCollections value)? viewCollections,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewCards value)? viewCards,
    TResult Function(_Loading value)? loading,
    TResult Function(_ViewCollections value)? viewCollections,
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

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

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
    required TResult Function(String collectionsListName) viewCards,
    required TResult Function() loading,
    required TResult Function(List<Map<String, dynamic>> collectionsList)
        viewCollections,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String collectionsListName)? viewCards,
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> collectionsList)?
        viewCollections,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String collectionsListName)? viewCards,
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> collectionsList)?
        viewCollections,
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
    required TResult Function(_ViewCollections value) viewCollections,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewCards value)? viewCards,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ViewCollections value)? viewCollections,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewCards value)? viewCards,
    TResult Function(_Loading value)? loading,
    TResult Function(_ViewCollections value)? viewCollections,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ListsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ViewCardsImplCopyWith<$Res> {
  factory _$$ViewCardsImplCopyWith(
          _$ViewCardsImpl value, $Res Function(_$ViewCardsImpl) then) =
      __$$ViewCardsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String collectionsListName});
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
    Object? collectionsListName = null,
  }) {
    return _then(_$ViewCardsImpl(
      collectionsListName: null == collectionsListName
          ? _value.collectionsListName
          : collectionsListName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ViewCardsImpl implements _ViewCards {
  const _$ViewCardsImpl({required this.collectionsListName});

  @override
  final String collectionsListName;

  @override
  String toString() {
    return 'ListsState.viewCards(collectionsListName: $collectionsListName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewCardsImpl &&
            (identical(other.collectionsListName, collectionsListName) ||
                other.collectionsListName == collectionsListName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collectionsListName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewCardsImplCopyWith<_$ViewCardsImpl> get copyWith =>
      __$$ViewCardsImplCopyWithImpl<_$ViewCardsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String collectionsListName) viewCards,
    required TResult Function() loading,
    required TResult Function(List<Map<String, dynamic>> collectionsList)
        viewCollections,
  }) {
    return viewCards(collectionsListName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String collectionsListName)? viewCards,
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> collectionsList)?
        viewCollections,
  }) {
    return viewCards?.call(collectionsListName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String collectionsListName)? viewCards,
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> collectionsList)?
        viewCollections,
    required TResult orElse(),
  }) {
    if (viewCards != null) {
      return viewCards(collectionsListName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ViewCards value) viewCards,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ViewCollections value) viewCollections,
  }) {
    return viewCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewCards value)? viewCards,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ViewCollections value)? viewCollections,
  }) {
    return viewCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewCards value)? viewCards,
    TResult Function(_Loading value)? loading,
    TResult Function(_ViewCollections value)? viewCollections,
    required TResult orElse(),
  }) {
    if (viewCards != null) {
      return viewCards(this);
    }
    return orElse();
  }
}

abstract class _ViewCards implements ListsState {
  const factory _ViewCards({required final String collectionsListName}) =
      _$ViewCardsImpl;

  String get collectionsListName;
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

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

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
    required TResult Function(String collectionsListName) viewCards,
    required TResult Function() loading,
    required TResult Function(List<Map<String, dynamic>> collectionsList)
        viewCollections,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String collectionsListName)? viewCards,
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> collectionsList)?
        viewCollections,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String collectionsListName)? viewCards,
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> collectionsList)?
        viewCollections,
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
    required TResult Function(_ViewCollections value) viewCollections,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewCards value)? viewCards,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ViewCollections value)? viewCollections,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewCards value)? viewCards,
    TResult Function(_Loading value)? loading,
    TResult Function(_ViewCollections value)? viewCollections,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ListsState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ViewCollectionsImplCopyWith<$Res> {
  factory _$$ViewCollectionsImplCopyWith(_$ViewCollectionsImpl value,
          $Res Function(_$ViewCollectionsImpl) then) =
      __$$ViewCollectionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> collectionsList});
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
  }) {
    return _then(_$ViewCollectionsImpl(
      collectionsList: null == collectionsList
          ? _value._collectionsList
          : collectionsList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ViewCollectionsImpl implements _ViewCollections {
  const _$ViewCollectionsImpl(
      {required final List<Map<String, dynamic>> collectionsList})
      : _collectionsList = collectionsList;

  final List<Map<String, dynamic>> _collectionsList;
  @override
  List<Map<String, dynamic>> get collectionsList {
    if (_collectionsList is EqualUnmodifiableListView) return _collectionsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collectionsList);
  }

  @override
  String toString() {
    return 'ListsState.viewCollections(collectionsList: $collectionsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewCollectionsImpl &&
            const DeepCollectionEquality()
                .equals(other._collectionsList, _collectionsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_collectionsList));

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
    required TResult Function(String collectionsListName) viewCards,
    required TResult Function() loading,
    required TResult Function(List<Map<String, dynamic>> collectionsList)
        viewCollections,
  }) {
    return viewCollections(collectionsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String collectionsListName)? viewCards,
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> collectionsList)?
        viewCollections,
  }) {
    return viewCollections?.call(collectionsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String collectionsListName)? viewCards,
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> collectionsList)?
        viewCollections,
    required TResult orElse(),
  }) {
    if (viewCollections != null) {
      return viewCollections(collectionsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ViewCards value) viewCards,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ViewCollections value) viewCollections,
  }) {
    return viewCollections(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewCards value)? viewCards,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ViewCollections value)? viewCollections,
  }) {
    return viewCollections?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewCards value)? viewCards,
    TResult Function(_Loading value)? loading,
    TResult Function(_ViewCollections value)? viewCollections,
    required TResult orElse(),
  }) {
    if (viewCollections != null) {
      return viewCollections(this);
    }
    return orElse();
  }
}

abstract class _ViewCollections implements ListsState {
  const factory _ViewCollections(
          {required final List<Map<String, dynamic>> collectionsList}) =
      _$ViewCollectionsImpl;

  List<Map<String, dynamic>> get collectionsList;
  @JsonKey(ignore: true)
  _$$ViewCollectionsImplCopyWith<_$ViewCollectionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
