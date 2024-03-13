// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_pdf_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CollectionPdfEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) downloadPdf,
    required TResult Function(String userUid, String collectionUid) fetchPdfs,
    required TResult Function(
            String userUid, String collectionUid, String pathToRemove)
        removePdf,
    required TResult Function(
            String userUid, String collectionUid, String pathToAdd)
        addPdf,
    required TResult Function(String userUid, String collectionUid) savePdf,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? downloadPdf,
    TResult? Function(String userUid, String collectionUid)? fetchPdfs,
    TResult? Function(
            String userUid, String collectionUid, String pathToRemove)?
        removePdf,
    TResult? Function(String userUid, String collectionUid, String pathToAdd)?
        addPdf,
    TResult? Function(String userUid, String collectionUid)? savePdf,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? downloadPdf,
    TResult Function(String userUid, String collectionUid)? fetchPdfs,
    TResult Function(String userUid, String collectionUid, String pathToRemove)?
        removePdf,
    TResult Function(String userUid, String collectionUid, String pathToAdd)?
        addPdf,
    TResult Function(String userUid, String collectionUid)? savePdf,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownloadPdfEvent value) downloadPdf,
    required TResult Function(_FetchPdfsEvent value) fetchPdfs,
    required TResult Function(_RemovePdfEvent value) removePdf,
    required TResult Function(_AddPdfEvent value) addPdf,
    required TResult Function(_SavePdfEvent value) savePdf,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownloadPdfEvent value)? downloadPdf,
    TResult? Function(_FetchPdfsEvent value)? fetchPdfs,
    TResult? Function(_RemovePdfEvent value)? removePdf,
    TResult? Function(_AddPdfEvent value)? addPdf,
    TResult? Function(_SavePdfEvent value)? savePdf,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownloadPdfEvent value)? downloadPdf,
    TResult Function(_FetchPdfsEvent value)? fetchPdfs,
    TResult Function(_RemovePdfEvent value)? removePdf,
    TResult Function(_AddPdfEvent value)? addPdf,
    TResult Function(_SavePdfEvent value)? savePdf,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionPdfEventCopyWith<$Res> {
  factory $CollectionPdfEventCopyWith(
          CollectionPdfEvent value, $Res Function(CollectionPdfEvent) then) =
      _$CollectionPdfEventCopyWithImpl<$Res, CollectionPdfEvent>;
}

/// @nodoc
class _$CollectionPdfEventCopyWithImpl<$Res, $Val extends CollectionPdfEvent>
    implements $CollectionPdfEventCopyWith<$Res> {
  _$CollectionPdfEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DownloadPdfEventImplCopyWith<$Res> {
  factory _$$DownloadPdfEventImplCopyWith(_$DownloadPdfEventImpl value,
          $Res Function(_$DownloadPdfEventImpl) then) =
      __$$DownloadPdfEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$DownloadPdfEventImplCopyWithImpl<$Res>
    extends _$CollectionPdfEventCopyWithImpl<$Res, _$DownloadPdfEventImpl>
    implements _$$DownloadPdfEventImplCopyWith<$Res> {
  __$$DownloadPdfEventImplCopyWithImpl(_$DownloadPdfEventImpl _value,
      $Res Function(_$DownloadPdfEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$DownloadPdfEventImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DownloadPdfEventImpl implements _DownloadPdfEvent {
  const _$DownloadPdfEventImpl({required this.path});

  @override
  final String path;

  @override
  String toString() {
    return 'CollectionPdfEvent.downloadPdf(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadPdfEventImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadPdfEventImplCopyWith<_$DownloadPdfEventImpl> get copyWith =>
      __$$DownloadPdfEventImplCopyWithImpl<_$DownloadPdfEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) downloadPdf,
    required TResult Function(String userUid, String collectionUid) fetchPdfs,
    required TResult Function(
            String userUid, String collectionUid, String pathToRemove)
        removePdf,
    required TResult Function(
            String userUid, String collectionUid, String pathToAdd)
        addPdf,
    required TResult Function(String userUid, String collectionUid) savePdf,
  }) {
    return downloadPdf(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? downloadPdf,
    TResult? Function(String userUid, String collectionUid)? fetchPdfs,
    TResult? Function(
            String userUid, String collectionUid, String pathToRemove)?
        removePdf,
    TResult? Function(String userUid, String collectionUid, String pathToAdd)?
        addPdf,
    TResult? Function(String userUid, String collectionUid)? savePdf,
  }) {
    return downloadPdf?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? downloadPdf,
    TResult Function(String userUid, String collectionUid)? fetchPdfs,
    TResult Function(String userUid, String collectionUid, String pathToRemove)?
        removePdf,
    TResult Function(String userUid, String collectionUid, String pathToAdd)?
        addPdf,
    TResult Function(String userUid, String collectionUid)? savePdf,
    required TResult orElse(),
  }) {
    if (downloadPdf != null) {
      return downloadPdf(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownloadPdfEvent value) downloadPdf,
    required TResult Function(_FetchPdfsEvent value) fetchPdfs,
    required TResult Function(_RemovePdfEvent value) removePdf,
    required TResult Function(_AddPdfEvent value) addPdf,
    required TResult Function(_SavePdfEvent value) savePdf,
  }) {
    return downloadPdf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownloadPdfEvent value)? downloadPdf,
    TResult? Function(_FetchPdfsEvent value)? fetchPdfs,
    TResult? Function(_RemovePdfEvent value)? removePdf,
    TResult? Function(_AddPdfEvent value)? addPdf,
    TResult? Function(_SavePdfEvent value)? savePdf,
  }) {
    return downloadPdf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownloadPdfEvent value)? downloadPdf,
    TResult Function(_FetchPdfsEvent value)? fetchPdfs,
    TResult Function(_RemovePdfEvent value)? removePdf,
    TResult Function(_AddPdfEvent value)? addPdf,
    TResult Function(_SavePdfEvent value)? savePdf,
    required TResult orElse(),
  }) {
    if (downloadPdf != null) {
      return downloadPdf(this);
    }
    return orElse();
  }
}

