// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$APIState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() na,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(Error error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? na,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(Error error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? na,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(Error error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(na<T> value) na,
    required TResult Function(loading<T> value) loading,
    required TResult Function(success<T> value) success,
    required TResult Function(loadingError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(na<T> value)? na,
    TResult? Function(loading<T> value)? loading,
    TResult? Function(success<T> value)? success,
    TResult? Function(loadingError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(na<T> value)? na,
    TResult Function(loading<T> value)? loading,
    TResult Function(success<T> value)? success,
    TResult Function(loadingError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APIStateCopyWith<T, $Res> {
  factory $APIStateCopyWith(
          APIState<T> value, $Res Function(APIState<T>) then) =
      _$APIStateCopyWithImpl<T, $Res, APIState<T>>;
}

/// @nodoc
class _$APIStateCopyWithImpl<T, $Res, $Val extends APIState<T>>
    implements $APIStateCopyWith<T, $Res> {
  _$APIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$naCopyWith<T, $Res> {
  factory _$$naCopyWith(_$na<T> value, $Res Function(_$na<T>) then) =
      __$$naCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$naCopyWithImpl<T, $Res>
    extends _$APIStateCopyWithImpl<T, $Res, _$na<T>>
    implements _$$naCopyWith<T, $Res> {
  __$$naCopyWithImpl(_$na<T> _value, $Res Function(_$na<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$na<T> implements na<T> {
  const _$na();

  @override
  String toString() {
    return 'APIState<$T>.na()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$na<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() na,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(Error error) error,
  }) {
    return na();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? na,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(Error error)? error,
  }) {
    return na?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? na,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(Error error)? error,
    required TResult orElse(),
  }) {
    if (na != null) {
      return na();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(na<T> value) na,
    required TResult Function(loading<T> value) loading,
    required TResult Function(success<T> value) success,
    required TResult Function(loadingError<T> value) error,
  }) {
    return na(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(na<T> value)? na,
    TResult? Function(loading<T> value)? loading,
    TResult? Function(success<T> value)? success,
    TResult? Function(loadingError<T> value)? error,
  }) {
    return na?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(na<T> value)? na,
    TResult Function(loading<T> value)? loading,
    TResult Function(success<T> value)? success,
    TResult Function(loadingError<T> value)? error,
    required TResult orElse(),
  }) {
    if (na != null) {
      return na(this);
    }
    return orElse();
  }
}

abstract class na<T> implements APIState<T> {
  const factory na() = _$na<T>;
}

/// @nodoc
abstract class _$$loadingCopyWith<T, $Res> {
  factory _$$loadingCopyWith(
          _$loading<T> value, $Res Function(_$loading<T>) then) =
      __$$loadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$loadingCopyWithImpl<T, $Res>
    extends _$APIStateCopyWithImpl<T, $Res, _$loading<T>>
    implements _$$loadingCopyWith<T, $Res> {
  __$$loadingCopyWithImpl(
      _$loading<T> _value, $Res Function(_$loading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$loading<T> implements loading<T> {
  const _$loading();

  @override
  String toString() {
    return 'APIState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() na,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(Error error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? na,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(Error error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? na,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(Error error)? error,
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
    required TResult Function(na<T> value) na,
    required TResult Function(loading<T> value) loading,
    required TResult Function(success<T> value) success,
    required TResult Function(loadingError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(na<T> value)? na,
    TResult? Function(loading<T> value)? loading,
    TResult? Function(success<T> value)? success,
    TResult? Function(loadingError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(na<T> value)? na,
    TResult Function(loading<T> value)? loading,
    TResult Function(success<T> value)? success,
    TResult Function(loadingError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class loading<T> implements APIState<T> {
  const factory loading() = _$loading<T>;
}

/// @nodoc
abstract class _$$successCopyWith<T, $Res> {
  factory _$$successCopyWith(
          _$success<T> value, $Res Function(_$success<T>) then) =
      __$$successCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$successCopyWithImpl<T, $Res>
    extends _$APIStateCopyWithImpl<T, $Res, _$success<T>>
    implements _$$successCopyWith<T, $Res> {
  __$$successCopyWithImpl(
      _$success<T> _value, $Res Function(_$success<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$success<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$success<T> implements success<T> {
  const _$success(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'APIState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$success<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$successCopyWith<T, _$success<T>> get copyWith =>
      __$$successCopyWithImpl<T, _$success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() na,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(Error error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? na,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(Error error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? na,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(Error error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(na<T> value) na,
    required TResult Function(loading<T> value) loading,
    required TResult Function(success<T> value) success,
    required TResult Function(loadingError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(na<T> value)? na,
    TResult? Function(loading<T> value)? loading,
    TResult? Function(success<T> value)? success,
    TResult? Function(loadingError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(na<T> value)? na,
    TResult Function(loading<T> value)? loading,
    TResult Function(success<T> value)? success,
    TResult Function(loadingError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class success<T> implements APIState<T> {
  const factory success(final T data) = _$success<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$successCopyWith<T, _$success<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$loadingErrorCopyWith<T, $Res> {
  factory _$$loadingErrorCopyWith(
          _$loadingError<T> value, $Res Function(_$loadingError<T>) then) =
      __$$loadingErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Error error});
}

/// @nodoc
class __$$loadingErrorCopyWithImpl<T, $Res>
    extends _$APIStateCopyWithImpl<T, $Res, _$loadingError<T>>
    implements _$$loadingErrorCopyWith<T, $Res> {
  __$$loadingErrorCopyWithImpl(
      _$loadingError<T> _value, $Res Function(_$loadingError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$loadingError<T>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error,
    ));
  }
}

/// @nodoc

class _$loadingError<T> implements loadingError<T> {
  const _$loadingError(this.error);

  @override
  final Error error;

  @override
  String toString() {
    return 'APIState<$T>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loadingError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$loadingErrorCopyWith<T, _$loadingError<T>> get copyWith =>
      __$$loadingErrorCopyWithImpl<T, _$loadingError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() na,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(Error error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? na,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(Error error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? na,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(Error error)? error,
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
    required TResult Function(na<T> value) na,
    required TResult Function(loading<T> value) loading,
    required TResult Function(success<T> value) success,
    required TResult Function(loadingError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(na<T> value)? na,
    TResult? Function(loading<T> value)? loading,
    TResult? Function(success<T> value)? success,
    TResult? Function(loadingError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(na<T> value)? na,
    TResult Function(loading<T> value)? loading,
    TResult Function(success<T> value)? success,
    TResult Function(loadingError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class loadingError<T> implements APIState<T> {
  const factory loadingError(final Error error) = _$loadingError<T>;

  Error get error;
  @JsonKey(ignore: true)
  _$$loadingErrorCopyWith<T, _$loadingError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
