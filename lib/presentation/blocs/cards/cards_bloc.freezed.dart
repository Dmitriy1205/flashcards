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
    required TResult Function(String collectionId, String sender)
        createSharedCards,
    required TResult Function(
            String path, String collectionId, String collectionName)
        importExcel,
    required TResult Function(String collectionId, String collectionName)
        shareCollection,
    required TResult Function() emptyCardsList,
    required TResult Function(CardEntity cardEntity) swipeCard,
    required TResult Function() finishLearn,
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
    TResult? Function(String collectionId, String sender)? createSharedCards,
    TResult? Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult? Function(String collectionId, String collectionName)?
        shareCollection,
    TResult? Function()? emptyCardsList,
    TResult? Function(CardEntity cardEntity)? swipeCard,
    TResult? Function()? finishLearn,
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
    TResult Function(String collectionId, String sender)? createSharedCards,
    TResult Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult Function(String collectionId, String collectionName)?
        shareCollection,
    TResult Function()? emptyCardsList,
    TResult Function(CardEntity cardEntity)? swipeCard,
    TResult Function()? finishLearn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditCard value) editCard,
    required TResult Function(_InitCard value) initCard,
    required TResult Function(_DeleteSelectedCards value) deleteSelectedCards,
    required TResult Function(_CreateNewCard value) createNewCard,
    required TResult Function(_CreateSharedCards value) createSharedCards,
    required TResult Function(_ImportExcel value) importExcel,
    required TResult Function(_ShareCard value) shareCollection,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
    required TResult Function(_SwipeCard value) swipeCard,
    required TResult Function(_FinishLearn value) finishLearn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditCard value)? editCard,
    TResult? Function(_InitCard value)? initCard,
    TResult? Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult? Function(_CreateNewCard value)? createNewCard,
    TResult? Function(_CreateSharedCards value)? createSharedCards,
    TResult? Function(_ImportExcel value)? importExcel,
    TResult? Function(_ShareCard value)? shareCollection,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
    TResult? Function(_SwipeCard value)? swipeCard,
    TResult? Function(_FinishLearn value)? finishLearn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditCard value)? editCard,
    TResult Function(_InitCard value)? initCard,
    TResult Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult Function(_CreateNewCard value)? createNewCard,
    TResult Function(_CreateSharedCards value)? createSharedCards,
    TResult Function(_ImportExcel value)? importExcel,
    TResult Function(_ShareCard value)? shareCollection,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    TResult Function(_SwipeCard value)? swipeCard,
    TResult Function(_FinishLearn value)? finishLearn,
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
    required TResult Function(String collectionId, String sender)
        createSharedCards,
    required TResult Function(
            String path, String collectionId, String collectionName)
        importExcel,
    required TResult Function(String collectionId, String collectionName)
        shareCollection,
    required TResult Function() emptyCardsList,
    required TResult Function(CardEntity cardEntity) swipeCard,
    required TResult Function() finishLearn,
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
    TResult? Function(String collectionId, String sender)? createSharedCards,
    TResult? Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult? Function(String collectionId, String collectionName)?
        shareCollection,
    TResult? Function()? emptyCardsList,
    TResult? Function(CardEntity cardEntity)? swipeCard,
    TResult? Function()? finishLearn,
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
    TResult Function(String collectionId, String sender)? createSharedCards,
    TResult Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult Function(String collectionId, String collectionName)?
        shareCollection,
    TResult Function()? emptyCardsList,
    TResult Function(CardEntity cardEntity)? swipeCard,
    TResult Function()? finishLearn,
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
    required TResult Function(_CreateSharedCards value) createSharedCards,
    required TResult Function(_ImportExcel value) importExcel,
    required TResult Function(_ShareCard value) shareCollection,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
    required TResult Function(_SwipeCard value) swipeCard,
    required TResult Function(_FinishLearn value) finishLearn,
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
    TResult? Function(_CreateSharedCards value)? createSharedCards,
    TResult? Function(_ImportExcel value)? importExcel,
    TResult? Function(_ShareCard value)? shareCollection,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
    TResult? Function(_SwipeCard value)? swipeCard,
    TResult? Function(_FinishLearn value)? finishLearn,
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
    TResult Function(_CreateSharedCards value)? createSharedCards,
    TResult Function(_ImportExcel value)? importExcel,
    TResult Function(_ShareCard value)? shareCollection,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    TResult Function(_SwipeCard value)? swipeCard,
    TResult Function(_FinishLearn value)? finishLearn,
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
    required TResult Function(String collectionId, String sender)
        createSharedCards,
    required TResult Function(
            String path, String collectionId, String collectionName)
        importExcel,
    required TResult Function(String collectionId, String collectionName)
        shareCollection,
    required TResult Function() emptyCardsList,
    required TResult Function(CardEntity cardEntity) swipeCard,
    required TResult Function() finishLearn,
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
    TResult? Function(String collectionId, String sender)? createSharedCards,
    TResult? Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult? Function(String collectionId, String collectionName)?
        shareCollection,
    TResult? Function()? emptyCardsList,
    TResult? Function(CardEntity cardEntity)? swipeCard,
    TResult? Function()? finishLearn,
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
    TResult Function(String collectionId, String sender)? createSharedCards,
    TResult Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult Function(String collectionId, String collectionName)?
        shareCollection,
    TResult Function()? emptyCardsList,
    TResult Function(CardEntity cardEntity)? swipeCard,
    TResult Function()? finishLearn,
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
    required TResult Function(_CreateSharedCards value) createSharedCards,
    required TResult Function(_ImportExcel value) importExcel,
    required TResult Function(_ShareCard value) shareCollection,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
    required TResult Function(_SwipeCard value) swipeCard,
    required TResult Function(_FinishLearn value) finishLearn,
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
    TResult? Function(_CreateSharedCards value)? createSharedCards,
    TResult? Function(_ImportExcel value)? importExcel,
    TResult? Function(_ShareCard value)? shareCollection,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
    TResult? Function(_SwipeCard value)? swipeCard,
    TResult? Function(_FinishLearn value)? finishLearn,
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
    TResult Function(_CreateSharedCards value)? createSharedCards,
    TResult Function(_ImportExcel value)? importExcel,
    TResult Function(_ShareCard value)? shareCollection,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    TResult Function(_SwipeCard value)? swipeCard,
    TResult Function(_FinishLearn value)? finishLearn,
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
    required TResult Function(String collectionId, String sender)
        createSharedCards,
    required TResult Function(
            String path, String collectionId, String collectionName)
        importExcel,
    required TResult Function(String collectionId, String collectionName)
        shareCollection,
    required TResult Function() emptyCardsList,
    required TResult Function(CardEntity cardEntity) swipeCard,
    required TResult Function() finishLearn,
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
    TResult? Function(String collectionId, String sender)? createSharedCards,
    TResult? Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult? Function(String collectionId, String collectionName)?
        shareCollection,
    TResult? Function()? emptyCardsList,
    TResult? Function(CardEntity cardEntity)? swipeCard,
    TResult? Function()? finishLearn,
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
    TResult Function(String collectionId, String sender)? createSharedCards,
    TResult Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult Function(String collectionId, String collectionName)?
        shareCollection,
    TResult Function()? emptyCardsList,
    TResult Function(CardEntity cardEntity)? swipeCard,
    TResult Function()? finishLearn,
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
    required TResult Function(_CreateSharedCards value) createSharedCards,
    required TResult Function(_ImportExcel value) importExcel,
    required TResult Function(_ShareCard value) shareCollection,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
    required TResult Function(_SwipeCard value) swipeCard,
    required TResult Function(_FinishLearn value) finishLearn,
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
    TResult? Function(_CreateSharedCards value)? createSharedCards,
    TResult? Function(_ImportExcel value)? importExcel,
    TResult? Function(_ShareCard value)? shareCollection,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
    TResult? Function(_SwipeCard value)? swipeCard,
    TResult? Function(_FinishLearn value)? finishLearn,
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
    TResult Function(_CreateSharedCards value)? createSharedCards,
    TResult Function(_ImportExcel value)? importExcel,
    TResult Function(_ShareCard value)? shareCollection,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    TResult Function(_SwipeCard value)? swipeCard,
    TResult Function(_FinishLearn value)? finishLearn,
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
    required TResult Function(String collectionId, String sender)
        createSharedCards,
    required TResult Function(
            String path, String collectionId, String collectionName)
        importExcel,
    required TResult Function(String collectionId, String collectionName)
        shareCollection,
    required TResult Function() emptyCardsList,
    required TResult Function(CardEntity cardEntity) swipeCard,
    required TResult Function() finishLearn,
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
    TResult? Function(String collectionId, String sender)? createSharedCards,
    TResult? Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult? Function(String collectionId, String collectionName)?
        shareCollection,
    TResult? Function()? emptyCardsList,
    TResult? Function(CardEntity cardEntity)? swipeCard,
    TResult? Function()? finishLearn,
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
    TResult Function(String collectionId, String sender)? createSharedCards,
    TResult Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult Function(String collectionId, String collectionName)?
        shareCollection,
    TResult Function()? emptyCardsList,
    TResult Function(CardEntity cardEntity)? swipeCard,
    TResult Function()? finishLearn,
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
    required TResult Function(_CreateSharedCards value) createSharedCards,
    required TResult Function(_ImportExcel value) importExcel,
    required TResult Function(_ShareCard value) shareCollection,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
    required TResult Function(_SwipeCard value) swipeCard,
    required TResult Function(_FinishLearn value) finishLearn,
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
    TResult? Function(_CreateSharedCards value)? createSharedCards,
    TResult? Function(_ImportExcel value)? importExcel,
    TResult? Function(_ShareCard value)? shareCollection,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
    TResult? Function(_SwipeCard value)? swipeCard,
    TResult? Function(_FinishLearn value)? finishLearn,
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
    TResult Function(_CreateSharedCards value)? createSharedCards,
    TResult Function(_ImportExcel value)? importExcel,
    TResult Function(_ShareCard value)? shareCollection,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    TResult Function(_SwipeCard value)? swipeCard,
    TResult Function(_FinishLearn value)? finishLearn,
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
abstract class _$$CreateSharedCardsImplCopyWith<$Res> {
  factory _$$CreateSharedCardsImplCopyWith(_$CreateSharedCardsImpl value,
          $Res Function(_$CreateSharedCardsImpl) then) =
      __$$CreateSharedCardsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String collectionId, String sender});
}

