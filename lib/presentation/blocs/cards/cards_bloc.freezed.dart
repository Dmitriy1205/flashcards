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
    required TResult Function() editCard,
    required TResult Function() deleteSelectedCards,
    required TResult Function(String front, String back) createNewCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? editCard,
    TResult? Function()? deleteSelectedCards,
    TResult? Function(String front, String back)? createNewCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? editCard,
    TResult Function()? deleteSelectedCards,
    TResult Function(String front, String back)? createNewCard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditCard value) editCard,
    required TResult Function(_DeleteSelectedCards value) deleteSelectedCards,
    required TResult Function(_CreateNewCard value) createNewCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditCard value)? editCard,
    TResult? Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult? Function(_CreateNewCard value)? createNewCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditCard value)? editCard,
    TResult Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult Function(_CreateNewCard value)? createNewCard,
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
}

/// @nodoc
class __$$EditCardImplCopyWithImpl<$Res>
    extends _$CardsEventCopyWithImpl<$Res, _$EditCardImpl>
    implements _$$EditCardImplCopyWith<$Res> {
  __$$EditCardImplCopyWithImpl(
      _$EditCardImpl _value, $Res Function(_$EditCardImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EditCardImpl implements _EditCard {
  const _$EditCardImpl();

  @override
  String toString() {
    return 'CardsEvent.editCard()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditCardImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() editCard,
    required TResult Function() deleteSelectedCards,
    required TResult Function(String front, String back) createNewCard,
  }) {
    return editCard();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? editCard,
    TResult? Function()? deleteSelectedCards,
    TResult? Function(String front, String back)? createNewCard,
  }) {
    return editCard?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? editCard,
    TResult Function()? deleteSelectedCards,
    TResult Function(String front, String back)? createNewCard,
    required TResult orElse(),
  }) {
    if (editCard != null) {
      return editCard();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditCard value) editCard,
    required TResult Function(_DeleteSelectedCards value) deleteSelectedCards,
    required TResult Function(_CreateNewCard value) createNewCard,
  }) {
    return editCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditCard value)? editCard,
    TResult? Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult? Function(_CreateNewCard value)? createNewCard,
  }) {
    return editCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditCard value)? editCard,
    TResult Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult Function(_CreateNewCard value)? createNewCard,
    required TResult orElse(),
  }) {
    if (editCard != null) {
      return editCard(this);
    }
    return orElse();
  }
}

abstract class _EditCard implements CardsEvent {
  const factory _EditCard() = _$EditCardImpl;
}

/// @nodoc
abstract class _$$DeleteSelectedCardsImplCopyWith<$Res> {
  factory _$$DeleteSelectedCardsImplCopyWith(_$DeleteSelectedCardsImpl value,
          $Res Function(_$DeleteSelectedCardsImpl) then) =
      __$$DeleteSelectedCardsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteSelectedCardsImplCopyWithImpl<$Res>
    extends _$CardsEventCopyWithImpl<$Res, _$DeleteSelectedCardsImpl>
    implements _$$DeleteSelectedCardsImplCopyWith<$Res> {
  __$$DeleteSelectedCardsImplCopyWithImpl(_$DeleteSelectedCardsImpl _value,
      $Res Function(_$DeleteSelectedCardsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteSelectedCardsImpl implements _DeleteSelectedCards {
  const _$DeleteSelectedCardsImpl();

  @override
  String toString() {
    return 'CardsEvent.deleteSelectedCards()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteSelectedCardsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() editCard,
    required TResult Function() deleteSelectedCards,
    required TResult Function(String front, String back) createNewCard,
  }) {
    return deleteSelectedCards();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? editCard,
    TResult? Function()? deleteSelectedCards,
    TResult? Function(String front, String back)? createNewCard,
  }) {
    return deleteSelectedCards?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? editCard,
    TResult Function()? deleteSelectedCards,
    TResult Function(String front, String back)? createNewCard,
    required TResult orElse(),
  }) {
    if (deleteSelectedCards != null) {
      return deleteSelectedCards();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditCard value) editCard,
    required TResult Function(_DeleteSelectedCards value) deleteSelectedCards,
    required TResult Function(_CreateNewCard value) createNewCard,
  }) {
    return deleteSelectedCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditCard value)? editCard,
    TResult? Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult? Function(_CreateNewCard value)? createNewCard,
  }) {
    return deleteSelectedCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditCard value)? editCard,
    TResult Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult Function(_CreateNewCard value)? createNewCard,
    required TResult orElse(),
  }) {
    if (deleteSelectedCards != null) {
      return deleteSelectedCards(this);
    }
    return orElse();
  }
}

abstract class _DeleteSelectedCards implements CardsEvent {
  const factory _DeleteSelectedCards() = _$DeleteSelectedCardsImpl;
}

