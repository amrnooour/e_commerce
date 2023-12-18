import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/response/product_dm.dart';
import 'package:e_commerce/domain/repos/main_repo/main_repo.dart';
import 'package:e_commerce/ui/utils/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase extends Cubit {
  MainRepo repo;

  GetAllProductsUseCase(this.repo) : super(BaseRequestInitialState());

  void execute() async {
    Either<Failure, List<ProductDM>> either = await repo.getProducts();
    either.fold((failure) => emit(BaseRequestErrorState(failure.errorMessage)),
            (list) => emit(BaseRequestSuccessState<List<ProductDM>>(data: list)));
  }
}