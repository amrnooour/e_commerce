import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/domain/use_cases/Login_use_case.dart';
import 'package:e_commerce/ui/utils/base_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  LoginUseCase loginUseCase;
  LoginViewModel(this.loginUseCase) :super(BaseInitialState());

  void login() async{
    if(!formKey.currentState!.validate()) return;
    emit(BaseLoadingState());
    Either<Failure,bool> response =
    await loginUseCase.execute(emailController.text, passwordController.text);
    response.fold((error) {
      emit(BaseErrorState(error.errorMessage));
    }, (success) {
      emit(BaseSuccessState());
    });
  }

}
