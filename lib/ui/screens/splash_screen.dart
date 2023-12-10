import 'package:e_commerce/ui/screens/auth/login_screen.dart';
import 'package:e_commerce/ui/screens/home_screen.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2),() => Navigator.pushNamed(context, LoginScreen.routeName),);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Image.asset(AppAssets.splashScreen,fit: BoxFit.cover,),
    );
  }
}
