class ResetPasswordResponse {
  ResetPasswordResponse({
    this.message,
    this.token,
  });

  ResetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }

  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }
}
