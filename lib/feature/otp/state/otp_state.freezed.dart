// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OtpState {
  List<TextEditingController> get controllers =>
      throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtpStateCopyWith<OtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpStateCopyWith<$Res> {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) then) =
      _$OtpStateCopyWithImpl<$Res, OtpState>;
  @useResult
  $Res call({List<TextEditingController> controllers, String otp});
}

/// @nodoc
class _$OtpStateCopyWithImpl<$Res, $Val extends OtpState>
    implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controllers = null,
    Object? otp = null,
  }) {
    return _then(_value.copyWith(
      controllers: null == controllers
          ? _value.controllers
          : controllers // ignore: cast_nullable_to_non_nullable
              as List<TextEditingController>,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OtpStateCopyWith<$Res> implements $OtpStateCopyWith<$Res> {
  factory _$$_OtpStateCopyWith(
          _$_OtpState value, $Res Function(_$_OtpState) then) =
      __$$_OtpStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TextEditingController> controllers, String otp});
}

/// @nodoc
class __$$_OtpStateCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$_OtpState>
    implements _$$_OtpStateCopyWith<$Res> {
  __$$_OtpStateCopyWithImpl(
      _$_OtpState _value, $Res Function(_$_OtpState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controllers = null,
    Object? otp = null,
  }) {
    return _then(_$_OtpState(
      controllers: null == controllers
          ? _value._controllers
          : controllers // ignore: cast_nullable_to_non_nullable
              as List<TextEditingController>,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OtpState implements _OtpState {
  const _$_OtpState(
      {required final List<TextEditingController> controllers,
      required this.otp})
      : _controllers = controllers;

  final List<TextEditingController> _controllers;
  @override
  List<TextEditingController> get controllers {
    if (_controllers is EqualUnmodifiableListView) return _controllers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_controllers);
  }

  @override
  final String otp;

  @override
  String toString() {
    return 'OtpState(controllers: $controllers, otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtpState &&
            const DeepCollectionEquality()
                .equals(other._controllers, _controllers) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_controllers), otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OtpStateCopyWith<_$_OtpState> get copyWith =>
      __$$_OtpStateCopyWithImpl<_$_OtpState>(this, _$identity);
}

abstract class _OtpState implements OtpState {
  const factory _OtpState(
      {required final List<TextEditingController> controllers,
      required final String otp}) = _$_OtpState;

  @override
  List<TextEditingController> get controllers;
  @override
  String get otp;
  @override
  @JsonKey(ignore: true)
  _$$_OtpStateCopyWith<_$_OtpState> get copyWith =>
      throw _privateConstructorUsedError;
}
