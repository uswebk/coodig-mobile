import 'package:coodig_mobile/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'choices') required List<Choice> choices,
    @JsonKey(name: 'tags') required List<Tag> tags,
    @JsonKey(name: 'question') required String question,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'created_by') required User createdBy,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}

@freezed
class Choice with _$Choice {
  const factory Choice({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'sentence') required String sentence,
    @JsonKey(name: 'is_answer') required bool isAnswer,
    @JsonKey(name: 'sort') required int sort,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Choice;

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
}

@freezed
class Tag with _$Tag {
  const factory Tag({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'color') required String color,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

@freezed
class QuizAnswer with _$QuizAnswer {
  const factory QuizAnswer({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'question') required String question,
    @JsonKey(name: 'answer_choices') required List<QuizAnswerChoice> answerChoices,
    @JsonKey(name: 'is_correct') required bool isCorrect,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _QuizAnswer;

  factory QuizAnswer.fromJson(Map<String, dynamic> json) => _$QuizAnswerFromJson(json);
}

@freezed
class QuizAnswerChoice with _$QuizAnswerChoice {
  const factory QuizAnswerChoice({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'choice') required String choice,
    @JsonKey(name: 'is_answer') required bool isAnswer,
    @JsonKey(name: 'is_select') required bool isSelect,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _QuizAnswerChoice;

  factory QuizAnswerChoice.fromJson(Map<String, dynamic> json) => _$QuizAnswerChoiceFromJson(json);
}
