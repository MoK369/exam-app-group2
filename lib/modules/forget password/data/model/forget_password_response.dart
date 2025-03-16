class ForgotPasswordResponse {
  ForgotPasswordResponse({
    this.message,
  });

  ForgotPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
  }

  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }
}