abstract class _DownloadPdfEvent implements CollectionPdfEvent {
  const factory _DownloadPdfEvent({required final String path}) =
      _$DownloadPdfEventImpl;

  String get path;
  @JsonKey(ignore: true)
  _$$DownloadPdfEventImplCopyWith<_$DownloadPdfEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchPdfsEventImplCopyWith<$Res> {
  factory _$$FetchPdfsEventImplCopyWith(_$FetchPdfsEventImpl value,
          $Res Function(_$FetchPdfsEventImpl) then) =
      __$$FetchPdfsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userUid, String collectionUid});
}

/// @nodoc
class __$$FetchPdfsEventImplCopyWithImpl<$Res>
    extends _$CollectionPdfEventCopyWithImpl<$Res, _$FetchPdfsEventImpl>
    implements _$$FetchPdfsEventImplCopyWith<$Res> {
  __$$FetchPdfsEventImplCopyWithImpl(
      _$FetchPdfsEventImpl _value, $Res Function(_$FetchPdfsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? collectionUid = null,
  }) {
    return _then(_$FetchPdfsEventImpl(
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      collectionUid: null == collectionUid
          ? _value.collectionUid
          : collectionUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchPdfsEventImpl implements _FetchPdfsEvent {
  const _$FetchPdfsEventImpl(
      {required this.userUid, required this.collectionUid});

  @override
  final String userUid;
  @override
  final String collectionUid;

  @override
  String toString() {
    return 'CollectionPdfEvent.fetchPdfs(userUid: $userUid, collectionUid: $collectionUid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchPdfsEventImpl &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.collectionUid, collectionUid) ||
                other.collectionUid == collectionUid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUid, collectionUid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchPdfsEventImplCopyWith<_$FetchPdfsEventImpl> get copyWith =>
      __$$FetchPdfsEventImplCopyWithImpl<_$FetchPdfsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) downloadPdf,
    required TResult Function(String userUid, String collectionUid) fetchPdfs,
    required TResult Function(
            String userUid, String collectionUid, String pathToRemove)
        removePdf,
    required TResult Function(
            String userUid, String collectionUid, String pathToAdd)
        addPdf,
    required TResult Function(String userUid, String collectionUid) savePdf,
  }) {
    return fetchPdfs(userUid, collectionUid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? downloadPdf,
    TResult? Function(String userUid, String collectionUid)? fetchPdfs,
    TResult? Function(
            String userUid, String collectionUid, String pathToRemove)?
        removePdf,
    TResult? Function(String userUid, String collectionUid, String pathToAdd)?
        addPdf,
    TResult? Function(String userUid, String collectionUid)? savePdf,
  }) {
    return fetchPdfs?.call(userUid, collectionUid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? downloadPdf,
    TResult Function(String userUid, String collectionUid)? fetchPdfs,
    TResult Function(String userUid, String collectionUid, String pathToRemove)?
        removePdf,
    TResult Function(String userUid, String collectionUid, String pathToAdd)?
        addPdf,
    TResult Function(String userUid, String collectionUid)? savePdf,
    required TResult orElse(),
  }) {
    if (fetchPdfs != null) {
      return fetchPdfs(userUid, collectionUid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownloadPdfEvent value) downloadPdf,
    required TResult Function(_FetchPdfsEvent value) fetchPdfs,
    required TResult Function(_RemovePdfEvent value) removePdf,
    required TResult Function(_AddPdfEvent value) addPdf,
    required TResult Function(_SavePdfEvent value) savePdf,
  }) {
    return fetchPdfs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownloadPdfEvent value)? downloadPdf,
    TResult? Function(_FetchPdfsEvent value)? fetchPdfs,
    TResult? Function(_RemovePdfEvent value)? removePdf,
    TResult? Function(_AddPdfEvent value)? addPdf,
    TResult? Function(_SavePdfEvent value)? savePdf,
  }) {
    return fetchPdfs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownloadPdfEvent value)? downloadPdf,
    TResult Function(_FetchPdfsEvent value)? fetchPdfs,
    TResult Function(_RemovePdfEvent value)? removePdf,
    TResult Function(_AddPdfEvent value)? addPdf,
    TResult Function(_SavePdfEvent value)? savePdf,
    required TResult orElse(),
  }) {
    if (fetchPdfs != null) {
      return fetchPdfs(this);
    }
    return orElse();
  }
}