/// @nodoc
class __$$CreateSharedCardsImplCopyWithImpl<$Res>
    extends _$CardsEventCopyWithImpl<$Res, _$CreateSharedCardsImpl>
    implements _$$CreateSharedCardsImplCopyWith<$Res> {
  __$$CreateSharedCardsImplCopyWithImpl(_$CreateSharedCardsImpl _value,
      $Res Function(_$CreateSharedCardsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionId = null,
    Object? sender = null,
  }) {
    return _then(_$CreateSharedCardsImpl(
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateSharedCardsImpl implements _CreateSharedCards {
  const _$CreateSharedCardsImpl(
      {required this.collectionId, required this.sender});

  @override
  final String collectionId;
  @override
  final String sender;

  @override
  String toString() {
    return 'CardsEvent.createSharedCards(collectionId: $collectionId, sender: $sender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSharedCardsImpl &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.sender, sender) || other.sender == sender));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collectionId, sender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSharedCardsImplCopyWith<_$CreateSharedCardsImpl> get copyWith =>
      __$$CreateSharedCardsImplCopyWithImpl<_$CreateSharedCardsImpl>(
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
    required TResult Function(String collectionId, String sender)
        createSharedCards,
    required TResult Function(
            String path, String collectionId, String collectionName)
        importExcel,
    required TResult Function(String collectionId, String collectionName)
        shareCollection,
    required TResult Function() emptyCardsList,
    required TResult Function(CardEntity cardEntity) swipeCard,
    required TResult Function() finishLearn,
  }) {
    return createSharedCards(collectionId, sender);
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
    TResult? Function(String collectionId, String sender)? createSharedCards,
    TResult? Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult? Function(String collectionId, String collectionName)?
        shareCollection,
    TResult? Function()? emptyCardsList,
    TResult? Function(CardEntity cardEntity)? swipeCard,
    TResult? Function()? finishLearn,
  }) {
    return createSharedCards?.call(collectionId, sender);
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
    TResult Function(String collectionId, String sender)? createSharedCards,
    TResult Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult Function(String collectionId, String collectionName)?
        shareCollection,
    TResult Function()? emptyCardsList,
    TResult Function(CardEntity cardEntity)? swipeCard,
    TResult Function()? finishLearn,
    required TResult orElse(),
  }) {
    if (createSharedCards != null) {
      return createSharedCards(collectionId, sender);
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
    required TResult Function(_CreateSharedCards value) createSharedCards,
    required TResult Function(_ImportExcel value) importExcel,
    required TResult Function(_ShareCard value) shareCollection,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
    required TResult Function(_SwipeCard value) swipeCard,
    required TResult Function(_FinishLearn value) finishLearn,
  }) {
    return createSharedCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditCard value)? editCard,
    TResult? Function(_InitCard value)? initCard,
    TResult? Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult? Function(_CreateNewCard value)? createNewCard,
    TResult? Function(_CreateSharedCards value)? createSharedCards,
    TResult? Function(_ImportExcel value)? importExcel,
    TResult? Function(_ShareCard value)? shareCollection,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
    TResult? Function(_SwipeCard value)? swipeCard,
    TResult? Function(_FinishLearn value)? finishLearn,
  }) {
    return createSharedCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditCard value)? editCard,
    TResult Function(_InitCard value)? initCard,
    TResult Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult Function(_CreateNewCard value)? createNewCard,
    TResult Function(_CreateSharedCards value)? createSharedCards,
    TResult Function(_ImportExcel value)? importExcel,
    TResult Function(_ShareCard value)? shareCollection,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    TResult Function(_SwipeCard value)? swipeCard,
    TResult Function(_FinishLearn value)? finishLearn,
    required TResult orElse(),
  }) {
    if (createSharedCards != null) {
      return createSharedCards(this);
    }
    return orElse();
  }
}

