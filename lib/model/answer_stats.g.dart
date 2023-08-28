// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnswerStats _$$_AnswerStatsFromJson(Map<String, dynamic> json) =>
    _$_AnswerStats(
      answerCount: json['quiz_count'] as int,
      correctCount: json['correct_count'] as int,
    );

Map<String, dynamic> _$$_AnswerStatsToJson(_$_AnswerStats instance) =>
    <String, dynamic>{
      'quiz_count': instance.answerCount,
      'correct_count': instance.correctCount,
    };
