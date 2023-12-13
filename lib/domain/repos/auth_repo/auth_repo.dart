import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/request/RegesterRequestBody.dart';

abstract class AuthRepo{
  Future<Either<Failure,bool>> login(String email,String Password);
  Future<Either<Failure,bool>> Register(RegesterRequestBody body);
}