import '../../../domain/entities/question_entity.dart';
import '../all_exams_on_subject_response/exam.dart';
import '../all_subjects_response/subject.dart';
import 'answer.dart';

class Question {
  Question({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  Question.fromJson(dynamic json) {
    if (json['answers'] != null) {
      answers = [];
      json['answers'].forEach((v) {
        answers?.add(Answer.fromJson(v));
      });
    }
    type = json['type'];
    id = json['_id'];
    question = json['question'];
    correct = json['correct'];
    subject =
        json['subject'] != null ? Subject.fromJson(json['subject']) : null;
    exam = json['exam'] != null ? Exam.fromJson(json['exam']) : null;
    createdAt = json['createdAt'];
  }

  List<Answer>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;
  Subject? subject;
  Exam? exam;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (answers != null) {
      map['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    map['type'] = type;
    map['_id'] = id;
    map['question'] = question;
    map['correct'] = correct;
    if (subject != null) {
      map['subject'] = subject?.toJson();
    }
    if (exam != null) {
      map['exam'] = exam?.toJson();
    }
    map['createdAt'] = createdAt;
    return map;
  }

  QuestionEntity toEntity() => QuestionEntity(
        answers: answers?.map((answer) => answer.toEntity()).toList(),
        type: type,
        id: id,
        question: question,
        correct: correct,
        subject: subject?.toEntity(),
        exam: exam?.toEntity(),
      );
}
