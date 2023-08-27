// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return _Quiz.fromJson(json);
}

/// @nodoc
mixin _$Quiz {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'choices')
  List<Choice> get choices => throw _privateConstructorUsedError;
  @JsonKey(name: 'tags')
  List<Tag> get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'question')
  String get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  User get createdBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res, Quiz>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'choices') List<Choice> choices,
      @JsonKey(name: 'tags') List<Tag> tags,
      @JsonKey(name: 'question') String question,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'created_by') User createdBy});

  $UserCopyWith<$Res> get createdBy;
}

/// @nodoc
class _$QuizCopyWithImpl<$Res, $Val extends Quiz>
    implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? choices = null,
    Object? tags = null,
    Object? question = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? createdBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Choice>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get createdBy {
    return $UserCopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuizCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$$_QuizCopyWith(_$_Quiz value, $Res Function(_$_Quiz) then) =
      __$$_QuizCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'choices') List<Choice> choices,
      @JsonKey(name: 'tags') List<Tag> tags,
      @JsonKey(name: 'question') String question,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'created_by') User createdBy});

  @override
  $UserCopyWith<$Res> get createdBy;
}

/// @nodoc
class __$$_QuizCopyWithImpl<$Res> extends _$QuizCopyWithImpl<$Res, _$_Quiz>
    implements _$$_QuizCopyWith<$Res> {
  __$$_QuizCopyWithImpl(_$_Quiz _value, $Res Function(_$_Quiz) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? choices = null,
    Object? tags = null,
    Object? question = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? createdBy = null,
  }) {
    return _then(_$_Quiz(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Choice>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quiz implements _Quiz {
  const _$_Quiz(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'choices') required final List<Choice> choices,
      @JsonKey(name: 'tags') required final List<Tag> tags,
      @JsonKey(name: 'question') required this.question,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'created_by') required this.createdBy})
      : _choices = choices,
        _tags = tags;

  factory _$_Quiz.fromJson(Map<String, dynamic> json) => _$$_QuizFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  final List<Choice> _choices;
  @override
  @JsonKey(name: 'choices')
  List<Choice> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  final List<Tag> _tags;
  @override
  @JsonKey(name: 'tags')
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey(name: 'question')
  final String question;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'created_by')
  final User createdBy;

  @override
  String toString() {
    return 'Quiz(id: $id, choices: $choices, tags: $tags, question: $question, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Quiz &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_choices),
      const DeepCollectionEquality().hash(_tags),
      question,
      createdAt,
      updatedAt,
      createdBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizCopyWith<_$_Quiz> get copyWith =>
      __$$_QuizCopyWithImpl<_$_Quiz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizToJson(
      this,
    );
  }
}

abstract class _Quiz implements Quiz {
  const factory _Quiz(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'choices') required final List<Choice> choices,
      @JsonKey(name: 'tags') required final List<Tag> tags,
      @JsonKey(name: 'question') required final String question,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'created_by') required final User createdBy}) = _$_Quiz;

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$_Quiz.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'choices')
  List<Choice> get choices;
  @override
  @JsonKey(name: 'tags')
  List<Tag> get tags;
  @override
  @JsonKey(name: 'question')
  String get question;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'created_by')
  User get createdBy;
  @override
  @JsonKey(ignore: true)
  _$$_QuizCopyWith<_$_Quiz> get copyWith => throw _privateConstructorUsedError;
}

Choice _$ChoiceFromJson(Map<String, dynamic> json) {
  return _Choice.fromJson(json);
}

