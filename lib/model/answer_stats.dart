import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_stats.freezed.dart';
part 'answer_stats.g.dart';

@freezed
class AnswerStats with _$AnswerStats {
  const factory AnswerStats({
    @JsonKey(name: 'quiz_count', defaultValue: 0) @Default(0) int answerCount,
    @JsonKey(name: 'correct_count', defaultValue: 0) @Default(0) int correctCount,
    @JsonKey(name: 'today_answer_count', defaultValue: 0) @Default(0) int todayAnswerCount,
    @JsonKey(name: 'today_correct_count', defaultValue: 0) @Default(0) int todayCorrectCount,
    @JsonKey(name: 'total', defaultValue: 0) @Default(0) int total,
  }) = _AnswerStats;

  factory AnswerStats.fromJson(Map<String, dynamic> json) => _$AnswerStatsFromJson(json);
}
