// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnswerStats _$AnswerStatsFromJson(Map<String, dynamic> json) {
  return _AnswerStats.fromJson(json);
}

/// @nodoc
mixin _$AnswerStats {
  @JsonKey(name: 'quiz_count', defaultValue: 0)
  int get answerCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_count', defaultValue: 0)
  int get correctCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'today_answer_count', defaultValue: 0)
  int get todayAnswerCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'today_correct_count', defaultValue: 0)
  int get todayCorrectCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total', defaultValue: 0)
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerStatsCopyWith<AnswerStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerStatsCopyWith<$Res> {
  factory $AnswerStatsCopyWith(
          AnswerStats value, $Res Function(AnswerStats) then) =
      _$AnswerStatsCopyWithImpl<$Res, AnswerStats>;
  @useResult
  $Res call(
      {@JsonKey(name: 'quiz_count', defaultValue: 0) int answerCount,
      @JsonKey(name: 'correct_count', defaultValue: 0) int correctCount,
      @JsonKey(name: 'today_answer_count', defaultValue: 0)
      int todayAnswerCount,
      @JsonKey(name: 'today_correct_count', defaultValue: 0)
      int todayCorrectCount,
      @JsonKey(name: 'total', defaultValue: 0) int total});
}

/// @nodoc
class _$AnswerStatsCopyWithImpl<$Res, $Val extends AnswerStats>
    implements $AnswerStatsCopyWith<$Res> {
  _$AnswerStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerCount = null,
    Object? correctCount = null,
    Object? todayAnswerCount = null,
    Object? todayCorrectCount = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      answerCount: null == answerCount
          ? _value.answerCount
          : answerCount // ignore: cast_nullable_to_non_nullable
              as int,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      todayAnswerCount: null == todayAnswerCount
          ? _value.todayAnswerCount
          : todayAnswerCount // ignore: cast_nullable_to_non_nullable
              as int,
      todayCorrectCount: null == todayCorrectCount
          ? _value.todayCorrectCount
          : todayCorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnswerStatsCopyWith<$Res>
    implements $AnswerStatsCopyWith<$Res> {
  factory _$$_AnswerStatsCopyWith(
          _$_AnswerStats value, $Res Function(_$_AnswerStats) then) =
      __$$_AnswerStatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'quiz_count', defaultValue: 0) int answerCount,
      @JsonKey(name: 'correct_count', defaultValue: 0) int correctCount,
      @JsonKey(name: 'today_answer_count', defaultValue: 0)
      int todayAnswerCount,
      @JsonKey(name: 'today_correct_count', defaultValue: 0)
      int todayCorrectCount,
      @JsonKey(name: 'total', defaultValue: 0) int total});
}

/// @nodoc
class __$$_AnswerStatsCopyWithImpl<$Res>
    extends _$AnswerStatsCopyWithImpl<$Res, _$_AnswerStats>
    implements _$$_AnswerStatsCopyWith<$Res> {
  __$$_AnswerStatsCopyWithImpl(
      _$_AnswerStats _value, $Res Function(_$_AnswerStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerCount = null,
    Object? correctCount = null,
    Object? todayAnswerCount = null,
    Object? todayCorrectCount = null,
    Object? total = null,
  }) {
    return _then(_$_AnswerStats(
      answerCount: null == answerCount
          ? _value.answerCount
          : answerCount // ignore: cast_nullable_to_non_nullable
              as int,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      todayAnswerCount: null == todayAnswerCount
          ? _value.todayAnswerCount
          : todayAnswerCount // ignore: cast_nullable_to_non_nullable
              as int,
      todayCorrectCount: null == todayCorrectCount
          ? _value.todayCorrectCount
          : todayCorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnswerStats implements _AnswerStats {
  const _$_AnswerStats(
      {@JsonKey(name: 'quiz_count', defaultValue: 0) this.answerCount = 0,
      @JsonKey(name: 'correct_count', defaultValue: 0) this.correctCount = 0,
      @JsonKey(name: 'today_answer_count', defaultValue: 0)
      this.todayAnswerCount = 0,
      @JsonKey(name: 'today_correct_count', defaultValue: 0)
      this.todayCorrectCount = 0,
      @JsonKey(name: 'total', defaultValue: 0) this.total = 0});

  factory _$_AnswerStats.fromJson(Map<String, dynamic> json) =>
      _$$_AnswerStatsFromJson(json);

  @override
  @JsonKey(name: 'quiz_count', defaultValue: 0)
  final int answerCount;
  @override
  @JsonKey(name: 'correct_count', defaultValue: 0)
  final int correctCount;
  @override
  @JsonKey(name: 'today_answer_count', defaultValue: 0)
  final int todayAnswerCount;
  @override
  @JsonKey(name: 'today_correct_count', defaultValue: 0)
  final int todayCorrectCount;
  @override
  @JsonKey(name: 'total', defaultValue: 0)
  final int total;

  @override
  String toString() {
    return 'AnswerStats(answerCount: $answerCount, correctCount: $correctCount, todayAnswerCount: $todayAnswerCount, todayCorrectCount: $todayCorrectCount, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnswerStats &&
            (identical(other.answerCount, answerCount) ||
                other.answerCount == answerCount) &&
            (identical(other.correctCount, correctCount) ||
                other.correctCount == correctCount) &&
            (identical(other.todayAnswerCount, todayAnswerCount) ||
                other.todayAnswerCount == todayAnswerCount) &&
            (identical(other.todayCorrectCount, todayCorrectCount) ||
                other.todayCorrectCount == todayCorrectCount) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, answerCount, correctCount,
      todayAnswerCount, todayCorrectCount, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerStatsCopyWith<_$_AnswerStats> get copyWith =>
      __$$_AnswerStatsCopyWithImpl<_$_AnswerStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswerStatsToJson(
      this,
    );
  }
}

abstract class _AnswerStats implements AnswerStats {
  const factory _AnswerStats(
      {@JsonKey(name: 'quiz_count', defaultValue: 0) final int answerCount,
      @JsonKey(name: 'correct_count', defaultValue: 0) final int correctCount,
      @JsonKey(name: 'today_answer_count', defaultValue: 0)
      final int todayAnswerCount,
      @JsonKey(name: 'today_correct_count', defaultValue: 0)
      final int todayCorrectCount,
      @JsonKey(name: 'total', defaultValue: 0)
      final int total}) = _$_AnswerStats;

  factory _AnswerStats.fromJson(Map<String, dynamic> json) =
      _$_AnswerStats.fromJson;

  @override
  @JsonKey(name: 'quiz_count', defaultValue: 0)
  int get answerCount;
  @override
  @JsonKey(name: 'correct_count', defaultValue: 0)
  int get correctCount;
  @override
  @JsonKey(name: 'today_answer_count', defaultValue: 0)
  int get todayAnswerCount;
  @override
  @JsonKey(name: 'today_correct_count', defaultValue: 0)
  int get todayCorrectCount;
  @override
  @JsonKey(name: 'total', defaultValue: 0)
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerStatsCopyWith<_$_AnswerStats> get copyWith =>
      throw _privateConstructorUsedError;
}
