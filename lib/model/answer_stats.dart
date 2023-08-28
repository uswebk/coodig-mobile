import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_stats.freezed.dart';
part 'answer_stats.g.dart';

@freezed
class AnswerStats with _$AnswerStats {
  const factory AnswerStats({
    @JsonKey(name: 'quiz_count') required int answerCount,
    @JsonKey(name: 'correct_count') required int correctCount,
  }) = _AnswerStats;

  factory AnswerStats.fromJson(Map<String, dynamic> json) => _$AnswerStatsFromJson(json);
}
