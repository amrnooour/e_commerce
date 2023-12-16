import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/request/RegesterRequestBody.dart';
import 'package:e_commerce/domain/use_cases/regester_use_case.dart';
import 'package:e_commerce/ui/utils/base_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit{
  RegisterUseCase useCase;

  RegisterViewModel(this.useCase) : super(BaseInitialState());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  register() async {
    if (!formKey.currentState!.validate()) return;
    emit(BaseLoadingState());
    Either<Failure, bool> eitherResponse = await useCase.execute(
        RegesterRequestBody(
            email: emailController.text,
            name: nameController.text,
            password: passwordController.text,
            rePassword: rePasswordController.text,
            phone: phoneController.text));
    eitherResponse.fold((error) => emit(BaseErrorState(error.errorMessage)),
            (r) => emit(BaseSuccessState()));
  }
}