import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/request/RegesterRequestBody.dart';
import 'package:e_commerce/data/model/response/auth_response.dart';
import 'package:e_commerce/data/utils/shared_preferance_utils.dart';
import 'package:e_commerce/domain/repos/auth_repo/auth_repo.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as :AuthRepo)
class AuthRepoImpl extends AuthRepo{
  SharedPrefUtils sharedPrefUtils;
  Connectivity connectivity;
  AuthRepoImpl(this.connectivity,this.sharedPrefUtils);

  Future<Either<Failure, bool>> login(String email,String password) async{
    ConnectivityResult connectivityResult= await (connectivity.checkConnectivity());
    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {
      try {
        Uri url = Uri.https(
            "https://ecommerce.routemisr.com", "/api/v1/auth/signin");
        Response serverResponse = await post(url, body: {
          "email": email,
          "password": password
        });
        AuthResponse authResponse = AuthResponse.fromJson(
            jsonDecode(serverResponse.body));
        if (serverResponse.statusCode >= 200 &&
            serverResponse.statusCode < 300) {
          sharedPrefUtils.saveUser(authResponse.user!);
          sharedPrefUtils.saveToken(authResponse.token!);
          return right(true);
        } else {
          return Left(Failure(
              authResponse.message ?? Constants.defaultErrorMessage));
        }
      } catch (_) {
        return Left(Failure(Constants.defaultErrorMessage));
      }
    }
    else{
      return Left(NetworkFailure(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> Register(RegesterRequestBody body) async{
    ConnectivityResult connectivityResult= await (connectivity.checkConnectivity());
    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile){
      Uri url =Uri.https("https://ecommerce.routemisr.com","/api/v1/auth/signup");
      Response serverResponse = await post(url,body:body.toJson());
      AuthResponse authResponse =AuthResponse.fromJson(jsonDecode(serverResponse.body));
      if(serverResponse.statusCode >=200 && serverResponse.statusCode <300){
        sharedPrefUtils.saveUser(authResponse.user!);
        sharedPrefUtils.saveToken(authResponse.token!);
        return right(true);
      }else{
        return Left(Failure(authResponse.message.toString()??"something went wrong please try later"));
      }
    }else{
      return Left(NetworkFailure("please check your internet connection and try again"));
    }
  }
}