abstract class _FetchPdfsEvent implements CollectionPdfEvent {
  const factory _FetchPdfsEvent(
      {required final String userUid,
      required final String collectionUid}) = _$FetchPdfsEventImpl;

  String get userUid;
  String get collectionUid;
  @JsonKey(ignore: true)
  _$$FetchPdfsEventImplCopyWith<_$FetchPdfsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemovePdfEventImplCopyWith<$Res> {
  factory _$$RemovePdfEventImplCopyWith(_$RemovePdfEventImpl value,
          $Res Function(_$RemovePdfEventImpl) then) =
      __$$RemovePdfEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userUid, String collectionUid, String pathToRemove});
}

/// @nodoc
class __$$RemovePdfEventImplCopyWithImpl<$Res>
    extends _$CollectionPdfEventCopyWithImpl<$Res, _$RemovePdfEventImpl>
    implements _$$RemovePdfEventImplCopyWith<$Res> {
  __$$RemovePdfEventImplCopyWithImpl(
      _$RemovePdfEventImpl _value, $Res Function(_$RemovePdfEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? collectionUid = null,
    Object? pathToRemove = null,
  }) {
    return _then(_$RemovePdfEventImpl(
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      collectionUid: null == collectionUid
          ? _value.collectionUid
          : collectionUid // ignore: cast_nullable_to_non_nullable
              as String,
      pathToRemove: null == pathToRemove
          ? _value.pathToRemove
          : pathToRemove // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemovePdfEventImpl implements _RemovePdfEvent {
  const _$RemovePdfEventImpl(
      {required this.userUid,
      required this.collectionUid,
      required this.pathToRemove});

  @override
  final String userUid;
  @override
  final String collectionUid;
  @override
  final String pathToRemove;

  @override
  String toString() {
    return 'CollectionPdfEvent.removePdf(userUid: $userUid, collectionUid: $collectionUid, pathToRemove: $pathToRemove)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemovePdfEventImpl &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.collectionUid, collectionUid) ||
                other.collectionUid == collectionUid) &&
            (identical(other.pathToRemove, pathToRemove) ||
                other.pathToRemove == pathToRemove));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userUid, collectionUid, pathToRemove);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemovePdfEventImplCopyWith<_$RemovePdfEventImpl> get copyWith =>
      __$$RemovePdfEventImplCopyWithImpl<_$RemovePdfEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) downloadPdf,
    required TResult Function(String userUid, String collectionUid) fetchPdfs,
    required TResult Function(
            String userUid, String collectionUid, String pathToRemove)
        removePdf,
    required TResult Function(
            String userUid, String collectionUid, String pathToAdd)
        addPdf,
    required TResult Function(String userUid, String collectionUid) savePdf,
  }) {
    return removePdf(userUid, collectionUid, pathToRemove);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? downloadPdf,
    TResult? Function(String userUid, String collectionUid)? fetchPdfs,
    TResult? Function(
            String userUid, String collectionUid, String pathToRemove)?
        removePdf,
    TResult? Function(String userUid, String collectionUid, String pathToAdd)?
        addPdf,
    TResult? Function(String userUid, String collectionUid)? savePdf,
  }) {
    return removePdf?.call(userUid, collectionUid, pathToRemove);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? downloadPdf,
    TResult Function(String userUid, String collectionUid)? fetchPdfs,
    TResult Function(String userUid, String collectionUid, String pathToRemove)?
        removePdf,
    TResult Function(String userUid, String collectionUid, String pathToAdd)?
        addPdf,
    TResult Function(String userUid, String collectionUid)? savePdf,
    required TResult orElse(),
  }) {
    if (removePdf != null) {
      return removePdf(userUid, collectionUid, pathToRemove);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownloadPdfEvent value) downloadPdf,
    required TResult Function(_FetchPdfsEvent value) fetchPdfs,
    required TResult Function(_RemovePdfEvent value) removePdf,
    required TResult Function(_AddPdfEvent value) addPdf,
    required TResult Function(_SavePdfEvent value) savePdf,
  }) {
    return removePdf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownloadPdfEvent value)? downloadPdf,
    TResult? Function(_FetchPdfsEvent value)? fetchPdfs,
    TResult? Function(_RemovePdfEvent value)? removePdf,
    TResult? Function(_AddPdfEvent value)? addPdf,
    TResult? Function(_SavePdfEvent value)? savePdf,
  }) {
    return removePdf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownloadPdfEvent value)? downloadPdf,
    TResult Function(_FetchPdfsEvent value)? fetchPdfs,
    TResult Function(_RemovePdfEvent value)? removePdf,
    TResult Function(_AddPdfEvent value)? addPdf,
    TResult Function(_SavePdfEvent value)? savePdf,
    required TResult orElse(),
  }) {
    if (removePdf != null) {
      return removePdf(this);
    }
    return orElse();
  }
}

abstract class _RemovePdfEvent implements CollectionPdfEvent {
  const factory _RemovePdfEvent(
      {required final String userUid,
      required final String collectionUid,
      required final String pathToRemove}) = _$RemovePdfEventImpl;