/// @nodoc
mixin _$Choice {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'sentence')
  String get sentence => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_answer')
  bool get isAnswer => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort')
  int get sort => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChoiceCopyWith<Choice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoiceCopyWith<$Res> {
  factory $ChoiceCopyWith(Choice value, $Res Function(Choice) then) =
      _$ChoiceCopyWithImpl<$Res, Choice>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'sentence') String sentence,
      @JsonKey(name: 'is_answer') bool isAnswer,
      @JsonKey(name: 'sort') int sort,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$ChoiceCopyWithImpl<$Res, $Val extends Choice>
    implements $ChoiceCopyWith<$Res> {
  _$ChoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sentence = null,
    Object? isAnswer = null,
    Object? sort = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sentence: null == sentence
          ? _value.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String,
      isAnswer: null == isAnswer
          ? _value.isAnswer
          : isAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChoiceCopyWith<$Res> implements $ChoiceCopyWith<$Res> {
  factory _$$_ChoiceCopyWith(_$_Choice value, $Res Function(_$_Choice) then) =
      __$$_ChoiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'sentence') String sentence,
      @JsonKey(name: 'is_answer') bool isAnswer,
      @JsonKey(name: 'sort') int sort,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$_ChoiceCopyWithImpl<$Res>
    extends _$ChoiceCopyWithImpl<$Res, _$_Choice>
    implements _$$_ChoiceCopyWith<$Res> {
  __$$_ChoiceCopyWithImpl(_$_Choice _value, $Res Function(_$_Choice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sentence = null,
    Object? isAnswer = null,
    Object? sort = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_Choice(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sentence: null == sentence
          ? _value.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String,
      isAnswer: null == isAnswer
          ? _value.isAnswer
          : isAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Choice implements _Choice {
  const _$_Choice(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'sentence') required this.sentence,
      @JsonKey(name: 'is_answer') required this.isAnswer,
      @JsonKey(name: 'sort') required this.sort,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$_Choice.fromJson(Map<String, dynamic> json) =>
      _$$_ChoiceFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'sentence')
  final String sentence;
  @override
  @JsonKey(name: 'is_answer')
  final bool isAnswer;
  @override
  @JsonKey(name: 'sort')
  final int sort;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Choice(id: $id, sentence: $sentence, isAnswer: $isAnswer, sort: $sort, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Choice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sentence, sentence) ||
                other.sentence == sentence) &&
            (identical(other.isAnswer, isAnswer) ||
                other.isAnswer == isAnswer) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, sentence, isAnswer, sort, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChoiceCopyWith<_$_Choice> get copyWith =>
      __$$_ChoiceCopyWithImpl<_$_Choice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChoiceToJson(
      this,
    );
  }
}

abstract class _Choice implements Choice {
  const factory _Choice(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'sentence') required final String sentence,
          @JsonKey(name: 'is_answer') required final bool isAnswer,
          @JsonKey(name: 'sort') required final int sort,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$_Choice;

  factory _Choice.fromJson(Map<String, dynamic> json) = _$_Choice.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'sentence')
  String get sentence;
  @override
  @JsonKey(name: 'is_answer')
  bool get isAnswer;
  @override
  @JsonKey(name: 'sort')
  int get sort;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ChoiceCopyWith<_$_Choice> get copyWith =>
      throw _privateConstructorUsedError;
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return _Tag.fromJson(json);
}

/// @nodoc
mixin _$Tag {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagCopyWith<Tag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagCopyWith<$Res> {
  factory $TagCopyWith(Tag value, $Res Function(Tag) then) =
      _$TagCopyWithImpl<$Res, Tag>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'color') String color,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$TagCopyWithImpl<$Res, $Val extends Tag> implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TagCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$$_TagCopyWith(_$_Tag value, $Res Function(_$_Tag) then) =
      __$$_TagCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'color') String color,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$_TagCopyWithImpl<$Res> extends _$TagCopyWithImpl<$Res, _$_Tag>
    implements _$$_TagCopyWith<$Res> {
  __$$_TagCopyWithImpl(_$_Tag _value, $Res Function(_$_Tag) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_Tag(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tag implements _Tag {
  const _$_Tag(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'color') required this.color,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$_Tag.fromJson(Map<String, dynamic> json) => _$$_TagFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'color')
  final String color;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Tag(id: $id, name: $name, color: $color, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tag &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, color, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TagCopyWith<_$_Tag> get copyWith =>
      __$$_TagCopyWithImpl<_$_Tag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagToJson(
      this,
    );
  }
}

abstract class _Tag implements Tag {
  const factory _Tag(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'color') required final String color,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt}) = _$_Tag;

  factory _Tag.fromJson(Map<String, dynamic> json) = _$_Tag.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'color')
  String get color;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_TagCopyWith<_$_Tag> get copyWith => throw _privateConstructorUsedError;
}

QuizAnswer _$QuizAnswerFromJson(Map<String, dynamic> json) {
  return _QuizAnswer.fromJson(json);
}

