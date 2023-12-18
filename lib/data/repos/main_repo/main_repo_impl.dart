import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/response/cart_dm.dart';
import 'package:e_commerce/data/model/response/categories_dm.dart';
import 'package:e_commerce/data/model/response/product_dm.dart';
import 'package:e_commerce/domain/repos/main_repo/data_source/main_online_ds.dart';
import 'package:e_commerce/domain/repos/main_repo/main_repo.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:e_commerce/ui/utils/exennsions.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MainRepo)
class MainRepoImpl extends MainRepo {
  Connectivity connectivity;
  MainOnlineDS ds;

  MainRepoImpl(this.connectivity, this.ds);

  @override
  Future<Either<Failure, List<CategoryDM>>> getCategories() async {
    if (await connectivity.isInternetConnected) {
      return ds.getCategories();
    } else {
      return Left(Failure(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<Failure, List<ProductDM>>> getProducts() async {
    if (await connectivity.isInternetConnected) {
      return ds.getProducts();
    } else {
      return Left(Failure(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<Failure, CartDM>> addProductToCart(String id) async {
    if (await connectivity.isInternetConnected) {
      return ds.addProductToCart(id);
    } else {
      return Left(Failure(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<Failure, CartDM>> getLoggedUserCart() async {
    if (await connectivity.isInternetConnected) {
      return ds.getLoggedUserCart();
    } else {
      return Left(Failure(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<Failure, CartDM>> removeProductFromCart(String id) async {
    if (await connectivity.isInternetConnected) {
      return ds.removeProductFromCart(id);
    } else {
      return Left(Failure(Constants.internetErrorMessage));
    }
  }
}