import 'package:e_commerce/ui/screens/auth/login/login_screen.dart';
import 'package:e_commerce/ui/screens/auth/register/register_screen.dart';
import 'package:e_commerce/ui/screens/cart/cart.dart';
import 'package:e_commerce/ui/screens/main/main_screen.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_screen.dart';
import 'package:e_commerce/ui/screens/splash_screen.dart';
import 'package:e_commerce/ui/shared_view_models/cart_view_model.dart';
import 'package:e_commerce/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/di/di.dart';

void main() {
  configureDependencies();
  runApp(BlocProvider(
      create: (_) => getIt<CartViewModel>(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        Main.routeName: (_) => Main(),
        ProductDetails.routeName: (_) => ProductDetails(),
        Cart.routeName: (_) => const Cart()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
