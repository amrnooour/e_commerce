import 'package:e_commerce/ui/screens/auth/login/login_screen.dart';
import 'package:e_commerce/ui/screens/auth/register/register_screen.dart';
import 'package:e_commerce/ui/screens/home_screen.dart';
import 'package:e_commerce/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName :(_)=>HomeScreen(),
        SplashScreen.routeName :(_)=>SplashScreen(),
        LoginScreen.routeName :(_)=>LoginScreen(),
        RegisterScreen.routeName:(_)=>RegisterScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
