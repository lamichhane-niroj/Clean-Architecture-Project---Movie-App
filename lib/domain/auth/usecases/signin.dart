import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/auth/models/signin_req_params.dart';
import 'package:spotify_clone/domain/auth/repositories/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class SigninUseCase implements Usecase<Either, SigninReqParams> {
  
  @override
  Future<Either> call(SigninReqParams params) {
    return sl<AuthRepository>().signin(params);
  }
}
