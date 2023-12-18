import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/response/cart_dm.dart';
import 'package:e_commerce/data/model/response/cart_response.dart';
import 'package:e_commerce/data/model/response/categories_dm.dart';
import 'package:e_commerce/data/model/response/categories_response.dart';
import 'package:e_commerce/data/model/response/product_dm.dart';
import 'package:e_commerce/data/model/response/product_response.dart';
import 'package:e_commerce/data/utils/shared_preferance_utils.dart';
import 'package:e_commerce/domain/repos/main_repo/data_source/main_online_ds.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:e_commerce/ui/utils/end_points.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MainOnlineDS)
class MainOnlineDSImpl extends MainOnlineDS {
  SharedPrefUtils sharedPrefUtils;

  MainOnlineDSImpl(this.sharedPrefUtils);

  @override
  Future<Either<Failure, List<CategoryDM>>> getCategories() async {
    try {
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.categories);
      Response serverResponse = await get(url);
      var myResponse =
      CategoriesResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 &&
          serverResponse.statusCode < 300 &&
          myResponse.data?.isNotEmpty == true) {
        return Right(myResponse.data!);
      } else {
        return Left(
            Failure(myResponse.message ?? Constants.defaultErrorMessage));
      }
    } catch (error, stacktrace) {
      print("Handling exception: ${error}, stackTrace: $stacktrace");
      return Left(Failure(Constants.defaultErrorMessage));
    }
  }

  @override
  Future<Either<Failure, List<ProductDM>>> getProducts() async {
    try {
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.products);
      Response serverResponse = await get(url);
      var myResponse =
      ProductsResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 &&
          serverResponse.statusCode < 300 &&
          myResponse.data?.isNotEmpty == true) {
        return Right(myResponse.data!);
      } else {
        return Left(
            Failure(myResponse.message ?? Constants.defaultErrorMessage));
      }
    } catch (error, stacktrace) {
      print("Handling exception: ${error}, stackTrace: $stacktrace");
      return Left(Failure(Constants.defaultErrorMessage));
    }
  }

  @override
  Future<Either<Failure, CartDM>> getLoggedUserCart() async {
    try {
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.cart);
      String token = (await sharedPrefUtils.getToken())!;
      Response serverResponse = await get(url, headers: {"token": token});
      CartResponse cartResponse =
      CartResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 &&
          serverResponse.statusCode < 300 &&
          cartResponse.data != null) {
        return Right(cartResponse.data!);
      } else {
        return Left(
            Failure(cartResponse.message ?? Constants.defaultErrorMessage));
      }
    } catch (e) {
      print("Exception while getLoggedUserCart: ${e}");
      return Left(Failure(Constants.defaultErrorMessage));
    }
  }

  @override
  Future<Either<Failure, CartDM>> addProductToCart(String id) async {
    try {
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.cart);
      String token = (await sharedPrefUtils.getToken())!;
      Response serverResponse =
      await post(url, body: {"productId": id}, headers: {"token": token});
      Map json = jsonDecode(serverResponse.body);
      if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
        return getLoggedUserCart();
      } else {
        return Left(Failure(json["message"] ?? Constants.defaultErrorMessage));
      }
    } catch (e) {
      print("Exception while getLoggedUserCart: ${e}");
      return Left(Failure(Constants.defaultErrorMessage));
    }
  }

  @override
  Future<Either<Failure, CartDM>> removeProductFromCart(String id) async {
    try {
      Uri url = Uri.parse("https://${EndPoints.baseUrl}${EndPoints.cart}/$id");
      String token = (await sharedPrefUtils.getToken())!;
      Response serverResponse = await delete(url, headers: {"token": token});
      Map json = jsonDecode(serverResponse.body);
      if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
        return getLoggedUserCart();
      } else {
        return Left(Failure(json["message"] ?? Constants.defaultErrorMessage));
      }
    } catch (e) {
      print("Exception while getLoggedUserCart: ${e}");
      return Left(Failure(Constants.defaultErrorMessage));
    }
  }
}