abstract class _CreateSharedCards implements CardsEvent {
  const factory _CreateSharedCards(
      {required final String collectionId,
      required final String sender}) = _$CreateSharedCardsImpl;

  String get collectionId;
  String get sender;
  @JsonKey(ignore: true)
  _$$CreateSharedCardsImplCopyWith<_$CreateSharedCardsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImportExcelImplCopyWith<$Res> {
  factory _$$ImportExcelImplCopyWith(
          _$ImportExcelImpl value, $Res Function(_$ImportExcelImpl) then) =
      __$$ImportExcelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String path, String collectionId, String collectionName});
}

/// @nodoc
class __$$ImportExcelImplCopyWithImpl<$Res>
    extends _$CardsEventCopyWithImpl<$Res, _$ImportExcelImpl>
    implements _$$ImportExcelImplCopyWith<$Res> {
  __$$ImportExcelImplCopyWithImpl(
      _$ImportExcelImpl _value, $Res Function(_$ImportExcelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? collectionId = null,
    Object? collectionName = null,
  }) {
    return _then(_$ImportExcelImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImportExcelImpl implements _ImportExcel {
  const _$ImportExcelImpl(
      {required this.path,
      required this.collectionId,
      required this.collectionName});

  @override
  final String path;
  @override
  final String collectionId;
  @override
  final String collectionName;

  @override
  String toString() {
    return 'CardsEvent.importExcel(path: $path, collectionId: $collectionId, collectionName: $collectionName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportExcelImpl &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, path, collectionId, collectionName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportExcelImplCopyWith<_$ImportExcelImpl> get copyWith =>
      __$$ImportExcelImplCopyWithImpl<_$ImportExcelImpl>(this, _$identity);

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
    required TResult Function(String collectionId, String sender)
        createSharedCards,
    required TResult Function(
            String path, String collectionId, String collectionName)
        importExcel,
    required TResult Function(String collectionId, String collectionName)
        shareCollection,
    required TResult Function() emptyCardsList,
    required TResult Function(CardEntity cardEntity) swipeCard,
    required TResult Function() finishLearn,
  }) {
    return importExcel(path, collectionId, collectionName);
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
    TResult? Function(String collectionId, String sender)? createSharedCards,
    TResult? Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult? Function(String collectionId, String collectionName)?
        shareCollection,
    TResult? Function()? emptyCardsList,
    TResult? Function(CardEntity cardEntity)? swipeCard,
    TResult? Function()? finishLearn,
  }) {
    return importExcel?.call(path, collectionId, collectionName);
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
    TResult Function(String collectionId, String sender)? createSharedCards,
    TResult Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult Function(String collectionId, String collectionName)?
        shareCollection,
    TResult Function()? emptyCardsList,
    TResult Function(CardEntity cardEntity)? swipeCard,
    TResult Function()? finishLearn,
    required TResult orElse(),
  }) {
    if (importExcel != null) {
      return importExcel(path, collectionId, collectionName);
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
    required TResult Function(_CreateSharedCards value) createSharedCards,
    required TResult Function(_ImportExcel value) importExcel,
    required TResult Function(_ShareCard value) shareCollection,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
    required TResult Function(_SwipeCard value) swipeCard,
    required TResult Function(_FinishLearn value) finishLearn,
  }) {
    return importExcel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditCard value)? editCard,
    TResult? Function(_InitCard value)? initCard,
    TResult? Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult? Function(_CreateNewCard value)? createNewCard,
    TResult? Function(_CreateSharedCards value)? createSharedCards,
    TResult? Function(_ImportExcel value)? importExcel,
    TResult? Function(_ShareCard value)? shareCollection,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
    TResult? Function(_SwipeCard value)? swipeCard,
    TResult? Function(_FinishLearn value)? finishLearn,
  }) {
    return importExcel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditCard value)? editCard,
    TResult Function(_InitCard value)? initCard,
    TResult Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult Function(_CreateNewCard value)? createNewCard,
    TResult Function(_CreateSharedCards value)? createSharedCards,
    TResult Function(_ImportExcel value)? importExcel,
    TResult Function(_ShareCard value)? shareCollection,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    TResult Function(_SwipeCard value)? swipeCard,
    TResult Function(_FinishLearn value)? finishLearn,
    required TResult orElse(),
  }) {
    if (importExcel != null) {
      return importExcel(this);
    }
    return orElse();
  }
}

