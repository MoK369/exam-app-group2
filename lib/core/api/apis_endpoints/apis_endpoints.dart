class ApisEndpoints {
  static const String baseUrl = 'https://exam.elevateegy.com/';
  static const String signUp = "api/v1/auth/signup";
  static const String login = 'api/v1/auth/signin';
  static const String getAllSubjects = 'api/v1/subjects';
  static const String getAllExamsOnSubject = 'api/v1/exams';
  static const String getAllQuestions = 'api/v1/questions';
  static const String checkQuestions = 'api/v1/questions/check';

  static const forgetPasswordEndPoint = "api/v1/auth/forgotPassword";
  static const verifyCodeEndPoint = "api/v1/auth/verifyResetCode";
  static const resetPasswordEndPoint = "api/v1/auth/resetPassword";
}
