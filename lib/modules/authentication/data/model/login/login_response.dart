//
// import 'user_dm.dart';
//
// class LoginResponse {
//   LoginResponse({
//     this.message,
//     this.token,
//     this.user,});
//
//   LoginResponse.fromJson(dynamic json) {
//     message = json['message'];
//     token = json['token'];
//     user = json['user'] != null ? UserDM.fromJson(json['user']) : null;
//   }
//   String? message;
//   String? token;
//   UserDM? user;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['message'] = message;
//     map['token'] = token;
//     if (user != null) {
//       map['user'] = user?.toJson();
//     }
//     return map;
//   }
//
// }