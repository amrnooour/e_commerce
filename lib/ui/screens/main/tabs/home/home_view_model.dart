import 'package:e_commerce/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce/ui/utils/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllProductsUseCase getAllProductsUseCase;

  HomeViewModel(this.getAllCategoriesUseCase, this.getAllProductsUseCase)
      : super(BaseRequestInitialState());

  loadCategories() {
    getAllCategoriesUseCase.execute();
  }

  loadProducts() {
    getAllProductsUseCase.execute();
  }
}