abstract class _ImportExcel implements CardsEvent {
  const factory _ImportExcel(
      {required final String path,
      required final String collectionId,
      required final String collectionName}) = _$ImportExcelImpl;

  String get path;
  String get collectionId;
  String get collectionName;
  @JsonKey(ignore: true)
  _$$ImportExcelImplCopyWith<_$ImportExcelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShareCardImplCopyWith<$Res> {
  factory _$$ShareCardImplCopyWith(
          _$ShareCardImpl value, $Res Function(_$ShareCardImpl) then) =
      __$$ShareCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String collectionId, String collectionName});
}

/// @nodoc
class __$$ShareCardImplCopyWithImpl<$Res>
    extends _$CardsEventCopyWithImpl<$Res, _$ShareCardImpl>
    implements _$$ShareCardImplCopyWith<$Res> {
  __$$ShareCardImplCopyWithImpl(
      _$ShareCardImpl _value, $Res Function(_$ShareCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionId = null,
    Object? collectionName = null,
  }) {
    return _then(_$ShareCardImpl(
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShareCardImpl implements _ShareCard {
  const _$ShareCardImpl(
      {required this.collectionId, required this.collectionName});

  @override
  final String collectionId;
  @override
  final String collectionName;

  @override
  String toString() {
    return 'CardsEvent.shareCollection(collectionId: $collectionId, collectionName: $collectionName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShareCardImpl &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collectionId, collectionName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShareCardImplCopyWith<_$ShareCardImpl> get copyWith =>
      __$$ShareCardImplCopyWithImpl<_$ShareCardImpl>(this, _$identity);

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
    required TResult Function(String collectionId, String sender)
        createSharedCards,
    required TResult Function(
            String path, String collectionId, String collectionName)
        importExcel,
    required TResult Function(String collectionId, String collectionName)
        shareCollection,
    required TResult Function() emptyCardsList,
    required TResult Function(CardEntity cardEntity) swipeCard,
    required TResult Function() finishLearn,
  }) {
    return shareCollection(collectionId, collectionName);
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
    TResult? Function(String collectionId, String sender)? createSharedCards,
    TResult? Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult? Function(String collectionId, String collectionName)?
        shareCollection,
    TResult? Function()? emptyCardsList,
    TResult? Function(CardEntity cardEntity)? swipeCard,
    TResult? Function()? finishLearn,
  }) {
    return shareCollection?.call(collectionId, collectionName);
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
    TResult Function(String collectionId, String sender)? createSharedCards,
    TResult Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult Function(String collectionId, String collectionName)?
        shareCollection,
    TResult Function()? emptyCardsList,
    TResult Function(CardEntity cardEntity)? swipeCard,
    TResult Function()? finishLearn,
    required TResult orElse(),
  }) {
    if (shareCollection != null) {
      return shareCollection(collectionId, collectionName);
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
    required TResult Function(_CreateSharedCards value) createSharedCards,
    required TResult Function(_ImportExcel value) importExcel,
    required TResult Function(_ShareCard value) shareCollection,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
    required TResult Function(_SwipeCard value) swipeCard,
    required TResult Function(_FinishLearn value) finishLearn,
  }) {
    return shareCollection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditCard value)? editCard,
    TResult? Function(_InitCard value)? initCard,
    TResult? Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult? Function(_CreateNewCard value)? createNewCard,
    TResult? Function(_CreateSharedCards value)? createSharedCards,
    TResult? Function(_ImportExcel value)? importExcel,
    TResult? Function(_ShareCard value)? shareCollection,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
    TResult? Function(_SwipeCard value)? swipeCard,
    TResult? Function(_FinishLearn value)? finishLearn,
  }) {
    return shareCollection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditCard value)? editCard,
    TResult Function(_InitCard value)? initCard,
    TResult Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult Function(_CreateNewCard value)? createNewCard,
    TResult Function(_CreateSharedCards value)? createSharedCards,
    TResult Function(_ImportExcel value)? importExcel,
    TResult Function(_ShareCard value)? shareCollection,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    TResult Function(_SwipeCard value)? swipeCard,
    TResult Function(_FinishLearn value)? finishLearn,
    required TResult orElse(),
  }) {
    if (shareCollection != null) {
      return shareCollection(this);
    }
    return orElse();
  }
}

abstract class _ShareCard implements CardsEvent {
  const factory _ShareCard(
      {required final String collectionId,
      required final String collectionName}) = _$ShareCardImpl;

