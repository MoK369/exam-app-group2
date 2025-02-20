import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/data/models/sign_up/request/sign_up_request_parameters.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/use_cases/sign_up/sign_up_use_case.dart';
import 'package:exam_app_group2/modules/authentication/ui/sign_up/view_model/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpViewModel extends Cubit<SignUpState> {
  SignUpUseCase _signUpUseCase;

  SignUpViewModel(this._signUpUseCase)
      : super(const SignUpState(signUpStatus: SignUpStatus.initial));

  void signUp({required SignUpRequestParameters signUpParameters}) async {
    emit(const SignUpState(signUpStatus: SignUpStatus.loading));
    var useCaseResult =
        await _signUpUseCase.invoke(signUpParameters: signUpParameters);
    switch (useCaseResult) {
      case Success<AuthenticationResponseEntity>():
        emit(const SignUpState(signUpStatus: SignUpStatus.success));
      case Error<AuthenticationResponseEntity>():
        emit(SignUpState(
            signUpStatus: SignUpStatus.error,
            signUpErrorMessage: useCaseResult.apiErrorModel.message));
    }
  }
}
