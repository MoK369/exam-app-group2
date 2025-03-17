import '../meta_data.dart';
import 'exam.dart';

class GetAllExamsOnSubjectResponse {
  GetAllExamsOnSubjectResponse({
    this.message,
    this.metadata,
    this.exams,
  });

  GetAllExamsOnSubjectResponse.fromJson(dynamic json) {
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['exams'] != null) {
      exams = [];
      json['exams'].forEach((v) {
        exams?.add(Exam.fromJson(v));
      });
    }
  }

  String? message;
  Metadata? metadata;
  List<Exam>? exams;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (exams != null) {
      map['exams'] = exams?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
