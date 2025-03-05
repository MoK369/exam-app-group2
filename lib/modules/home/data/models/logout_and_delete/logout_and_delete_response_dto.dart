import 'package:exam_app_group2/modules/home/domain/entities/logout_and_delete/logout_delete_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logout_and_delete_response_dto.g.dart';

/// message : "success"
@JsonSerializable()
class LogoutAndDeleteResponseDto {
  LogoutAndDeleteResponseDto({
    this.message,
  });

  factory LogoutAndDeleteResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LogoutAndDeleteResponseDtoFromJson(json);
  String? message;

  LogoutAndDeleteEntity convertIntoEntity() {
    return LogoutAndDeleteEntity(message: message);
  }
}
