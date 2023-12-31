import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/domain/use_cases/Login_use_case.dart';
import 'package:e_commerce/ui/utils/base_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  LoginUseCase loginUseCase;
  LoginViewModel(this.loginUseCase) :super(BaseRequestInitialState());

  void login() async{
    if(!formKey.currentState!.validate()) return;
    emit(BaseRequestLoadingState());
    loginUseCase.email = emailController.text;
    loginUseCase.password = passwordController.text;
    Either<Failure,bool> response =
    await loginUseCase.execute();
    response.fold((error) {
      emit(BaseRequestErrorState(error.errorMessage));
    }, (success) {
      emit(BaseRequestSuccessState());
    });
  }

}
