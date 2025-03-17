import 'package:exam_app_group2/modules/home/data/models/all_questions_response/question.dart';

class GetAllQuestionsResponse {
  GetAllQuestionsResponse({
    this.message,
    this.questions,
  });

  GetAllQuestionsResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(Question.fromJson(v));
      });
    }
  }

  String? message;
  List<Question>? questions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (questions != null) {
      map['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
