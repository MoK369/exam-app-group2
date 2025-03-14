import 'package:exam_app_group2/modules/home/domain/entities/check_questions_response_entity.dart';

import 'check_questions.dart';

class CheckQuestionResponse {
  CheckQuestionResponse({
    this.message,
    this.correct,
    this.wrong,
    this.total,
    this.wrongQuestions,
    this.correctQuestions,
  });

  CheckQuestionResponse.fromJson(dynamic json) {
    message = json['message'];
    correct = json['correct'];
    wrong = json['wrong'];
    total = json['total'];
    if (json['WrongQuestions'] != null) {
      wrongQuestions = [];
      json['WrongQuestions'].forEach((v) {
        wrongQuestions?.add(Questions.fromJson(v));
      });
    }
    if (json['correctQuestions'] != null) {
      correctQuestions = [];
      json['correctQuestions'].forEach((v) {
        correctQuestions?.add(Questions.fromJson(v));
      });
    }
  }

  String? message;
  num? correct;
  num? wrong;
  String? total;
  List<Questions>? wrongQuestions;
  List<Questions>? correctQuestions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['correct'] = correct;
    map['wrong'] = wrong;
    map['total'] = total;
    if (wrongQuestions != null) {
      map['WrongQuestions'] = wrongQuestions?.map((v) => v.toJson()).toList();
    }
    if (correctQuestions != null) {
      map['correctQuestions'] =
          correctQuestions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  CheckQuestionsResponseEntity toEntity() => CheckQuestionsResponseEntity(
        correct: correct,
        wrong: wrong,
        total: total,
      );
}