/// @nodoc
abstract class _$$CreateNewCardImplCopyWith<$Res> {
  factory _$$CreateNewCardImplCopyWith(
          _$CreateNewCardImpl value, $Res Function(_$CreateNewCardImpl) then) =
      __$$CreateNewCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String front, String back});
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
    Object? front = null,
    Object? back = null,
  }) {
    return _then(_$CreateNewCardImpl(
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

class _$CreateNewCardImpl implements _CreateNewCard {
  const _$CreateNewCardImpl({required this.front, required this.back});

  @override
  final String front;
  @override
  final String back;

  @override
  String toString() {
    return 'CardsEvent.createNewCard(front: $front, back: $back)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNewCardImpl &&
            (identical(other.front, front) || other.front == front) &&
            (identical(other.back, back) || other.back == back));
  }

  @override
  int get hashCode => Object.hash(runtimeType, front, back);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNewCardImplCopyWith<_$CreateNewCardImpl> get copyWith =>
      __$$CreateNewCardImplCopyWithImpl<_$CreateNewCardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() editCard,
    required TResult Function() deleteSelectedCards,
    required TResult Function(String front, String back) createNewCard,
  }) {
    return createNewCard(front, back);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? editCard,
    TResult? Function()? deleteSelectedCards,
    TResult? Function(String front, String back)? createNewCard,
  }) {
    return createNewCard?.call(front, back);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? editCard,
    TResult Function()? deleteSelectedCards,
    TResult Function(String front, String back)? createNewCard,
    required TResult orElse(),
  }) {
    if (createNewCard != null) {
      return createNewCard(front, back);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditCard value) editCard,
    required TResult Function(_DeleteSelectedCards value) deleteSelectedCards,
    required TResult Function(_CreateNewCard value) createNewCard,
  }) {
    return createNewCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditCard value)? editCard,
    TResult? Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult? Function(_CreateNewCard value)? createNewCard,
  }) {
    return createNewCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditCard value)? editCard,
    TResult Function(_DeleteSelectedCards value)? deleteSelectedCards,
    TResult Function(_CreateNewCard value)? createNewCard,
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
      {required final String front,
      required final String back}) = _$CreateNewCardImpl;

  String get front;
  String get back;
  @JsonKey(ignore: true)
  _$$CreateNewCardImplCopyWith<_$CreateNewCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CardsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() viewIndividualCard,
    required TResult Function() viewProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? viewIndividualCard,
    TResult? Function()? viewProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? viewIndividualCard,
    TResult Function()? viewProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ViewIndividualCard value) viewIndividualCard,
    required TResult Function(_ViewProfile value) viewProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult? Function(_ViewProfile value)? viewProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult Function(_ViewProfile value)? viewProfile,
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
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'CardsState.initial()';
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
    required TResult Function() viewIndividualCard,
    required TResult Function() viewProfile,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? viewIndividualCard,
    TResult? Function()? viewProfile,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? viewIndividualCard,
    TResult Function()? viewProfile,
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
    required TResult Function(_ViewIndividualCard value) viewIndividualCard,
    required TResult Function(_ViewProfile value) viewProfile,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult? Function(_ViewProfile value)? viewProfile,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult Function(_ViewProfile value)? viewProfile,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CardsState {
  const factory _Initial() = _$InitialImpl;
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
    required TResult Function() initial,
    required TResult Function() viewIndividualCard,
    required TResult Function() viewProfile,
  }) {
    return viewIndividualCard();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? viewIndividualCard,
    TResult? Function()? viewProfile,
  }) {
    return viewIndividualCard?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? viewIndividualCard,
    TResult Function()? viewProfile,
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
    required TResult Function(_ViewProfile value) viewProfile,
  }) {
    return viewIndividualCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult? Function(_ViewProfile value)? viewProfile,
  }) {
    return viewIndividualCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult Function(_ViewProfile value)? viewProfile,
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
abstract class _$$ViewProfileImplCopyWith<$Res> {
  factory _$$ViewProfileImplCopyWith(
          _$ViewProfileImpl value, $Res Function(_$ViewProfileImpl) then) =
      __$$ViewProfileImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ViewProfileImplCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$ViewProfileImpl>
    implements _$$ViewProfileImplCopyWith<$Res> {
  __$$ViewProfileImplCopyWithImpl(
      _$ViewProfileImpl _value, $Res Function(_$ViewProfileImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ViewProfileImpl implements _ViewProfile {
  const _$ViewProfileImpl();

  @override
  String toString() {
    return 'CardsState.viewProfile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ViewProfileImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() viewIndividualCard,
    required TResult Function() viewProfile,
  }) {
    return viewProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? viewIndividualCard,
    TResult? Function()? viewProfile,
  }) {
    return viewProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? viewIndividualCard,
    TResult Function()? viewProfile,
    required TResult orElse(),
  }) {
    if (viewProfile != null) {
      return viewProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ViewIndividualCard value) viewIndividualCard,
    required TResult Function(_ViewProfile value) viewProfile,
  }) {
    return viewProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult? Function(_ViewProfile value)? viewProfile,
  }) {
    return viewProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ViewIndividualCard value)? viewIndividualCard,
    TResult Function(_ViewProfile value)? viewProfile,
    required TResult orElse(),
  }) {
    if (viewProfile != null) {
      return viewProfile(this);
    }
    return orElse();
  }
}

abstract class _ViewProfile implements CardsState {
  const factory _ViewProfile() = _$ViewProfileImpl;
}
