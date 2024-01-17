// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cards_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EditCardParam cardParam, String collectionId)
        editCard,
    required TResult Function(String collectionId) initCard,
    required TResult Function(List<String> cardsIdToDelete, String collectionId)
        deleteSelectedCards,
    required TResult Function(CreateCardParam cardParam, String collectionId)
        createNewCard,
    required TResult Function() emptyCardsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EditCardParam cardParam, String collectionId)? editCard,
    TResult? Function(String collectionId)? initCard,
    TResult? Function(List<String> cardsIdToDelete, String collectionId)?
        deleteSelectedCards,
    TResult? Function(CreateCardParam cardParam, String collectionId)?
        createNewCard,
    TResult? Function()? emptyCardsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EditCardParam cardParam, String collectionId)? editCard,
    TResult Function(String collectionId)? initCard,
    TResult Function(List<String> cardsIdToDelete, String collectionId)?
        deleteSelectedCards,
    TResult Function(CreateCardParam cardParam, String collectionId)?
        createNewCard,
    TResult Function()? emptyCardsList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditCard value) editCard,
    required TResult Function(_InitCard value) initCard,
    required TResult Function(_DeleteSelectedCards value) deleteSelectedCards,
    required TResult Function(_CreateNewCard value) createNewCard,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditCard value)? editCard,
    TResult? Function(_InitCard value)? initCard,
    TResult? Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult? Function(_CreateNewCard value)? createNewCard,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditCard value)? editCard,
    TResult Function(_InitCard value)? initCard,
    TResult Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult Function(_CreateNewCard value)? createNewCard,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardsEventCopyWith<$Res> {
  factory $CardsEventCopyWith(
          CardsEvent value, $Res Function(CardsEvent) then) =
      _$CardsEventCopyWithImpl<$Res, CardsEvent>;
}

/// @nodoc
class _$CardsEventCopyWithImpl<$Res, $Val extends CardsEvent>
    implements $CardsEventCopyWith<$Res> {
  _$CardsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EditCardImplCopyWith<$Res> {
  factory _$$EditCardImplCopyWith(
          _$EditCardImpl value, $Res Function(_$EditCardImpl) then) =
      __$$EditCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EditCardParam cardParam, String collectionId});
}

/// @nodoc
class __$$EditCardImplCopyWithImpl<$Res>
    extends _$CardsEventCopyWithImpl<$Res, _$EditCardImpl>
    implements _$$EditCardImplCopyWith<$Res> {
  __$$EditCardImplCopyWithImpl(
      _$EditCardImpl _value, $Res Function(_$EditCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardParam = null,
    Object? collectionId = null,
  }) {
    return _then(_$EditCardImpl(
      cardParam: null == cardParam
          ? _value.cardParam
          : cardParam // ignore: cast_nullable_to_non_nullable
              as EditCardParam,
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditCardImpl implements _EditCard {
  const _$EditCardImpl({required this.cardParam, required this.collectionId});

  @override
  final EditCardParam cardParam;
  @override
  final String collectionId;

  @override
  String toString() {
    return 'CardsEvent.editCard(cardParam: $cardParam, collectionId: $collectionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditCardImpl &&
            (identical(other.cardParam, cardParam) ||
                other.cardParam == cardParam) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardParam, collectionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditCardImplCopyWith<_$EditCardImpl> get copyWith =>
      __$$EditCardImplCopyWithImpl<_$EditCardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EditCardParam cardParam, String collectionId)
        editCard,
    required TResult Function(String collectionId) initCard,
    required TResult Function(List<String> cardsIdToDelete, String collectionId)
        deleteSelectedCards,
    required TResult Function(CreateCardParam cardParam, String collectionId)
        createNewCard,
    required TResult Function() emptyCardsList,
  }) {
    return editCard(cardParam, collectionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EditCardParam cardParam, String collectionId)? editCard,
    TResult? Function(String collectionId)? initCard,
    TResult? Function(List<String> cardsIdToDelete, String collectionId)?
        deleteSelectedCards,
    TResult? Function(CreateCardParam cardParam, String collectionId)?
        createNewCard,
    TResult? Function()? emptyCardsList,
  }) {
    return editCard?.call(cardParam, collectionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EditCardParam cardParam, String collectionId)? editCard,
    TResult Function(String collectionId)? initCard,
    TResult Function(List<String> cardsIdToDelete, String collectionId)?
        deleteSelectedCards,
    TResult Function(CreateCardParam cardParam, String collectionId)?
        createNewCard,
    TResult Function()? emptyCardsList,
    required TResult orElse(),
  }) {
    if (editCard != null) {
      return editCard(cardParam, collectionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditCard value) editCard,
    required TResult Function(_InitCard value) initCard,
    required TResult Function(_DeleteSelectedCards value) deleteSelectedCards,
    required TResult Function(_CreateNewCard value) createNewCard,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
  }) {
    return editCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditCard value)? editCard,
    TResult? Function(_InitCard value)? initCard,
    TResult? Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult? Function(_CreateNewCard value)? createNewCard,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
  }) {
    return editCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditCard value)? editCard,
    TResult Function(_InitCard value)? initCard,
    TResult Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult Function(_CreateNewCard value)? createNewCard,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    required TResult orElse(),
  }) {
    if (editCard != null) {
      return editCard(this);
    }
    return orElse();
  }
}