  String get userUid;
  String get collectionUid;
  String get pathToRemove;
  @JsonKey(ignore: true)
  _$$RemovePdfEventImplCopyWith<_$RemovePdfEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPdfEventImplCopyWith<$Res> {
  factory _$$AddPdfEventImplCopyWith(
          _$AddPdfEventImpl value, $Res Function(_$AddPdfEventImpl) then) =
      __$$AddPdfEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userUid, String collectionUid, String pathToAdd});
}

/// @nodoc
class __$$AddPdfEventImplCopyWithImpl<$Res>
    extends _$CollectionPdfEventCopyWithImpl<$Res, _$AddPdfEventImpl>
    implements _$$AddPdfEventImplCopyWith<$Res> {
  __$$AddPdfEventImplCopyWithImpl(
      _$AddPdfEventImpl _value, $Res Function(_$AddPdfEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? collectionUid = null,
    Object? pathToAdd = null,
  }) {
    return _then(_$AddPdfEventImpl(
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      collectionUid: null == collectionUid
          ? _value.collectionUid
          : collectionUid // ignore: cast_nullable_to_non_nullable
              as String,
      pathToAdd: null == pathToAdd
          ? _value.pathToAdd
          : pathToAdd // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddPdfEventImpl implements _AddPdfEvent {
  const _$AddPdfEventImpl(
      {required this.userUid,
      required this.collectionUid,
      required this.pathToAdd});

  @override
  final String userUid;
  @override
  final String collectionUid;
  @override
  final String pathToAdd;

  @override
  String toString() {
    return 'CollectionPdfEvent.addPdf(userUid: $userUid, collectionUid: $collectionUid, pathToAdd: $pathToAdd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPdfEventImpl &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.collectionUid, collectionUid) ||
                other.collectionUid == collectionUid) &&
            (identical(other.pathToAdd, pathToAdd) ||
                other.pathToAdd == pathToAdd));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userUid, collectionUid, pathToAdd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPdfEventImplCopyWith<_$AddPdfEventImpl> get copyWith =>
      __$$AddPdfEventImplCopyWithImpl<_$AddPdfEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) downloadPdf,
    required TResult Function(String userUid, String collectionUid) fetchPdfs,
    required TResult Function(
            String userUid, String collectionUid, String pathToRemove)
        removePdf,
    required TResult Function(
            String userUid, String collectionUid, String pathToAdd)
        addPdf,
    required TResult Function(String userUid, String collectionUid) savePdf,
  }) {
    return addPdf(userUid, collectionUid, pathToAdd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? downloadPdf,
    TResult? Function(String userUid, String collectionUid)? fetchPdfs,
    TResult? Function(
            String userUid, String collectionUid, String pathToRemove)?
        removePdf,
    TResult? Function(String userUid, String collectionUid, String pathToAdd)?
        addPdf,
    TResult? Function(String userUid, String collectionUid)? savePdf,
  }) {
    return addPdf?.call(userUid, collectionUid, pathToAdd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? downloadPdf,
    TResult Function(String userUid, String collectionUid)? fetchPdfs,
    TResult Function(String userUid, String collectionUid, String pathToRemove)?
        removePdf,
    TResult Function(String userUid, String collectionUid, String pathToAdd)?
        addPdf,
    TResult Function(String userUid, String collectionUid)? savePdf,
    required TResult orElse(),
  }) {
    if (addPdf != null) {
      return addPdf(userUid, collectionUid, pathToAdd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownloadPdfEvent value) downloadPdf,
    required TResult Function(_FetchPdfsEvent value) fetchPdfs,
    required TResult Function(_RemovePdfEvent value) removePdf,
    required TResult Function(_AddPdfEvent value) addPdf,
    required TResult Function(_SavePdfEvent value) savePdf,
  }) {
    return addPdf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownloadPdfEvent value)? downloadPdf,
    TResult? Function(_FetchPdfsEvent value)? fetchPdfs,
    TResult? Function(_RemovePdfEvent value)? removePdf,
    TResult? Function(_AddPdfEvent value)? addPdf,
    TResult? Function(_SavePdfEvent value)? savePdf,
  }) {
    return addPdf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownloadPdfEvent value)? downloadPdf,
    TResult Function(_FetchPdfsEvent value)? fetchPdfs,
    TResult Function(_RemovePdfEvent value)? removePdf,
    TResult Function(_AddPdfEvent value)? addPdf,
    TResult Function(_SavePdfEvent value)? savePdf,
    required TResult orElse(),
  }) {
    if (addPdf != null) {
      return addPdf(this);
    }
    return orElse();
  }
}

abstract class _AddPdfEvent implements CollectionPdfEvent {
  const factory _AddPdfEvent(
      {required final String userUid,
      required final String collectionUid,
      required final String pathToAdd}) = _$AddPdfEventImpl;

  String get userUid;
  String get collectionUid;
  String get pathToAdd;
  @JsonKey(ignore: true)
  _$$AddPdfEventImplCopyWith<_$AddPdfEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SavePdfEventImplCopyWith<$Res> {
  factory _$$SavePdfEventImplCopyWith(
          _$SavePdfEventImpl value, $Res Function(_$SavePdfEventImpl) then) =
      __$$SavePdfEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userUid, String collectionUid});
}

