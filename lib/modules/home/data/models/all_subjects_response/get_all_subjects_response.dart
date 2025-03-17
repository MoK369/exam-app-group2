import '../meta_data.dart';
import 'subject.dart';

class GetAllSubjectsResponse {
  GetAllSubjectsResponse({
    this.message,
    this.metadata,
    this.subjects,
  });

  GetAllSubjectsResponse.fromJson(dynamic json) {
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['subjects'] != null) {
      subjects = [];
      json['subjects'].forEach((v) {
        subjects?.add(Subject.fromJson(v));
      });
    }
  }

  String? message;
  Metadata? metadata;
  List<Subject>? subjects;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (subjects != null) {
      map['subjects'] = subjects?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
