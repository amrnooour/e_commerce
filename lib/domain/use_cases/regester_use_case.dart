import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/request/RegesterRequestBody.dart';
import 'package:e_commerce/domain/repos/auth_repo/auth_repo.dart';

class RegisterUseCase{
  AuthRepo repo;
  RegisterUseCase(this.repo);
  Future<Either<Failure,bool>> execute(RegesterRequestBody body){
    return repo.Register(body);
  }
}