  String get collectionId;
  String get collectionName;
  @JsonKey(ignore: true)
  _$$ShareCardImplCopyWith<_$ShareCardImpl> get copyWith =>
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
    required TResult Function(String collectionId, String sender)
        createSharedCards,
    required TResult Function(
            String path, String collectionId, String collectionName)
        importExcel,
    required TResult Function(String collectionId, String collectionName)
        shareCollection,
    required TResult Function() emptyCardsList,
    required TResult Function(CardEntity cardEntity) swipeCard,
    required TResult Function() finishLearn,
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
    TResult? Function(String collectionId, String sender)? createSharedCards,
    TResult? Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult? Function(String collectionId, String collectionName)?
        shareCollection,
    TResult? Function()? emptyCardsList,
    TResult? Function(CardEntity cardEntity)? swipeCard,
    TResult? Function()? finishLearn,
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
    TResult Function(String collectionId, String sender)? createSharedCards,
    TResult Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult Function(String collectionId, String collectionName)?
        shareCollection,
    TResult Function()? emptyCardsList,
    TResult Function(CardEntity cardEntity)? swipeCard,
    TResult Function()? finishLearn,
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
    required TResult Function(_CreateSharedCards value) createSharedCards,
    required TResult Function(_ImportExcel value) importExcel,
    required TResult Function(_ShareCard value) shareCollection,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
    required TResult Function(_SwipeCard value) swipeCard,
    required TResult Function(_FinishLearn value) finishLearn,
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
    TResult? Function(_CreateSharedCards value)? createSharedCards,
    TResult? Function(_ImportExcel value)? importExcel,
    TResult? Function(_ShareCard value)? shareCollection,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
    TResult? Function(_SwipeCard value)? swipeCard,
    TResult? Function(_FinishLearn value)? finishLearn,
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
    TResult Function(_CreateSharedCards value)? createSharedCards,
    TResult Function(_ImportExcel value)? importExcel,
    TResult Function(_ShareCard value)? shareCollection,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    TResult Function(_SwipeCard value)? swipeCard,
    TResult Function(_FinishLearn value)? finishLearn,
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
abstract class _$$SwipeCardImplCopyWith<$Res> {
  factory _$$SwipeCardImplCopyWith(
          _$SwipeCardImpl value, $Res Function(_$SwipeCardImpl) then) =
      __$$SwipeCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CardEntity cardEntity});

  $CardEntityCopyWith<$Res> get cardEntity;
}

/// @nodoc
class __$$SwipeCardImplCopyWithImpl<$Res>
    extends _$CardsEventCopyWithImpl<$Res, _$SwipeCardImpl>
    implements _$$SwipeCardImplCopyWith<$Res> {
  __$$SwipeCardImplCopyWithImpl(
      _$SwipeCardImpl _value, $Res Function(_$SwipeCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardEntity = null,
  }) {
    return _then(_$SwipeCardImpl(
      cardEntity: null == cardEntity
          ? _value.cardEntity
          : cardEntity // ignore: cast_nullable_to_non_nullable
              as CardEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CardEntityCopyWith<$Res> get cardEntity {
    return $CardEntityCopyWith<$Res>(_value.cardEntity, (value) {
      return _then(_value.copyWith(cardEntity: value));
    });
  }
}

/// @nodoc

class _$SwipeCardImpl implements _SwipeCard {
  const _$SwipeCardImpl({required this.cardEntity});

  @override
  final CardEntity cardEntity;

  @override
  String toString() {
    return 'CardsEvent.swipeCard(cardEntity: $cardEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwipeCardImpl &&
            (identical(other.cardEntity, cardEntity) ||
                other.cardEntity == cardEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwipeCardImplCopyWith<_$SwipeCardImpl> get copyWith =>
      __$$SwipeCardImplCopyWithImpl<_$SwipeCardImpl>(this, _$identity);

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
    required TResult Function(String collectionId, String sender)
        createSharedCards,
    required TResult Function(
            String path, String collectionId, String collectionName)
        importExcel,
    required TResult Function(String collectionId, String collectionName)
        shareCollection,
    required TResult Function() emptyCardsList,
    required TResult Function(CardEntity cardEntity) swipeCard,
    required TResult Function() finishLearn,
  }) {
    return swipeCard(cardEntity);
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
    TResult? Function(String collectionId, String sender)? createSharedCards,
    TResult? Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult? Function(String collectionId, String collectionName)?
        shareCollection,
    TResult? Function()? emptyCardsList,
    TResult? Function(CardEntity cardEntity)? swipeCard,
    TResult? Function()? finishLearn,
  }) {
    return swipeCard?.call(cardEntity);
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
    TResult Function(String collectionId, String sender)? createSharedCards,
    TResult Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult Function(String collectionId, String collectionName)?
        shareCollection,
    TResult Function()? emptyCardsList,
    TResult Function(CardEntity cardEntity)? swipeCard,
    TResult Function()? finishLearn,
    required TResult orElse(),
  }) {
    if (swipeCard != null) {
      return swipeCard(cardEntity);
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
    required TResult Function(_CreateSharedCards value) createSharedCards,
    required TResult Function(_ImportExcel value) importExcel,
    required TResult Function(_ShareCard value) shareCollection,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
    required TResult Function(_SwipeCard value) swipeCard,
    required TResult Function(_FinishLearn value) finishLearn,
  }) {
    return swipeCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditCard value)? editCard,
    TResult? Function(_InitCard value)? initCard,
    TResult? Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult? Function(_CreateNewCard value)? createNewCard,
    TResult? Function(_CreateSharedCards value)? createSharedCards,
    TResult? Function(_ImportExcel value)? importExcel,
    TResult? Function(_ShareCard value)? shareCollection,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
    TResult? Function(_SwipeCard value)? swipeCard,
    TResult? Function(_FinishLearn value)? finishLearn,
  }) {
    return swipeCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditCard value)? editCard,
    TResult Function(_InitCard value)? initCard,
    TResult Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult Function(_CreateNewCard value)? createNewCard,
    TResult Function(_CreateSharedCards value)? createSharedCards,
    TResult Function(_ImportExcel value)? importExcel,
    TResult Function(_ShareCard value)? shareCollection,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    TResult Function(_SwipeCard value)? swipeCard,
    TResult Function(_FinishLearn value)? finishLearn,
    required TResult orElse(),
  }) {
    if (swipeCard != null) {
      return swipeCard(this);
    }
    return orElse();
  }
}