abstract class _EditCard implements CardsEvent {
  const factory _EditCard(
      {required final EditCardParam cardParam,
      required final String collectionId}) = _$EditCardImpl;

  EditCardParam get cardParam;
  String get collectionId;
  @JsonKey(ignore: true)
  _$$EditCardImplCopyWith<_$EditCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitCardImplCopyWith<$Res> {
  factory _$$InitCardImplCopyWith(
          _$InitCardImpl value, $Res Function(_$InitCardImpl) then) =
      __$$InitCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String collectionId});
}

/// @nodoc
class __$$InitCardImplCopyWithImpl<$Res>
    extends _$CardsEventCopyWithImpl<$Res, _$InitCardImpl>
    implements _$$InitCardImplCopyWith<$Res> {
  __$$InitCardImplCopyWithImpl(
      _$InitCardImpl _value, $Res Function(_$InitCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionId = null,
  }) {
    return _then(_$InitCardImpl(
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitCardImpl implements _InitCard {
  const _$InitCardImpl({required this.collectionId});

  @override
  final String collectionId;

  @override
  String toString() {
    return 'CardsEvent.initCard(collectionId: $collectionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitCardImpl &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collectionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitCardImplCopyWith<_$InitCardImpl> get copyWith =>
      __$$InitCardImplCopyWithImpl<_$InitCardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EditCardParam cardParam, String collectionId)
        editCard,
    required TResult Function(String collectionId) initCard,
    required TResult Function(List<String> cardsIdToDelete, String collectionId)
        deleteSelectedCards,
    required TResult Function(CreateCardParam cardParam, String collectionId)
        createNewCard,
    required TResult Function() emptyCardsList,
  }) {
    return initCard(collectionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EditCardParam cardParam, String collectionId)? editCard,
    TResult? Function(String collectionId)? initCard,
    TResult? Function(List<String> cardsIdToDelete, String collectionId)?
        deleteSelectedCards,
    TResult? Function(CreateCardParam cardParam, String collectionId)?
        createNewCard,
    TResult? Function()? emptyCardsList,
  }) {
    return initCard?.call(collectionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EditCardParam cardParam, String collectionId)? editCard,
    TResult Function(String collectionId)? initCard,
    TResult Function(List<String> cardsIdToDelete, String collectionId)?
        deleteSelectedCards,
    TResult Function(CreateCardParam cardParam, String collectionId)?
        createNewCard,
    TResult Function()? emptyCardsList,
    required TResult orElse(),
  }) {
    if (initCard != null) {
      return initCard(collectionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditCard value) editCard,
    required TResult Function(_InitCard value) initCard,
    required TResult Function(_DeleteSelectedCards value) deleteSelectedCards,
    required TResult Function(_CreateNewCard value) createNewCard,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
  }) {
    return initCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditCard value)? editCard,
    TResult? Function(_InitCard value)? initCard,
    TResult? Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult? Function(_CreateNewCard value)? createNewCard,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
  }) {
    return initCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditCard value)? editCard,
    TResult Function(_InitCard value)? initCard,
    TResult Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult Function(_CreateNewCard value)? createNewCard,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    required TResult orElse(),
  }) {
    if (initCard != null) {
      return initCard(this);
    }
    return orElse();
  }
}