/// @nodoc
mixin _$QuizAnswer {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'question')
  String get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_choices')
  List<QuizAnswerChoice> get answerChoices =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'is_correct')
  bool get isCorrect => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizAnswerCopyWith<QuizAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizAnswerCopyWith<$Res> {
  factory $QuizAnswerCopyWith(
          QuizAnswer value, $Res Function(QuizAnswer) then) =
      _$QuizAnswerCopyWithImpl<$Res, QuizAnswer>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'question') String question,
      @JsonKey(name: 'answer_choices') List<QuizAnswerChoice> answerChoices,
      @JsonKey(name: 'is_correct') bool isCorrect,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$QuizAnswerCopyWithImpl<$Res, $Val extends QuizAnswer>
    implements $QuizAnswerCopyWith<$Res> {
  _$QuizAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answerChoices = null,
    Object? isCorrect = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answerChoices: null == answerChoices
          ? _value.answerChoices
          : answerChoices // ignore: cast_nullable_to_non_nullable
              as List<QuizAnswerChoice>,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizAnswerCopyWith<$Res>
    implements $QuizAnswerCopyWith<$Res> {
  factory _$$_QuizAnswerCopyWith(
          _$_QuizAnswer value, $Res Function(_$_QuizAnswer) then) =
      __$$_QuizAnswerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'question') String question,
      @JsonKey(name: 'answer_choices') List<QuizAnswerChoice> answerChoices,
      @JsonKey(name: 'is_correct') bool isCorrect,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$_QuizAnswerCopyWithImpl<$Res>
    extends _$QuizAnswerCopyWithImpl<$Res, _$_QuizAnswer>
    implements _$$_QuizAnswerCopyWith<$Res> {
  __$$_QuizAnswerCopyWithImpl(
      _$_QuizAnswer _value, $Res Function(_$_QuizAnswer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answerChoices = null,
    Object? isCorrect = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_QuizAnswer(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answerChoices: null == answerChoices
          ? _value._answerChoices
          : answerChoices // ignore: cast_nullable_to_non_nullable
              as List<QuizAnswerChoice>,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizAnswer implements _QuizAnswer {
  const _$_QuizAnswer(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'question') required this.question,
      @JsonKey(name: 'answer_choices')
      required final List<QuizAnswerChoice> answerChoices,
      @JsonKey(name: 'is_correct') required this.isCorrect,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _answerChoices = answerChoices;

  factory _$_QuizAnswer.fromJson(Map<String, dynamic> json) =>
      _$$_QuizAnswerFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'question')
  final String question;
  final List<QuizAnswerChoice> _answerChoices;
  @override
  @JsonKey(name: 'answer_choices')
  List<QuizAnswerChoice> get answerChoices {
    if (_answerChoices is EqualUnmodifiableListView) return _answerChoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answerChoices);
  }

  @override
  @JsonKey(name: 'is_correct')
  final bool isCorrect;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'QuizAnswer(id: $id, question: $question, answerChoices: $answerChoices, isCorrect: $isCorrect, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizAnswer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality()
                .equals(other._answerChoices, _answerChoices) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question,
      const DeepCollectionEquality().hash(_answerChoices),
      isCorrect,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizAnswerCopyWith<_$_QuizAnswer> get copyWith =>
      __$$_QuizAnswerCopyWithImpl<_$_QuizAnswer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizAnswerToJson(
      this,
    );
  }
}

abstract class _QuizAnswer implements QuizAnswer {
  const factory _QuizAnswer(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'question') required final String question,
          @JsonKey(name: 'answer_choices')
          required final List<QuizAnswerChoice> answerChoices,
          @JsonKey(name: 'is_correct') required final bool isCorrect,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$_QuizAnswer;

  factory _QuizAnswer.fromJson(Map<String, dynamic> json) =
      _$_QuizAnswer.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'question')
  String get question;
  @override
  @JsonKey(name: 'answer_choices')
  List<QuizAnswerChoice> get answerChoices;
  @override
  @JsonKey(name: 'is_correct')
  bool get isCorrect;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_QuizAnswerCopyWith<_$_QuizAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizAnswerChoice _$QuizAnswerChoiceFromJson(Map<String, dynamic> json) {
  return _QuizAnswerChoice.fromJson(json);
}

/// @nodoc
mixin _$QuizAnswerChoice {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'choice')
  String get choice => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_answer')
  bool get isAnswer => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_select')
  bool get isSelect => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizAnswerChoiceCopyWith<QuizAnswerChoice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizAnswerChoiceCopyWith<$Res> {
  factory $QuizAnswerChoiceCopyWith(
          QuizAnswerChoice value, $Res Function(QuizAnswerChoice) then) =
      _$QuizAnswerChoiceCopyWithImpl<$Res, QuizAnswerChoice>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'choice') String choice,
      @JsonKey(name: 'is_answer') bool isAnswer,
      @JsonKey(name: 'is_select') bool isSelect,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$QuizAnswerChoiceCopyWithImpl<$Res, $Val extends QuizAnswerChoice>
    implements $QuizAnswerChoiceCopyWith<$Res> {
  _$QuizAnswerChoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? choice = null,
    Object? isAnswer = null,
    Object? isSelect = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      choice: null == choice
          ? _value.choice
          : choice // ignore: cast_nullable_to_non_nullable
              as String,
      isAnswer: null == isAnswer
          ? _value.isAnswer
          : isAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelect: null == isSelect
          ? _value.isSelect
          : isSelect // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizAnswerChoiceCopyWith<$Res>
    implements $QuizAnswerChoiceCopyWith<$Res> {
  factory _$$_QuizAnswerChoiceCopyWith(
          _$_QuizAnswerChoice value, $Res Function(_$_QuizAnswerChoice) then) =
      __$$_QuizAnswerChoiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'choice') String choice,
      @JsonKey(name: 'is_answer') bool isAnswer,
      @JsonKey(name: 'is_select') bool isSelect,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$_QuizAnswerChoiceCopyWithImpl<$Res>
    extends _$QuizAnswerChoiceCopyWithImpl<$Res, _$_QuizAnswerChoice>
    implements _$$_QuizAnswerChoiceCopyWith<$Res> {
  __$$_QuizAnswerChoiceCopyWithImpl(
      _$_QuizAnswerChoice _value, $Res Function(_$_QuizAnswerChoice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? choice = null,
    Object? isAnswer = null,
    Object? isSelect = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_QuizAnswerChoice(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      choice: null == choice
          ? _value.choice
          : choice // ignore: cast_nullable_to_non_nullable
              as String,
      isAnswer: null == isAnswer
          ? _value.isAnswer
          : isAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelect: null == isSelect
          ? _value.isSelect
          : isSelect // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizAnswerChoice implements _QuizAnswerChoice {
  const _$_QuizAnswerChoice(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'choice') required this.choice,
      @JsonKey(name: 'is_answer') required this.isAnswer,
      @JsonKey(name: 'is_select') required this.isSelect,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$_QuizAnswerChoice.fromJson(Map<String, dynamic> json) =>
      _$$_QuizAnswerChoiceFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'choice')
  final String choice;
  @override
  @JsonKey(name: 'is_answer')
  final bool isAnswer;
  @override
  @JsonKey(name: 'is_select')
  final bool isSelect;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'QuizAnswerChoice(id: $id, choice: $choice, isAnswer: $isAnswer, isSelect: $isSelect, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizAnswerChoice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.choice, choice) || other.choice == choice) &&
            (identical(other.isAnswer, isAnswer) ||
                other.isAnswer == isAnswer) &&
            (identical(other.isSelect, isSelect) ||
                other.isSelect == isSelect) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, choice, isAnswer, isSelect, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizAnswerChoiceCopyWith<_$_QuizAnswerChoice> get copyWith =>
      __$$_QuizAnswerChoiceCopyWithImpl<_$_QuizAnswerChoice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizAnswerChoiceToJson(
      this,
    );
  }
}

abstract class _QuizAnswerChoice implements QuizAnswerChoice {
  const factory _QuizAnswerChoice(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'choice') required final String choice,
          @JsonKey(name: 'is_answer') required final bool isAnswer,
          @JsonKey(name: 'is_select') required final bool isSelect,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$_QuizAnswerChoice;

  factory _QuizAnswerChoice.fromJson(Map<String, dynamic> json) =
      _$_QuizAnswerChoice.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'choice')
  String get choice;
  @override
  @JsonKey(name: 'is_answer')
  bool get isAnswer;
  @override
  @JsonKey(name: 'is_select')
  bool get isSelect;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_QuizAnswerChoiceCopyWith<_$_QuizAnswerChoice> get copyWith =>
      throw _privateConstructorUsedError;
}