/// @nodoc
class __$$SavePdfEventImplCopyWithImpl<$Res>
    extends _$CollectionPdfEventCopyWithImpl<$Res, _$SavePdfEventImpl>
    implements _$$SavePdfEventImplCopyWith<$Res> {
  __$$SavePdfEventImplCopyWithImpl(
      _$SavePdfEventImpl _value, $Res Function(_$SavePdfEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? collectionUid = null,
  }) {
    return _then(_$SavePdfEventImpl(
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      collectionUid: null == collectionUid
          ? _value.collectionUid
          : collectionUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SavePdfEventImpl implements _SavePdfEvent {
  const _$SavePdfEventImpl(
      {required this.userUid, required this.collectionUid});

  @override
  final String userUid;
  @override
  final String collectionUid;

  @override
  String toString() {
    return 'CollectionPdfEvent.savePdf(userUid: $userUid, collectionUid: $collectionUid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavePdfEventImpl &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.collectionUid, collectionUid) ||
                other.collectionUid == collectionUid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUid, collectionUid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavePdfEventImplCopyWith<_$SavePdfEventImpl> get copyWith =>
      __$$SavePdfEventImplCopyWithImpl<_$SavePdfEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) downloadPdf,
    required TResult Function(String userUid, String collectionUid) fetchPdfs,
    required TResult Function(
            String userUid, String collectionUid, String pathToRemove)
        removePdf,
    required TResult Function(
            String userUid, String collectionUid, String pathToAdd)
        addPdf,
    required TResult Function(String userUid, String collectionUid) savePdf,
  }) {
    return savePdf(userUid, collectionUid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? downloadPdf,
    TResult? Function(String userUid, String collectionUid)? fetchPdfs,
    TResult? Function(
            String userUid, String collectionUid, String pathToRemove)?
        removePdf,
    TResult? Function(String userUid, String collectionUid, String pathToAdd)?
        addPdf,
    TResult? Function(String userUid, String collectionUid)? savePdf,
  }) {
    return savePdf?.call(userUid, collectionUid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? downloadPdf,
    TResult Function(String userUid, String collectionUid)? fetchPdfs,
    TResult Function(String userUid, String collectionUid, String pathToRemove)?
        removePdf,
    TResult Function(String userUid, String collectionUid, String pathToAdd)?
        addPdf,
    TResult Function(String userUid, String collectionUid)? savePdf,
    required TResult orElse(),
  }) {
    if (savePdf != null) {
      return savePdf(userUid, collectionUid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DownloadPdfEvent value) downloadPdf,
    required TResult Function(_FetchPdfsEvent value) fetchPdfs,
    required TResult Function(_RemovePdfEvent value) removePdf,
    required TResult Function(_AddPdfEvent value) addPdf,
    required TResult Function(_SavePdfEvent value) savePdf,
  }) {
    return savePdf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DownloadPdfEvent value)? downloadPdf,
    TResult? Function(_FetchPdfsEvent value)? fetchPdfs,
    TResult? Function(_RemovePdfEvent value)? removePdf,
    TResult? Function(_AddPdfEvent value)? addPdf,
    TResult? Function(_SavePdfEvent value)? savePdf,
  }) {
    return savePdf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DownloadPdfEvent value)? downloadPdf,
    TResult Function(_FetchPdfsEvent value)? fetchPdfs,
    TResult Function(_RemovePdfEvent value)? removePdf,
    TResult Function(_AddPdfEvent value)? addPdf,
    TResult Function(_SavePdfEvent value)? savePdf,
    required TResult orElse(),
  }) {
    if (savePdf != null) {
      return savePdf(this);
    }
    return orElse();
  }
}

abstract class _SavePdfEvent implements CollectionPdfEvent {
  const factory _SavePdfEvent(
      {required final String userUid,
      required final String collectionUid}) = _$SavePdfEventImpl;

  String get userUid;
  String get collectionUid;
  @JsonKey(ignore: true)
  _$$SavePdfEventImplCopyWith<_$SavePdfEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CollectionPdfState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)
        loaded,
    required TResult Function(List<EditCollectionPdfEntity> pdfs) editing,
    required TResult Function(List<CollectionPdfEntity> pdfs) saved,
    required TResult Function(LocalizedException message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)?
        loaded,
    TResult? Function(List<EditCollectionPdfEntity> pdfs)? editing,
    TResult? Function(List<CollectionPdfEntity> pdfs)? saved,
    TResult? Function(LocalizedException message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)?
        loaded,
    TResult Function(List<EditCollectionPdfEntity> pdfs)? editing,
    TResult Function(List<CollectionPdfEntity> pdfs)? saved,
    TResult Function(LocalizedException message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadedState value) loaded,
    required TResult Function(_EditingState value) editing,
    required TResult Function(_SavedState value) saved,
    required TResult Function(_ErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadedState value)? loaded,
    TResult? Function(_EditingState value)? editing,
    TResult? Function(_SavedState value)? saved,
    TResult? Function(_ErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadedState value)? loaded,
    TResult Function(_EditingState value)? editing,
    TResult Function(_SavedState value)? saved,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionPdfStateCopyWith<$Res> {
  factory $CollectionPdfStateCopyWith(
          CollectionPdfState value, $Res Function(CollectionPdfState) then) =
      _$CollectionPdfStateCopyWithImpl<$Res, CollectionPdfState>;
}

