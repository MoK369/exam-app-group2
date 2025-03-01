import 'dart:developer';

import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/forget%20password/domain/entity/reset_password_entity.dart';
import 'package:exam_app_group2/modules/forget%20password/domain/usecases/reset_password_usecase.dart';
import 'package:exam_app_group2/modules/forget%20password/screens/view%20model/reset%20password%20cubit/reset_password_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordCubit  extends Cubit<ResetPasswordState>{
   final ResetPasswordUsecase resetPasswordUsecase ; 
  ResetPasswordCubit({required this.resetPasswordUsecase}) :super (const  ResetPasswordState()) ; 

  void doIntent(ResetPasswordIntent intent)
  {
    switch(intent)
    {
      
      case OnResetPasswordClicked() : 
      log("in side the case") ; 
      _resetPassword(mail: intent.mail, newPassword: intent.newPassword);
      log("after the case") ; 

    }

  } 

  void _resetPassword({required String mail , required String newPassword}) async 
  {
    emit(state.copyWith(status: ResetPasswordStatus.loading ));

    var result = await resetPasswordUsecase.invoke(mail, newPassword) ; 
    if (isClosed) return;
    switch (result) {
      case Success<void>():
        emit(state.copyWith(status: ResetPasswordStatus.success));
      case Error<void>():
        emit(state.copyWith(
          status: ResetPasswordStatus.error,
       
        ));
    }




  }


}

sealed class ResetPasswordIntent {}

class OnResetPasswordClicked extends ResetPasswordIntent
{
  
  final String mail ; 
  final String newPassword ; 
  OnResetPasswordClicked({required this.mail , required this.newPassword}); 

}
