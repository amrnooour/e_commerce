import 'package:e_commerce/data/model/response/auth_response.dart';
import 'package:e_commerce/data/utils/shared_preferance_utils.dart';
import 'package:e_commerce/domain/di/di.dart';
import 'package:e_commerce/ui/screens/auth/login/login_screen.dart';
import 'package:e_commerce/ui/screens/main/main_screen.dart';
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
    Future.delayed(const Duration(seconds: 2),() async{
      {
        var prefs =getIt<SharedPrefUtils>();
        User? user =await prefs.getUser();
        if(user == null){
          Navigator.pushNamed(context, LoginScreen.routeName);
        }else{
          Navigator.pushNamed(context, Main.routeName);
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Image.asset(AppAssets.splashScreen,fit: BoxFit.cover,),
    );
  }
}