/// @nodoc
class _$CollectionPdfStateCopyWithImpl<$Res, $Val extends CollectionPdfState>
    implements $CollectionPdfStateCopyWith<$Res> {
  _$CollectionPdfStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialStateImplCopyWith<$Res> {
  factory _$$InitialStateImplCopyWith(
          _$InitialStateImpl value, $Res Function(_$InitialStateImpl) then) =
      __$$InitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStateImplCopyWithImpl<$Res>
    extends _$CollectionPdfStateCopyWithImpl<$Res, _$InitialStateImpl>
    implements _$$InitialStateImplCopyWith<$Res> {
  __$$InitialStateImplCopyWithImpl(
      _$InitialStateImpl _value, $Res Function(_$InitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialStateImpl extends _InitialState {
  const _$InitialStateImpl() : super._();

  @override
  String toString() {
    return 'CollectionPdfState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)
        loaded,
    required TResult Function(List<EditCollectionPdfEntity> pdfs) editing,
    required TResult Function(List<CollectionPdfEntity> pdfs) saved,
    required TResult Function(LocalizedException message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)?
        loaded,
    TResult? Function(List<EditCollectionPdfEntity> pdfs)? editing,
    TResult? Function(List<CollectionPdfEntity> pdfs)? saved,
    TResult? Function(LocalizedException message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)?
        loaded,
    TResult Function(List<EditCollectionPdfEntity> pdfs)? editing,
    TResult Function(List<CollectionPdfEntity> pdfs)? saved,
    TResult Function(LocalizedException message)? error,
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
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadedState value) loaded,
    required TResult Function(_EditingState value) editing,
    required TResult Function(_SavedState value) saved,
    required TResult Function(_ErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadedState value)? loaded,
    TResult? Function(_EditingState value)? editing,
    TResult? Function(_SavedState value)? saved,
    TResult? Function(_ErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadedState value)? loaded,
    TResult Function(_EditingState value)? editing,
    TResult Function(_SavedState value)? saved,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialState extends CollectionPdfState {
  const factory _InitialState() = _$InitialStateImpl;
  const _InitialState._() : super._();
}

/// @nodoc
abstract class _$$LoadedStateImplCopyWith<$Res> {
  factory _$$LoadedStateImplCopyWith(
          _$LoadedStateImpl value, $Res Function(_$LoadedStateImpl) then) =
      __$$LoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<CollectionPdfEntity> pdfs,
      List<String> pathsDownloading,
      List<String> pathsDownloaded});
}

/// @nodoc
class __$$LoadedStateImplCopyWithImpl<$Res>
    extends _$CollectionPdfStateCopyWithImpl<$Res, _$LoadedStateImpl>
    implements _$$LoadedStateImplCopyWith<$Res> {
  __$$LoadedStateImplCopyWithImpl(
      _$LoadedStateImpl _value, $Res Function(_$LoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdfs = null,
    Object? pathsDownloading = null,
    Object? pathsDownloaded = null,
  }) {
    return _then(_$LoadedStateImpl(
      pdfs: null == pdfs
          ? _value._pdfs
          : pdfs // ignore: cast_nullable_to_non_nullable
              as List<CollectionPdfEntity>,
      pathsDownloading: null == pathsDownloading
          ? _value._pathsDownloading
          : pathsDownloading // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pathsDownloaded: null == pathsDownloaded
          ? _value._pathsDownloaded
          : pathsDownloaded // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$LoadedStateImpl extends _LoadedState {
  const _$LoadedStateImpl(
      {required final List<CollectionPdfEntity> pdfs,
      required final List<String> pathsDownloading,
      required final List<String> pathsDownloaded})
      : _pdfs = pdfs,
        _pathsDownloading = pathsDownloading,
        _pathsDownloaded = pathsDownloaded,
        super._();

  final List<CollectionPdfEntity> _pdfs;
  @override
  List<CollectionPdfEntity> get pdfs {
    if (_pdfs is EqualUnmodifiableListView) return _pdfs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pdfs);
  }

  final List<String> _pathsDownloading;
  @override
  List<String> get pathsDownloading {
    if (_pathsDownloading is EqualUnmodifiableListView)
      return _pathsDownloading;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pathsDownloading);
  }

  final List<String> _pathsDownloaded;
  @override
  List<String> get pathsDownloaded {
    if (_pathsDownloaded is EqualUnmodifiableListView) return _pathsDownloaded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pathsDownloaded);
  }

  @override
  String toString() {
    return 'CollectionPdfState.loaded(pdfs: $pdfs, pathsDownloading: $pathsDownloading, pathsDownloaded: $pathsDownloaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedStateImpl &&
            const DeepCollectionEquality().equals(other._pdfs, _pdfs) &&
            const DeepCollectionEquality()
                .equals(other._pathsDownloading, _pathsDownloading) &&
            const DeepCollectionEquality()
                .equals(other._pathsDownloaded, _pathsDownloaded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pdfs),
      const DeepCollectionEquality().hash(_pathsDownloading),
      const DeepCollectionEquality().hash(_pathsDownloaded));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedStateImplCopyWith<_$LoadedStateImpl> get copyWith =>
      __$$LoadedStateImplCopyWithImpl<_$LoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)
        loaded,
    required TResult Function(List<EditCollectionPdfEntity> pdfs) editing,
    required TResult Function(List<CollectionPdfEntity> pdfs) saved,
    required TResult Function(LocalizedException message) error,
  }) {
    return loaded(pdfs, pathsDownloading, pathsDownloaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)?
        loaded,
    TResult? Function(List<EditCollectionPdfEntity> pdfs)? editing,
    TResult? Function(List<CollectionPdfEntity> pdfs)? saved,
    TResult? Function(LocalizedException message)? error,
  }) {
    return loaded?.call(pdfs, pathsDownloading, pathsDownloaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)?
        loaded,
    TResult Function(List<EditCollectionPdfEntity> pdfs)? editing,
    TResult Function(List<CollectionPdfEntity> pdfs)? saved,
    TResult Function(LocalizedException message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(pdfs, pathsDownloading, pathsDownloaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadedState value) loaded,
    required TResult Function(_EditingState value) editing,
    required TResult Function(_SavedState value) saved,
    required TResult Function(_ErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadedState value)? loaded,
    TResult? Function(_EditingState value)? editing,
    TResult? Function(_SavedState value)? saved,
    TResult? Function(_ErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadedState value)? loaded,
    TResult Function(_EditingState value)? editing,
    TResult Function(_SavedState value)? saved,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LoadedState extends CollectionPdfState {
  const factory _LoadedState(
      {required final List<CollectionPdfEntity> pdfs,
      required final List<String> pathsDownloading,
      required final List<String> pathsDownloaded}) = _$LoadedStateImpl;
  const _LoadedState._() : super._();

  List<CollectionPdfEntity> get pdfs;
  List<String> get pathsDownloading;
  List<String> get pathsDownloaded;
  @JsonKey(ignore: true)
  _$$LoadedStateImplCopyWith<_$LoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditingStateImplCopyWith<$Res> {
  factory _$$EditingStateImplCopyWith(
          _$EditingStateImpl value, $Res Function(_$EditingStateImpl) then) =
      __$$EditingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<EditCollectionPdfEntity> pdfs});
}

/// @nodoc
class __$$EditingStateImplCopyWithImpl<$Res>
    extends _$CollectionPdfStateCopyWithImpl<$Res, _$EditingStateImpl>
    implements _$$EditingStateImplCopyWith<$Res> {
  __$$EditingStateImplCopyWithImpl(
      _$EditingStateImpl _value, $Res Function(_$EditingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdfs = null,
  }) {
    return _then(_$EditingStateImpl(
      pdfs: null == pdfs
          ? _value._pdfs
          : pdfs // ignore: cast_nullable_to_non_nullable
              as List<EditCollectionPdfEntity>,
    ));
  }
}

/// @nodoc

class _$EditingStateImpl extends _EditingState {
  const _$EditingStateImpl({required final List<EditCollectionPdfEntity> pdfs})
      : _pdfs = pdfs,
        super._();

  final List<EditCollectionPdfEntity> _pdfs;
  @override
  List<EditCollectionPdfEntity> get pdfs {
    if (_pdfs is EqualUnmodifiableListView) return _pdfs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pdfs);
  }

  @override
  String toString() {
    return 'CollectionPdfState.editing(pdfs: $pdfs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditingStateImpl &&
            const DeepCollectionEquality().equals(other._pdfs, _pdfs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_pdfs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditingStateImplCopyWith<_$EditingStateImpl> get copyWith =>
      __$$EditingStateImplCopyWithImpl<_$EditingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)
        loaded,
    required TResult Function(List<EditCollectionPdfEntity> pdfs) editing,
    required TResult Function(List<CollectionPdfEntity> pdfs) saved,
    required TResult Function(LocalizedException message) error,
  }) {
    return editing(pdfs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)?
        loaded,
    TResult? Function(List<EditCollectionPdfEntity> pdfs)? editing,
    TResult? Function(List<CollectionPdfEntity> pdfs)? saved,
    TResult? Function(LocalizedException message)? error,
  }) {
    return editing?.call(pdfs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)?
        loaded,
    TResult Function(List<EditCollectionPdfEntity> pdfs)? editing,
    TResult Function(List<CollectionPdfEntity> pdfs)? saved,
    TResult Function(LocalizedException message)? error,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(pdfs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadedState value) loaded,
    required TResult Function(_EditingState value) editing,
    required TResult Function(_SavedState value) saved,
    required TResult Function(_ErrorState value) error,
  }) {
    return editing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadedState value)? loaded,
    TResult? Function(_EditingState value)? editing,
    TResult? Function(_SavedState value)? saved,
    TResult? Function(_ErrorState value)? error,
  }) {
    return editing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadedState value)? loaded,
    TResult Function(_EditingState value)? editing,
    TResult Function(_SavedState value)? saved,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(this);
    }
    return orElse();
  }
}

