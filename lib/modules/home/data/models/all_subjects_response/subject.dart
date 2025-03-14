import 'package:exam_app_group2/modules/home/domain/entities/subject_entity.dart';

class Subject {
  Subject({
    this.id,
    this.name,
    this.icon,
    this.createdAt,
  });

  Subject.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    icon = json['icon'];
    createdAt = json['createdAt'];
  }

  String? id;
  String? name;
  String? icon;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    map['createdAt'] = createdAt;
    return map;
  }

  SubjectEntity toEntity() => SubjectEntity(
        id: id,
        name: name,
        icon: icon,
      );
}