abstract class _InitCard implements CardsEvent {
  const factory _InitCard({required final String collectionId}) =
      _$InitCardImpl;

  String get collectionId;
  @JsonKey(ignore: true)
  _$$InitCardImplCopyWith<_$InitCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteSelectedCardsImplCopyWith<$Res> {
  factory _$$DeleteSelectedCardsImplCopyWith(_$DeleteSelectedCardsImpl value,
          $Res Function(_$DeleteSelectedCardsImpl) then) =
      __$$DeleteSelectedCardsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> cardsIdToDelete, String collectionId});
}

/// @nodoc
class __$$DeleteSelectedCardsImplCopyWithImpl<$Res>
    extends _$CardsEventCopyWithImpl<$Res, _$DeleteSelectedCardsImpl>
    implements _$$DeleteSelectedCardsImplCopyWith<$Res> {
  __$$DeleteSelectedCardsImplCopyWithImpl(_$DeleteSelectedCardsImpl _value,
      $Res Function(_$DeleteSelectedCardsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardsIdToDelete = null,
    Object? collectionId = null,
  }) {
    return _then(_$DeleteSelectedCardsImpl(
      cardsIdToDelete: null == cardsIdToDelete
          ? _value._cardsIdToDelete
          : cardsIdToDelete // ignore: cast_nullable_to_non_nullable
              as List<String>,
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteSelectedCardsImpl implements _DeleteSelectedCards {
  const _$DeleteSelectedCardsImpl(
      {required final List<String> cardsIdToDelete, required this.collectionId})
      : _cardsIdToDelete = cardsIdToDelete;

  final List<String> _cardsIdToDelete;
  @override
  List<String> get cardsIdToDelete {
    if (_cardsIdToDelete is EqualUnmodifiableListView) return _cardsIdToDelete;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cardsIdToDelete);
  }

  @override
  final String collectionId;

  @override
  String toString() {
    return 'CardsEvent.deleteSelectedCards(cardsIdToDelete: $cardsIdToDelete, collectionId: $collectionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteSelectedCardsImpl &&
            const DeepCollectionEquality()
                .equals(other._cardsIdToDelete, _cardsIdToDelete) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_cardsIdToDelete), collectionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteSelectedCardsImplCopyWith<_$DeleteSelectedCardsImpl> get copyWith =>
      __$$DeleteSelectedCardsImplCopyWithImpl<_$DeleteSelectedCardsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EditCardParam cardParam, String collectionId)
        editCard,
    required TResult Function(String collectionId) initCard,
    required TResult Function(List<String> cardsIdToDelete, String collectionId)
        deleteSelectedCards,
    required TResult Function(CreateCardParam cardParam, String collectionId)
        createNewCard,
    required TResult Function() emptyCardsList,
  }) {
    return deleteSelectedCards(cardsIdToDelete, collectionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EditCardParam cardParam, String collectionId)? editCard,
    TResult? Function(String collectionId)? initCard,
    TResult? Function(List<String> cardsIdToDelete, String collectionId)?
        deleteSelectedCards,
    TResult? Function(CreateCardParam cardParam, String collectionId)?
        createNewCard,
    TResult? Function()? emptyCardsList,
  }) {
    return deleteSelectedCards?.call(cardsIdToDelete, collectionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EditCardParam cardParam, String collectionId)? editCard,
    TResult Function(String collectionId)? initCard,
    TResult Function(List<String> cardsIdToDelete, String collectionId)?
        deleteSelectedCards,
    TResult Function(CreateCardParam cardParam, String collectionId)?
        createNewCard,
    TResult Function()? emptyCardsList,
    required TResult orElse(),
  }) {
    if (deleteSelectedCards != null) {
      return deleteSelectedCards(cardsIdToDelete, collectionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditCard value) editCard,
    required TResult Function(_InitCard value) initCard,
    required TResult Function(_DeleteSelectedCards value) deleteSelectedCards,
    required TResult Function(_CreateNewCard value) createNewCard,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
  }) {
    return deleteSelectedCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditCard value)? editCard,
    TResult? Function(_InitCard value)? initCard,
    TResult? Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult? Function(_CreateNewCard value)? createNewCard,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
  }) {
    return deleteSelectedCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditCard value)? editCard,
    TResult Function(_InitCard value)? initCard,
    TResult Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult Function(_CreateNewCard value)? createNewCard,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    required TResult orElse(),
  }) {
    if (deleteSelectedCards != null) {
      return deleteSelectedCards(this);
    }
    return orElse();
  }
}

