// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quiz _$$_QuizFromJson(Map<String, dynamic> json) => _$_Quiz(
      id: json['id'] as int,
      choices: (json['choices'] as List<dynamic>)
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      question: json['question'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdBy: User.fromJson(json['created_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_QuizToJson(_$_Quiz instance) => <String, dynamic>{
      'id': instance.id,
      'choices': instance.choices,
      'tags': instance.tags,
      'question': instance.question,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_by': instance.createdBy,
    };

_$_Choice _$$_ChoiceFromJson(Map<String, dynamic> json) => _$_Choice(
      id: json['id'] as int,
      sentence: json['sentence'] as String,
      isAnswer: json['is_answer'] as bool,
      sort: json['sort'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_ChoiceToJson(_$_Choice instance) => <String, dynamic>{
      'id': instance.id,
      'sentence': instance.sentence,
      'is_answer': instance.isAnswer,
      'sort': instance.sort,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$_Tag _$$_TagFromJson(Map<String, dynamic> json) => _$_Tag(
      id: json['id'] as int,
      name: json['name'] as String,
      color: json['color'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_TagToJson(_$_Tag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$_QuizAnswer _$$_QuizAnswerFromJson(Map<String, dynamic> json) =>
    _$_QuizAnswer(
      id: json['id'] as int,
      question: json['question'] as String,
      isCorrect: json['is_correct'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_QuizAnswerToJson(_$_QuizAnswer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'is_correct': instance.isCorrect,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$_QuizAnswerChoice _$$_QuizAnswerChoiceFromJson(Map<String, dynamic> json) =>
    _$_QuizAnswerChoice(
      id: json['id'] as int,
      choice: json['choice'] as String,
      isAnswer: json['is_answer'] as bool,
      isSelect: json['is_select'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_QuizAnswerChoiceToJson(_$_QuizAnswerChoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'choice': instance.choice,
      'is_answer': instance.isAnswer,
      'is_select': instance.isSelect,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