abstract class _EditingState extends CollectionPdfState {
  const factory _EditingState(
      {required final List<EditCollectionPdfEntity> pdfs}) = _$EditingStateImpl;
  const _EditingState._() : super._();

  List<EditCollectionPdfEntity> get pdfs;
  @JsonKey(ignore: true)
  _$$EditingStateImplCopyWith<_$EditingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SavedStateImplCopyWith<$Res> {
  factory _$$SavedStateImplCopyWith(
          _$SavedStateImpl value, $Res Function(_$SavedStateImpl) then) =
      __$$SavedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CollectionPdfEntity> pdfs});
}

/// @nodoc
class __$$SavedStateImplCopyWithImpl<$Res>
    extends _$CollectionPdfStateCopyWithImpl<$Res, _$SavedStateImpl>
    implements _$$SavedStateImplCopyWith<$Res> {
  __$$SavedStateImplCopyWithImpl(
      _$SavedStateImpl _value, $Res Function(_$SavedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdfs = null,
  }) {
    return _then(_$SavedStateImpl(
      pdfs: null == pdfs
          ? _value._pdfs
          : pdfs // ignore: cast_nullable_to_non_nullable
              as List<CollectionPdfEntity>,
    ));
  }
}

/// @nodoc

class _$SavedStateImpl extends _SavedState {
  const _$SavedStateImpl({required final List<CollectionPdfEntity> pdfs})
      : _pdfs = pdfs,
        super._();