abstract class _DeleteSelectedCards implements CardsEvent {
  const factory _DeleteSelectedCards(
      {required final List<String> cardsIdToDelete,
      required final String collectionId}) = _$DeleteSelectedCardsImpl;

  List<String> get cardsIdToDelete;
  String get collectionId;
  @JsonKey(ignore: true)
  _$$DeleteSelectedCardsImplCopyWith<_$DeleteSelectedCardsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateNewCardImplCopyWith<$Res> {
  factory _$$CreateNewCardImplCopyWith(
          _$CreateNewCardImpl value, $Res Function(_$CreateNewCardImpl) then) =
      __$$CreateNewCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreateCardParam cardParam, String collectionId});
}

/// @nodoc
class __$$CreateNewCardImplCopyWithImpl<$Res>
    extends _$CardsEventCopyWithImpl<$Res, _$CreateNewCardImpl>
    implements _$$CreateNewCardImplCopyWith<$Res> {
  __$$CreateNewCardImplCopyWithImpl(
      _$CreateNewCardImpl _value, $Res Function(_$CreateNewCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardParam = null,
    Object? collectionId = null,
  }) {
    return _then(_$CreateNewCardImpl(
      cardParam: null == cardParam
          ? _value.cardParam
          : cardParam // ignore: cast_nullable_to_non_nullable
              as CreateCardParam,
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateNewCardImpl implements _CreateNewCard {
  const _$CreateNewCardImpl(
      {required this.cardParam, required this.collectionId});

  @override
  final CreateCardParam cardParam;
  @override
  final String collectionId;

  @override
  String toString() {
    return 'CardsEvent.createNewCard(cardParam: $cardParam, collectionId: $collectionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNewCardImpl &&
            (identical(other.cardParam, cardParam) ||
                other.cardParam == cardParam) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardParam, collectionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNewCardImplCopyWith<_$CreateNewCardImpl> get copyWith =>
      __$$CreateNewCardImplCopyWithImpl<_$CreateNewCardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EditCardParam cardParam, String collectionId)
        editCard,
    required TResult Function(String collectionId) initCard,
    required TResult Function(List<String> cardsIdToDelete, String collectionId)
        deleteSelectedCards,
    required TResult Function(CreateCardParam cardParam, String collectionId)
        createNewCard,
    required TResult Function() emptyCardsList,
  }) {
    return createNewCard(cardParam, collectionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EditCardParam cardParam, String collectionId)? editCard,
    TResult? Function(String collectionId)? initCard,
    TResult? Function(List<String> cardsIdToDelete, String collectionId)?
        deleteSelectedCards,
    TResult? Function(CreateCardParam cardParam, String collectionId)?
        createNewCard,
    TResult? Function()? emptyCardsList,
  }) {
    return createNewCard?.call(cardParam, collectionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EditCardParam cardParam, String collectionId)? editCard,
    TResult Function(String collectionId)? initCard,
    TResult Function(List<String> cardsIdToDelete, String collectionId)?
        deleteSelectedCards,
    TResult Function(CreateCardParam cardParam, String collectionId)?
        createNewCard,
    TResult Function()? emptyCardsList,
    required TResult orElse(),
  }) {
    if (createNewCard != null) {
      return createNewCard(cardParam, collectionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditCard value) editCard,
    required TResult Function(_InitCard value) initCard,
    required TResult Function(_DeleteSelectedCards value) deleteSelectedCards,
    required TResult Function(_CreateNewCard value) createNewCard,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
  }) {
    return createNewCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditCard value)? editCard,
    TResult? Function(_InitCard value)? initCard,
    TResult? Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult? Function(_CreateNewCard value)? createNewCard,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
  }) {
    return createNewCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditCard value)? editCard,
    TResult Function(_InitCard value)? initCard,
    TResult Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult Function(_CreateNewCard value)? createNewCard,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    required TResult orElse(),
  }) {
    if (createNewCard != null) {
      return createNewCard(this);
    }
    return orElse();
  }
}

