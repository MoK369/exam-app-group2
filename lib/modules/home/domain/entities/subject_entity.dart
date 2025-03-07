import 'package:isar/isar.dart';

part 'subject_entity.g.dart';

@embedded
class SubjectEntity {
  String? id;
  String? name;
  String? icon;

  SubjectEntity({
    this.id,
    this.name,
    this.icon,
  });

  SubjectEntity.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    icon = json['icon'];
  }
}
