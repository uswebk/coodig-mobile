// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnswerStats _$$_AnswerStatsFromJson(Map<String, dynamic> json) =>
    _$_AnswerStats(
      answerCount: json['quiz_count'] as int? ?? 0,
      correctCount: json['correct_count'] as int? ?? 0,
      todayAnswerCount: json['today_answer_count'] as int? ?? 0,
      todayCorrectCount: json['today_correct_count'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
    );

Map<String, dynamic> _$$_AnswerStatsToJson(_$_AnswerStats instance) =>
    <String, dynamic>{
      'quiz_count': instance.answerCount,
      'correct_count': instance.correctCount,
      'today_answer_count': instance.todayAnswerCount,
      'today_correct_count': instance.todayCorrectCount,
      'total': instance.total,
    };
