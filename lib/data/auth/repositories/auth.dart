import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_clone/data/auth/data_sources/auth_service.dart';
import 'package:spotify_clone/data/auth/models/signin_req_params.dart';
import 'package:spotify_clone/data/auth/models/signup_req_params.dart';
import 'package:spotify_clone/domain/auth/repositories/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> signup(SignupReqParams params) async {
    var data = await sl<AuthService>().signup(params);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setString("token", data["user"]["token"]);
        return Right(data);
      },
    );
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    var data = await sl<AuthService>().signin(params);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setString("token", data["user"]["token"]);
        return Right(data);
      },
    );
  }

  @override
  Future<bool> isSignedIn() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.containsKey("token");
  }
}
