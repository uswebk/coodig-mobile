class Quiz {
  final List<Choices> choices;
  final List<dynamic> tags;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdBy;

  Quiz({
    required this.choices,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    final choiceList = json['choices'].cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;
    List<Choices> choices = choiceList.map((item) => Choices.fromJson(item)).toList();

    final tagList = json['tags'].cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;
    List<Tag> tags = tagList.map((item) => Tag.fromJson(item)).toList();

    return Quiz(
      choices: choices,
      tags: tags,
      createdAt: DateTime.parse(json['created_at'].toString()),
      updatedAt: DateTime.parse(json['updated_at'].toString()),
      createdBy: json['created_by'].toString(),
    );
  }
}

class Choices {
  final int id;
  final String sentence;
  final bool isAnswer;
  final int sort;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int quizId;

  Choices({
    required this.id,
    required this.sentence,
    required this.isAnswer,
    required this.sort,
    required this.createdAt,
    required this.updatedAt,
    required this.quizId,
  });

  factory Choices.fromJson(Map<String, dynamic> json) {
    return Choices(
      id: json['id'] as int,
      sentence: json['sentence'].toString(),
      isAnswer: json['is_answer'] as bool,
      sort: json['sort'] as int,
      createdAt: DateTime.parse(json['created_at'].toString()),
      updatedAt: DateTime.parse(json['updated_at'].toString()),
      quizId: json['quiz_id'] as int,
    );
  }
}

class Tag {
  final int id;
  final String name;
  final String color;
  final DateTime createdAt;
  final DateTime updatedAt;

  Tag({
    required this.id,
    required this.name,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'] as int,
      name: json['name'].toString(),
      color: json['color'].toString(),
      createdAt: DateTime.parse(json['created_at'].toString()),
      updatedAt: DateTime.parse(json['updated_at'].toString()),
    );
  }
}
