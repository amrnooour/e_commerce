import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/response/cart_dm.dart';
import 'package:e_commerce/domain/repos/main_repo/main_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLoggedUserCartUseCase {
  MainRepo repo;

  GetLoggedUserCartUseCase(this.repo);

  Future<Either<Failure, CartDM>> execute() {
    return repo.getLoggedUserCart();
  }
}