abstract class _CreateNewCard implements CardsEvent {
  const factory _CreateNewCard(
      {required final CreateCardParam cardParam,
      required final String collectionId}) = _$CreateNewCardImpl;

  CreateCardParam get cardParam;
  String get collectionId;
  @JsonKey(ignore: true)
  _$$CreateNewCardImplCopyWith<_$CreateNewCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyCardsListImplCopyWith<$Res> {
  factory _$$EmptyCardsListImplCopyWith(_$EmptyCardsListImpl value,
          $Res Function(_$EmptyCardsListImpl) then) =
      __$$EmptyCardsListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyCardsListImplCopyWithImpl<$Res>
    extends _$CardsEventCopyWithImpl<$Res, _$EmptyCardsListImpl>
    implements _$$EmptyCardsListImplCopyWith<$Res> {
  __$$EmptyCardsListImplCopyWithImpl(
      _$EmptyCardsListImpl _value, $Res Function(_$EmptyCardsListImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyCardsListImpl implements _EmptyCardsList {
  const _$EmptyCardsListImpl();

  @override
  String toString() {
    return 'CardsEvent.emptyCardsList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyCardsListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EditCardParam cardParam, String collectionId)
        editCard,
    required TResult Function(String collectionId) initCard,
    required TResult Function(List<String> cardsIdToDelete, String collectionId)
        deleteSelectedCards,
    required TResult Function(CreateCardParam cardParam, String collectionId)
        createNewCard,
    required TResult Function() emptyCardsList,
  }) {
    return emptyCardsList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EditCardParam cardParam, String collectionId)? editCard,
    TResult? Function(String collectionId)? initCard,
    TResult? Function(List<String> cardsIdToDelete, String collectionId)?
        deleteSelectedCards,
    TResult? Function(CreateCardParam cardParam, String collectionId)?
        createNewCard,
    TResult? Function()? emptyCardsList,
  }) {
    return emptyCardsList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EditCardParam cardParam, String collectionId)? editCard,
    TResult Function(String collectionId)? initCard,
    TResult Function(List<String> cardsIdToDelete, String collectionId)?
        deleteSelectedCards,
    TResult Function(CreateCardParam cardParam, String collectionId)?
        createNewCard,
    TResult Function()? emptyCardsList,
    required TResult orElse(),
  }) {
    if (emptyCardsList != null) {
      return emptyCardsList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditCard value) editCard,
    required TResult Function(_InitCard value) initCard,
    required TResult Function(_DeleteSelectedCards value) deleteSelectedCards,
    required TResult Function(_CreateNewCard value) createNewCard,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
  }) {
    return emptyCardsList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditCard value)? editCard,
    TResult? Function(_InitCard value)? initCard,
    TResult? Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult? Function(_CreateNewCard value)? createNewCard,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
  }) {
    return emptyCardsList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditCard value)? editCard,
    TResult Function(_InitCard value)? initCard,
    TResult Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult Function(_CreateNewCard value)? createNewCard,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    required TResult orElse(),
  }) {
    if (emptyCardsList != null) {
      return emptyCardsList(this);
    }
    return orElse();
  }
}

abstract class _EmptyCardsList implements CardsEvent {
  const factory _EmptyCardsList() = _$EmptyCardsListImpl;
}

