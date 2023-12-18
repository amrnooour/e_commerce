import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/response/categories_dm.dart';
import 'package:e_commerce/domain/repos/main_repo/main_repo.dart';
import 'package:e_commerce/ui/utils/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase extends Cubit {
  MainRepo repo;

  GetAllCategoriesUseCase(this.repo) : super(BaseRequestInitialState());

  void execute() async {
    Either<Failure, List<CategoryDM>> either = await repo.getCategories();
    either.fold((failure) => emit(BaseRequestErrorState(failure.errorMessage)),
            (list) => emit(BaseRequestSuccessState<List<CategoryDM>>(data: list)));
  }
}