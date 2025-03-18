import 'package:exam_app_group2/modules/authentication/domain/entity/verification_response_entity.dart';

class VerificationResponseDto {
  VerificationResponseDto({
    required this.status,
  });

  final String? status;

  factory VerificationResponseDto.fromJson(Map<String, dynamic> json) {
    return VerificationResponseDto(
      status: json["status"],
    );
  }

  @override
  String toString() {
    return "$status, ";
  }

  VerificationResponseEntity convertIntoEntity() {
    return VerificationResponseEntity(status: status);
  }
}
