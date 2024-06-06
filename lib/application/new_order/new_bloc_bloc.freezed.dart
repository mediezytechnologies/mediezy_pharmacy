// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewBlocEventCopyWith<$Res> {
  factory $NewBlocEventCopyWith(
          NewBlocEvent value, $Res Function(NewBlocEvent) then) =
      _$NewBlocEventCopyWithImpl<$Res, NewBlocEvent>;
}

/// @nodoc
class _$NewBlocEventCopyWithImpl<$Res, $Val extends NewBlocEvent>
    implements $NewBlocEventCopyWith<$Res> {
  _$NewBlocEventCopyWithImpl(this._value, this._then);

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
    extends _$NewBlocEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'NewBlocEvent.started()';
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
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
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
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements NewBlocEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$NewBlocState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  List<MedicineOrder> get newOrdersModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewBlocStateCopyWith<NewBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewBlocStateCopyWith<$Res> {
  factory $NewBlocStateCopyWith(
          NewBlocState value, $Res Function(NewBlocState) then) =
      _$NewBlocStateCopyWithImpl<$Res, NewBlocState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      String message,
      bool status,
      List<MedicineOrder> newOrdersModel});
}

/// @nodoc
class _$NewBlocStateCopyWithImpl<$Res, $Val extends NewBlocState>
    implements $NewBlocStateCopyWith<$Res> {
  _$NewBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? message = null,
    Object? status = null,
    Object? newOrdersModel = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      newOrdersModel: null == newOrdersModel
          ? _value.newOrdersModel
          : newOrdersModel // ignore: cast_nullable_to_non_nullable
              as List<MedicineOrder>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $NewBlocStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      String message,
      bool status,
      List<MedicineOrder> newOrdersModel});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NewBlocStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? message = null,
    Object? status = null,
    Object? newOrdersModel = null,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      newOrdersModel: null == newOrdersModel
          ? _value._newOrdersModel
          : newOrdersModel // ignore: cast_nullable_to_non_nullable
              as List<MedicineOrder>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.isError,
      required this.message,
      required this.status,
      required final List<MedicineOrder> newOrdersModel})
      : _newOrdersModel = newOrdersModel;

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final String message;
  @override
  final bool status;
  final List<MedicineOrder> _newOrdersModel;
  @override
  List<MedicineOrder> get newOrdersModel {
    if (_newOrdersModel is EqualUnmodifiableListView) return _newOrdersModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newOrdersModel);
  }

  @override
  String toString() {
    return 'NewBlocState(isLoading: $isLoading, isError: $isError, message: $message, status: $status, newOrdersModel: $newOrdersModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._newOrdersModel, _newOrdersModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError, message,
      status, const DeepCollectionEquality().hash(_newOrdersModel));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements NewBlocState {
  const factory _Initial(
      {required final bool isLoading,
      required final bool isError,
      required final String message,
      required final bool status,
      required final List<MedicineOrder> newOrdersModel}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  String get message;
  @override
  bool get status;
  @override
  List<MedicineOrder> get newOrdersModel;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
