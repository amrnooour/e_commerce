import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/response/cart_dm.dart';
import 'package:e_commerce/data/model/response/cart_product.dart';
import 'package:e_commerce/data/model/response/product_dm.dart';
import 'package:e_commerce/domain/use_cases/add_product_to_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_logged_user_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/remove_product_from_cart_use_case.dart';
import 'package:e_commerce/ui/utils/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit {
  GetLoggedUserCartUseCase getLoggedUserCartUseCase;
  AddProductToCartUseCase addProductToCartUseCase;
  RemoveProductFromCartUseCase removeProductFromCartUseCase;
  CartDM? cartDm;

  CartViewModel(this.addProductToCartUseCase, this.removeProductFromCartUseCase,
      this.getLoggedUserCartUseCase)
      : super(BaseRequestInitialState());

  void addProductToCart(String productId) async {
    Either<Failure, CartDM> either =
    await addProductToCartUseCase.execute(productId);
    either.fold((failure) {
      emit(BaseRequestErrorState(failure.errorMessage));
    }, (cart) {
      cartDm = cart;
      emit(BaseRequestSuccessState());
    });
  }

  void removeProductFromCart(String productId) async {
    Either<Failure, CartDM> either =
    await removeProductFromCartUseCase.execute(productId);
    either.fold((failure) {
      emit(BaseRequestErrorState(failure.errorMessage));
    }, (cart) {
      cartDm = cart;
      emit(BaseRequestSuccessState());
    });
  }

  void loadCart() async {
    Either<Failure, CartDM> either = await getLoggedUserCartUseCase.execute();
    either.fold((failure) {
      emit(BaseRequestErrorState(failure.errorMessage));
    }, (cart) {
      cartDm = cart;
      emit(BaseRequestSuccessState());
    });
  }

  CartProduct? isInCart(ProductDM productDM) {
    if (cartDm != null && cartDm!.products != null) {
      var productsInCart = cartDm!.products!;
      for (int i = 0; i < productsInCart.length; i++) {
        if (productDM.id == productsInCart[i].product?.id) {
          return productsInCart[i];
        }
      }
    }
    return null;
  }
}