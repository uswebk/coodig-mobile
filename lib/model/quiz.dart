import 'package:coodig_mobile/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    @JsonKey(name: 'choices') required List<Choices> choices,
    @JsonKey(name: 'tags') required List<Tag> tags,
    @JsonKey(name: 'question') required String question,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'created_by') required User createdBy,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}

@freezed
class Choices with _$Choices {
  const factory Choices({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'sentence') required String sentence,
    @JsonKey(name: 'is_answer') required bool isAnswer,
    @JsonKey(name: 'sort') required int sort,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Choices;

  factory Choices.fromJson(Map<String, dynamic> json) => _$ChoicesFromJson(json);
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
