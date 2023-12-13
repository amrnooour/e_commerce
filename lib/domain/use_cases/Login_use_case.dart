import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/domain/repos/auth_repo/auth_repo.dart';


class LoginUseCase{
  AuthRepo repo;
  LoginUseCase(this.repo);
  Future<Either<Failure,bool>> execute(String email,String password){
    return repo.login(email,password);
  }
}