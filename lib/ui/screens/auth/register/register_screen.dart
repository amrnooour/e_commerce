import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/data/repos/auth_repos/auth_repos.impl.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/domain/use_cases/regester_use_case.dart';
import 'package:e_commerce/ui/screens/auth/register/register_view_model.dart';
import 'package:e_commerce/ui/screens/main/main_screen.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/base_states.dart';
import 'package:e_commerce/ui/utils/dialog_utils.dart';
import 'package:e_commerce/ui/widgets/custom_button.dart';
import 'package:e_commerce/ui/widgets/custom_text_field.dart';
import 'package:e_commerce/ui/widgets/form_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName ="registerScreen";
  RegisterViewModel registerViewModel = getIt();


  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: registerViewModel,
      listener: (context,state){
        if(state is BaseRequestLoadingState){
          showLoading(context);
        }else if(state is BaseRequestErrorState){
          hideLoading(context);
          showErrorDialog(context, state.message);
        }else if(state is BaseRequestSuccessState){
          hideLoading(context);
          Navigator.pushNamed(context, Main.routeName);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              AppAssets.routeLogo,
              height: 71,
              width: 237,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: registerViewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormLabelWidget(label: 'Full Name'),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                            controller: registerViewModel.nameController,
                            hintText: 'enter your full name',
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter full name';
                              }
                              return null;
                            },
                            type: TextInputType.name),
                        const SizedBox(
                          height: 32,
                        ),
                        FormLabelWidget(label: 'Email Address'),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                            controller: registerViewModel.emailController,
                            hintText: 'enter your email address',
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter email';
                              }
                              var emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(text);
                              if (!emailValid) {
                                return 'email format not valid';
                              }

                              return null;
                            },
                            type: TextInputType.emailAddress),
                        const SizedBox(
                          height: 32,
                        ),
                        FormLabelWidget(label: 'Mobile Number'),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                            controller: registerViewModel.phoneController,
                            hintText: 'enter your mobile number',
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter mobile number';
                              }
                              if (text.trim().length < 10) {
                                return 'Phone number should be at least 10 numbers.';
                              }
                              return null;
                            },
                            type: TextInputType.phone),
                        const SizedBox(
                          height: 32,
                        ),
                        FormLabelWidget(label: 'Password'),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                          controller: registerViewModel.passwordController,
                          hintText: 'enter your password',
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter password ';
                            }
                            if (text.length < 6) {
                              return 'Phone number should be at least 6 chrs.';
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        FormLabelWidget(label: 'Password Confirmation'),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                          controller: registerViewModel.rePasswordController,
                          hintText: 're-enter your password confirmation',

                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please re-enter password ';
                            }
                            if(registerViewModel.rePasswordController.text !=text){
                              return 'password dosn`t match';
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 56,
                        ),
                        CustomButtonWidget(
                            title: 'Sign Up',
                            onPressed: () {
                              registerViewModel.register();
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
