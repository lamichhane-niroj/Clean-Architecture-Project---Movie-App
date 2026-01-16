import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/auth/models/signup_req_params.dart';
import 'package:spotify_clone/domain/auth/repositories/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class SignupUseCase implements Usecase<Either, SignupReqParams> {

  @override
  Future<Either> call(SignupReqParams params) {
    return sl<AuthRepository>().signup(params);
  }
}