abstract class _SwipeCard implements CardsEvent {
  const factory _SwipeCard({required final CardEntity cardEntity}) =
      _$SwipeCardImpl;

  CardEntity get cardEntity;
  @JsonKey(ignore: true)
  _$$SwipeCardImplCopyWith<_$SwipeCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FinishLearnImplCopyWith<$Res> {
  factory _$$FinishLearnImplCopyWith(
          _$FinishLearnImpl value, $Res Function(_$FinishLearnImpl) then) =
      __$$FinishLearnImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FinishLearnImplCopyWithImpl<$Res>
    extends _$CardsEventCopyWithImpl<$Res, _$FinishLearnImpl>
    implements _$$FinishLearnImplCopyWith<$Res> {
  __$$FinishLearnImplCopyWithImpl(
      _$FinishLearnImpl _value, $Res Function(_$FinishLearnImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FinishLearnImpl implements _FinishLearn {
  const _$FinishLearnImpl();

  @override
  String toString() {
    return 'CardsEvent.finishLearn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FinishLearnImpl);
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
    required TResult Function(String collectionId, String sender)
        createSharedCards,
    required TResult Function(
            String path, String collectionId, String collectionName)
        importExcel,
    required TResult Function(String collectionId, String collectionName)
        shareCollection,
    required TResult Function() emptyCardsList,
    required TResult Function(CardEntity cardEntity) swipeCard,
    required TResult Function() finishLearn,
  }) {
    return finishLearn();
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
    TResult? Function(String collectionId, String sender)? createSharedCards,
    TResult? Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult? Function(String collectionId, String collectionName)?
        shareCollection,
    TResult? Function()? emptyCardsList,
    TResult? Function(CardEntity cardEntity)? swipeCard,
    TResult? Function()? finishLearn,
  }) {
    return finishLearn?.call();
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
    TResult Function(String collectionId, String sender)? createSharedCards,
    TResult Function(String path, String collectionId, String collectionName)?
        importExcel,
    TResult Function(String collectionId, String collectionName)?
        shareCollection,
    TResult Function()? emptyCardsList,
    TResult Function(CardEntity cardEntity)? swipeCard,
    TResult Function()? finishLearn,
    required TResult orElse(),
  }) {
    if (finishLearn != null) {
      return finishLearn();
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
    required TResult Function(_CreateSharedCards value) createSharedCards,
    required TResult Function(_ImportExcel value) importExcel,
    required TResult Function(_ShareCard value) shareCollection,
    required TResult Function(_EmptyCardsList value) emptyCardsList,
    required TResult Function(_SwipeCard value) swipeCard,
    required TResult Function(_FinishLearn value) finishLearn,
  }) {
    return finishLearn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditCard value)? editCard,
    TResult? Function(_InitCard value)? initCard,
    TResult? Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult? Function(_CreateNewCard value)? createNewCard,
    TResult? Function(_CreateSharedCards value)? createSharedCards,
    TResult? Function(_ImportExcel value)? importExcel,
    TResult? Function(_ShareCard value)? shareCollection,
    TResult? Function(_EmptyCardsList value)? emptyCardsList,
    TResult? Function(_SwipeCard value)? swipeCard,
    TResult? Function(_FinishLearn value)? finishLearn,
  }) {
    return finishLearn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditCard value)? editCard,
    TResult Function(_InitCard value)? initCard,
    TResult Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult Function(_CreateNewCard value)? createNewCard,
    TResult Function(_CreateSharedCards value)? createSharedCards,
    TResult Function(_ImportExcel value)? importExcel,
    TResult Function(_ShareCard value)? shareCollection,
    TResult Function(_EmptyCardsList value)? emptyCardsList,
    TResult Function(_SwipeCard value)? swipeCard,
    TResult Function(_FinishLearn value)? finishLearn,
    required TResult orElse(),
  }) {
    if (finishLearn != null) {
      return finishLearn(this);
    }
    return orElse();
  }
}

abstract class _FinishLearn implements CardsEvent {
  const factory _FinishLearn() = _$FinishLearnImpl;
}

/// @nodoc
mixin _$CardsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CardEntity>? cardsList) loaded,
    required TResult Function() viewIndividualCard,
    required TResult Function() loading,
    required TResult Function() successfullyImported,
    required TResult Function(String error) error,
    required TResult Function() finishLearning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CardEntity>? cardsList)? loaded,
    TResult? Function()? viewIndividualCard,
    TResult? Function()? loading,
    TResult? Function()? successfullyImported,
    TResult? Function(String error)? error,
    TResult? Function()? finishLearning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CardEntity>? cardsList)? loaded,
    TResult Function()? viewIndividualCard,
    TResult Function()? loading,
    TResult Function()? successfullyImported,
    TResult Function(String error)? error,
    TResult Function()? finishLearning,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ViewIndividualCard value) viewIndividualCard,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessfullyImported value) successfullyImported,
    required TResult Function(_Error value) error,
    required TResult Function(_FinishLearning value) finishLearning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessfullyImported value)? successfullyImported,
    TResult? Function(_Error value)? error,
    TResult? Function(_FinishLearning value)? finishLearning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessfullyImported value)? successfullyImported,
    TResult Function(_Error value)? error,
    TResult Function(_FinishLearning value)? finishLearning,
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
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CardEntity>? cardsList});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardsList = freezed,
  }) {
    return _then(_$LoadedImpl(
      cardsList: freezed == cardsList
          ? _value._cardsList
          : cardsList // ignore: cast_nullable_to_non_nullable
              as List<CardEntity>?,
    ));
  }
}

