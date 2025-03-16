import 'dart:developer';

import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/forget%20password/domain/usecases/verfy_code_usecase.dart';
import 'package:exam_app_group2/modules/forget%20password/screens/view%20model/verfy%20code%20cubit/verfy_code_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerfyCodeCubit extends Cubit<VerifyCodeState>{

  final VerfyCodeUsecase verfyCodeUsecase ; 
  VerfyCodeCubit({required this.verfyCodeUsecase}) :super (const  VerifyCodeState()) ; 
  void submitCode(List<TextEditingController> controllers) {
    final code = controllers.map((c) => c.text).join();

    if (code.length == 6) {
      log("inside verfiy intent");
      doIntent(OnVerfiyCodeSubmitted(code: code));
    }
  }


   void doIntent(VerifyCodeIntent intent) {
    switch (intent) {
      case OnVerfiyCodeSubmitted():
        _verfyCode(
          code: intent.code,
        );
    }
  }

  void _verfyCode(
    {
      required String code 
    }
  ) async
  {
    emit(state.copyWith(status: VerifyCodeStatus.loading ));

    var result = await verfyCodeUsecase.invoke(code); 

     if (isClosed) return;
     switch (result) {
      case Success<void>():
        emit(state.copyWith(status: VerifyCodeStatus.success));
      case Error<void>():
        emit(state.copyWith(
          status: VerifyCodeStatus.error,
          // apiErrorModel: result.apiErrorModel,
        ));
    }

  }
}

sealed class VerifyCodeIntent {}

class OnVerfiyCodeSubmitted extends VerifyCodeIntent 
{
  final String code ; 
  OnVerfiyCodeSubmitted({required this.code}) ; 

}