  final List<CollectionPdfEntity> _pdfs;
  @override
  List<CollectionPdfEntity> get pdfs {
    if (_pdfs is EqualUnmodifiableListView) return _pdfs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pdfs);
  }

  @override
  String toString() {
    return 'CollectionPdfState.saved(pdfs: $pdfs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedStateImpl &&
            const DeepCollectionEquality().equals(other._pdfs, _pdfs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_pdfs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedStateImplCopyWith<_$SavedStateImpl> get copyWith =>
      __$$SavedStateImplCopyWithImpl<_$SavedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)
        loaded,
    required TResult Function(List<EditCollectionPdfEntity> pdfs) editing,
    required TResult Function(List<CollectionPdfEntity> pdfs) saved,
    required TResult Function(LocalizedException message) error,
  }) {
    return saved(pdfs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)?
        loaded,
    TResult? Function(List<EditCollectionPdfEntity> pdfs)? editing,
    TResult? Function(List<CollectionPdfEntity> pdfs)? saved,
    TResult? Function(LocalizedException message)? error,
  }) {
    return saved?.call(pdfs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)?
        loaded,
    TResult Function(List<EditCollectionPdfEntity> pdfs)? editing,
    TResult Function(List<CollectionPdfEntity> pdfs)? saved,
    TResult Function(LocalizedException message)? error,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(pdfs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadedState value) loaded,
    required TResult Function(_EditingState value) editing,
    required TResult Function(_SavedState value) saved,
    required TResult Function(_ErrorState value) error,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadedState value)? loaded,
    TResult? Function(_EditingState value)? editing,
    TResult? Function(_SavedState value)? saved,
    TResult? Function(_ErrorState value)? error,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadedState value)? loaded,
    TResult Function(_EditingState value)? editing,
    TResult Function(_SavedState value)? saved,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _SavedState extends CollectionPdfState {
  const factory _SavedState({required final List<CollectionPdfEntity> pdfs}) =
      _$SavedStateImpl;
  const _SavedState._() : super._();

  List<CollectionPdfEntity> get pdfs;
  @JsonKey(ignore: true)
  _$$SavedStateImplCopyWith<_$SavedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorStateImplCopyWith<$Res> {
  factory _$$ErrorStateImplCopyWith(
          _$ErrorStateImpl value, $Res Function(_$ErrorStateImpl) then) =
      __$$ErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LocalizedException message});
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<$Res>
    extends _$CollectionPdfStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as LocalizedException,
    ));
  }
}

/// @nodoc

class _$ErrorStateImpl extends _ErrorState {
  const _$ErrorStateImpl({required this.message}) : super._();

  @override
  final LocalizedException message;

  @override
  String toString() {
    return 'CollectionPdfState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      __$$ErrorStateImplCopyWithImpl<_$ErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)
        loaded,
    required TResult Function(List<EditCollectionPdfEntity> pdfs) editing,
    required TResult Function(List<CollectionPdfEntity> pdfs) saved,
    required TResult Function(LocalizedException message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)?
        loaded,
    TResult? Function(List<EditCollectionPdfEntity> pdfs)? editing,
    TResult? Function(List<CollectionPdfEntity> pdfs)? saved,
    TResult? Function(LocalizedException message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CollectionPdfEntity> pdfs,
            List<String> pathsDownloading, List<String> pathsDownloaded)?
        loaded,
    TResult Function(List<EditCollectionPdfEntity> pdfs)? editing,
    TResult Function(List<CollectionPdfEntity> pdfs)? saved,
    TResult Function(LocalizedException message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadedState value) loaded,
    required TResult Function(_EditingState value) editing,
    required TResult Function(_SavedState value) saved,
    required TResult Function(_ErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_LoadedState value)? loaded,
    TResult? Function(_EditingState value)? editing,
    TResult? Function(_SavedState value)? saved,
    TResult? Function(_ErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadedState value)? loaded,
    TResult Function(_EditingState value)? editing,
    TResult Function(_SavedState value)? saved,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState extends CollectionPdfState {
  const factory _ErrorState({required final LocalizedException message}) =
      _$ErrorStateImpl;
  const _ErrorState._() : super._();

  LocalizedException get message;
  @JsonKey(ignore: true)
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