/// @nodoc

class _$LoadedImpl extends _Loaded {
  const _$LoadedImpl({required final List<CardEntity>? cardsList})
      : _cardsList = cardsList,
        super._();

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
    return 'CardsState.loaded(cardsList: $cardsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._cardsList, _cardsList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cardsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CardEntity>? cardsList) loaded,
    required TResult Function() viewIndividualCard,
    required TResult Function() loading,
    required TResult Function() successfullyImported,
    required TResult Function(String error) error,
    required TResult Function() finishLearning,
  }) {
    return loaded(cardsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CardEntity>? cardsList)? loaded,
    TResult? Function()? viewIndividualCard,
    TResult? Function()? loading,
    TResult? Function()? successfullyImported,
    TResult? Function(String error)? error,
    TResult? Function()? finishLearning,
  }) {
    return loaded?.call(cardsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CardEntity>? cardsList)? loaded,
    TResult Function()? viewIndividualCard,
    TResult Function()? loading,
    TResult Function()? successfullyImported,
    TResult Function(String error)? error,
    TResult Function()? finishLearning,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(cardsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ViewIndividualCard value) viewIndividualCard,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessfullyImported value) successfullyImported,
    required TResult Function(_Error value) error,
    required TResult Function(_FinishLearning value) finishLearning,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessfullyImported value)? successfullyImported,
    TResult? Function(_Error value)? error,
    TResult? Function(_FinishLearning value)? finishLearning,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessfullyImported value)? successfullyImported,
    TResult Function(_Error value)? error,
    TResult Function(_FinishLearning value)? finishLearning,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded extends CardsState {
  const factory _Loaded({required final List<CardEntity>? cardsList}) =
      _$LoadedImpl;
  const _Loaded._() : super._();

  List<CardEntity>? get cardsList;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
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

class _$ViewIndividualCardImpl extends _ViewIndividualCard {
  const _$ViewIndividualCardImpl() : super._();

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
    required TResult Function(List<CardEntity>? cardsList) loaded,
    required TResult Function() viewIndividualCard,
    required TResult Function() loading,
    required TResult Function() successfullyImported,
    required TResult Function(String error) error,
    required TResult Function() finishLearning,
  }) {
    return viewIndividualCard();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CardEntity>? cardsList)? loaded,
    TResult? Function()? viewIndividualCard,
    TResult? Function()? loading,
    TResult? Function()? successfullyImported,
    TResult? Function(String error)? error,
    TResult? Function()? finishLearning,
  }) {
    return viewIndividualCard?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CardEntity>? cardsList)? loaded,
    TResult Function()? viewIndividualCard,
    TResult Function()? loading,
    TResult Function()? successfullyImported,
    TResult Function(String error)? error,
    TResult Function()? finishLearning,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ViewIndividualCard value) viewIndividualCard,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessfullyImported value) successfullyImported,
    required TResult Function(_Error value) error,
    required TResult Function(_FinishLearning value) finishLearning,
  }) {
    return viewIndividualCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessfullyImported value)? successfullyImported,
    TResult? Function(_Error value)? error,
    TResult? Function(_FinishLearning value)? finishLearning,
  }) {
    return viewIndividualCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessfullyImported value)? successfullyImported,
    TResult Function(_Error value)? error,
    TResult Function(_FinishLearning value)? finishLearning,
    required TResult orElse(),
  }) {
    if (viewIndividualCard != null) {
      return viewIndividualCard(this);
    }
    return orElse();
  }
}

abstract class _ViewIndividualCard extends CardsState {
  const factory _ViewIndividualCard() = _$ViewIndividualCardImpl;
  const _ViewIndividualCard._() : super._();
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

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl() : super._();

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
    required TResult Function(List<CardEntity>? cardsList) loaded,
    required TResult Function() viewIndividualCard,
    required TResult Function() loading,
    required TResult Function() successfullyImported,
    required TResult Function(String error) error,
    required TResult Function() finishLearning,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CardEntity>? cardsList)? loaded,
    TResult? Function()? viewIndividualCard,
    TResult? Function()? loading,
    TResult? Function()? successfullyImported,
    TResult? Function(String error)? error,
    TResult? Function()? finishLearning,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CardEntity>? cardsList)? loaded,
    TResult Function()? viewIndividualCard,
    TResult Function()? loading,
    TResult Function()? successfullyImported,
    TResult Function(String error)? error,
    TResult Function()? finishLearning,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ViewIndividualCard value) viewIndividualCard,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessfullyImported value) successfullyImported,
    required TResult Function(_Error value) error,
    required TResult Function(_FinishLearning value) finishLearning,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessfullyImported value)? successfullyImported,
    TResult? Function(_Error value)? error,
    TResult? Function(_FinishLearning value)? finishLearning,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessfullyImported value)? successfullyImported,
    TResult Function(_Error value)? error,
    TResult Function(_FinishLearning value)? finishLearning,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends CardsState {
  const factory _Loading() = _$LoadingImpl;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$SuccessfullyImportedImplCopyWith<$Res> {
  factory _$$SuccessfullyImportedImplCopyWith(_$SuccessfullyImportedImpl value,
          $Res Function(_$SuccessfullyImportedImpl) then) =
      __$$SuccessfullyImportedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessfullyImportedImplCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$SuccessfullyImportedImpl>
    implements _$$SuccessfullyImportedImplCopyWith<$Res> {
  __$$SuccessfullyImportedImplCopyWithImpl(_$SuccessfullyImportedImpl _value,
      $Res Function(_$SuccessfullyImportedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessfullyImportedImpl extends _SuccessfullyImported {
  const _$SuccessfullyImportedImpl() : super._();

  @override
  String toString() {
    return 'CardsState.successfullyImported()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessfullyImportedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CardEntity>? cardsList) loaded,
    required TResult Function() viewIndividualCard,
    required TResult Function() loading,
    required TResult Function() successfullyImported,
    required TResult Function(String error) error,
    required TResult Function() finishLearning,
  }) {
    return successfullyImported();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CardEntity>? cardsList)? loaded,
    TResult? Function()? viewIndividualCard,
    TResult? Function()? loading,
    TResult? Function()? successfullyImported,
    TResult? Function(String error)? error,
    TResult? Function()? finishLearning,
  }) {
    return successfullyImported?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CardEntity>? cardsList)? loaded,
    TResult Function()? viewIndividualCard,
    TResult Function()? loading,
    TResult Function()? successfullyImported,
    TResult Function(String error)? error,
    TResult Function()? finishLearning,
    required TResult orElse(),
  }) {
    if (successfullyImported != null) {
      return successfullyImported();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ViewIndividualCard value) viewIndividualCard,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessfullyImported value) successfullyImported,
    required TResult Function(_Error value) error,
    required TResult Function(_FinishLearning value) finishLearning,
  }) {
    return successfullyImported(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessfullyImported value)? successfullyImported,
    TResult? Function(_Error value)? error,
    TResult? Function(_FinishLearning value)? finishLearning,
  }) {
    return successfullyImported?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessfullyImported value)? successfullyImported,
    TResult Function(_Error value)? error,
    TResult Function(_FinishLearning value)? finishLearning,
    required TResult orElse(),
  }) {
    if (successfullyImported != null) {
      return successfullyImported(this);
    }
    return orElse();
  }
}

