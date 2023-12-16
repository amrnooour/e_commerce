import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/domain/repos/auth_repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase{
  AuthRepo repo;
  LoginUseCase(this.repo);
  String email ="";
  String password ="";
  Future<Either<Failure,bool>> execute(){
    return repo.login(email,password);
  }
}