/// @nodoc
mixin _$CardsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CardEntity>? cardsList) initial,
    required TResult Function() viewIndividualCard,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CardEntity>? cardsList)? initial,
    TResult? Function()? viewIndividualCard,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CardEntity>? cardsList)? initial,
    TResult Function()? viewIndividualCard,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ViewIndividualCard value) viewIndividualCard,
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult? Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardsStateCopyWith<$Res> {
  factory $CardsStateCopyWith(
          CardsState value, $Res Function(CardsState) then) =
      _$CardsStateCopyWithImpl<$Res, CardsState>;
}

/// @nodoc
class _$CardsStateCopyWithImpl<$Res, $Val extends CardsState>
    implements $CardsStateCopyWith<$Res> {
  _$CardsStateCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call({List<CardEntity>? cardsList});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardsList = freezed,
  }) {
    return _then(_$InitialImpl(
      cardsList: freezed == cardsList
          ? _value._cardsList
          : cardsList // ignore: cast_nullable_to_non_nullable
              as List<CardEntity>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({required final List<CardEntity>? cardsList})
      : _cardsList = cardsList;

  final List<CardEntity>? _cardsList;
  @override
  List<CardEntity>? get cardsList {
    final value = _cardsList;
    if (value == null) return null;
    if (_cardsList is EqualUnmodifiableListView) return _cardsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CardsState.initial(cardsList: $cardsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._cardsList, _cardsList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cardsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CardEntity>? cardsList) initial,
    required TResult Function() viewIndividualCard,
    required TResult Function() loading,
  }) {
    return initial(cardsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CardEntity>? cardsList)? initial,
    TResult? Function()? viewIndividualCard,
    TResult? Function()? loading,
  }) {
    return initial?.call(cardsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CardEntity>? cardsList)? initial,
    TResult Function()? viewIndividualCard,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(cardsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ViewIndividualCard value) viewIndividualCard,
    required TResult Function(_Loading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult? Function(_Loading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CardsState {
  const factory _Initial({required final List<CardEntity>? cardsList}) =
      _$InitialImpl;

  List<CardEntity>? get cardsList;
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ViewIndividualCardImplCopyWith<$Res> {
  factory _$$ViewIndividualCardImplCopyWith(_$ViewIndividualCardImpl value,
          $Res Function(_$ViewIndividualCardImpl) then) =
      __$$ViewIndividualCardImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ViewIndividualCardImplCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$ViewIndividualCardImpl>
    implements _$$ViewIndividualCardImplCopyWith<$Res> {
  __$$ViewIndividualCardImplCopyWithImpl(_$ViewIndividualCardImpl _value,
      $Res Function(_$ViewIndividualCardImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ViewIndividualCardImpl implements _ViewIndividualCard {
  const _$ViewIndividualCardImpl();

  @override
  String toString() {
    return 'CardsState.viewIndividualCard()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ViewIndividualCardImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CardEntity>? cardsList) initial,
    required TResult Function() viewIndividualCard,
    required TResult Function() loading,
  }) {
    return viewIndividualCard();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CardEntity>? cardsList)? initial,
    TResult? Function()? viewIndividualCard,
    TResult? Function()? loading,
  }) {
    return viewIndividualCard?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CardEntity>? cardsList)? initial,
    TResult Function()? viewIndividualCard,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (viewIndividualCard != null) {
      return viewIndividualCard();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ViewIndividualCard value) viewIndividualCard,
    required TResult Function(_Loading value) loading,
  }) {
    return viewIndividualCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult? Function(_Loading value)? loading,
  }) {
    return viewIndividualCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (viewIndividualCard != null) {
      return viewIndividualCard(this);
    }
    return orElse();
  }
}

abstract class _ViewIndividualCard implements CardsState {
  const factory _ViewIndividualCard() = _$ViewIndividualCardImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'CardsState.loading()';
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
    required TResult Function(List<CardEntity>? cardsList) initial,
    required TResult Function() viewIndividualCard,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CardEntity>? cardsList)? initial,
    TResult? Function()? viewIndividualCard,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CardEntity>? cardsList)? initial,
    TResult Function()? viewIndividualCard,
    TResult Function()? loading,
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
    required TResult Function(_ViewIndividualCard value) viewIndividualCard,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult? Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CardsState {
  const factory _Loading() = _$LoadingImpl;
}
