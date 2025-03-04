import 'package:exam_app_group2/modules/home/domain/entities/logout/logout_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logout_response_dto.g.dart';

/// message : "success"
@JsonSerializable()
class LogoutResponseDto {
  LogoutResponseDto({
    this.message,
  });

  factory LogoutResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseDtoFromJson(json);
  String? message;

  LogoutEntity convertIntoEntity() {
    return LogoutEntity(message: message);
  }
}
