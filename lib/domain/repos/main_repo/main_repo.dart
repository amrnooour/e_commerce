import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/response/cart_dm.dart';
import 'package:e_commerce/data/model/response/categories_dm.dart';
import 'package:e_commerce/data/model/response/product_dm.dart';

abstract class MainRepo {
  Future<Either<Failure, List<CategoryDM>>> getCategories();

  Future<Either<Failure, List<ProductDM>>> getProducts();

  Future<Either<Failure, CartDM>> getLoggedUserCart();

  Future<Either<Failure, CartDM>> addProductToCart(String id);

  Future<Either<Failure, CartDM>> removeProductFromCart(String id);
}