abstract class _SuccessfullyImported extends CardsState {
  const factory _SuccessfullyImported() = _$SuccessfullyImportedImpl;
  const _SuccessfullyImported._() : super._();
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
    extends _$CardsStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'CardsState.error(error: $error)';
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
    required TResult Function(List<CardEntity>? cardsList) loaded,
    required TResult Function() viewIndividualCard,
    required TResult Function() loading,
    required TResult Function() successfullyImported,
    required TResult Function(String error) error,
    required TResult Function() finishLearning,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CardEntity>? cardsList)? loaded,
    TResult? Function()? viewIndividualCard,
    TResult? Function()? loading,
    TResult? Function()? successfullyImported,
    TResult? Function(String error)? error,
    TResult? Function()? finishLearning,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CardEntity>? cardsList)? loaded,
    TResult Function()? viewIndividualCard,
    TResult Function()? loading,
    TResult Function()? successfullyImported,
    TResult Function(String error)? error,
    TResult Function()? finishLearning,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ViewIndividualCard value) viewIndividualCard,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessfullyImported value) successfullyImported,
    required TResult Function(_Error value) error,
    required TResult Function(_FinishLearning value) finishLearning,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessfullyImported value)? successfullyImported,
    TResult? Function(_Error value)? error,
    TResult? Function(_FinishLearning value)? finishLearning,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessfullyImported value)? successfullyImported,
    TResult Function(_Error value)? error,
    TResult Function(_FinishLearning value)? finishLearning,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends CardsState {
  const factory _Error({required final String error}) = _$ErrorImpl;
  const _Error._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FinishLearningImplCopyWith<$Res> {
  factory _$$FinishLearningImplCopyWith(_$FinishLearningImpl value,
          $Res Function(_$FinishLearningImpl) then) =
      __$$FinishLearningImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FinishLearningImplCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$FinishLearningImpl>
    implements _$$FinishLearningImplCopyWith<$Res> {
  __$$FinishLearningImplCopyWithImpl(
      _$FinishLearningImpl _value, $Res Function(_$FinishLearningImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FinishLearningImpl extends _FinishLearning {
  const _$FinishLearningImpl() : super._();

  @override
  String toString() {
    return 'CardsState.finishLearning()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FinishLearningImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CardEntity>? cardsList) loaded,
    required TResult Function() viewIndividualCard,
    required TResult Function() loading,
    required TResult Function() successfullyImported,
    required TResult Function(String error) error,
    required TResult Function() finishLearning,
  }) {
    return finishLearning();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CardEntity>? cardsList)? loaded,
    TResult? Function()? viewIndividualCard,
    TResult? Function()? loading,
    TResult? Function()? successfullyImported,
    TResult? Function(String error)? error,
    TResult? Function()? finishLearning,
  }) {
    return finishLearning?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CardEntity>? cardsList)? loaded,
    TResult Function()? viewIndividualCard,
    TResult Function()? loading,
    TResult Function()? successfullyImported,
    TResult Function(String error)? error,
    TResult Function()? finishLearning,
    required TResult orElse(),
  }) {
    if (finishLearning != null) {
      return finishLearning();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ViewIndividualCard value) viewIndividualCard,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessfullyImported value) successfullyImported,
    required TResult Function(_Error value) error,
    required TResult Function(_FinishLearning value) finishLearning,
  }) {
    return finishLearning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessfullyImported value)? successfullyImported,
    TResult? Function(_Error value)? error,
    TResult? Function(_FinishLearning value)? finishLearning,
  }) {
    return finishLearning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessfullyImported value)? successfullyImported,
    TResult Function(_Error value)? error,
    TResult Function(_FinishLearning value)? finishLearning,
    required TResult orElse(),
  }) {
    if (finishLearning != null) {
      return finishLearning(this);
    }
    return orElse();
  }
}

abstract class _FinishLearning extends CardsState {
  const factory _FinishLearning() = _$FinishLearningImpl;
  const _FinishLearning._() : super._();
}
