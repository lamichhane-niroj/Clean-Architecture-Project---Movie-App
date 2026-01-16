import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spotify_clone/core/constants/api_url.dart';
import 'package:spotify_clone/core/network/dio_client.dart';
import 'package:spotify_clone/data/auth/models/signin_req_params.dart';
import 'package:spotify_clone/data/auth/models/signup_req_params.dart';
import 'package:spotify_clone/service_locator.dart';

abstract class AuthService {
  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
}

class AuthServiceImpl implements AuthService {
  @override
  Future<Either> signup(SignupReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: jsonEncode(params.toJson()),
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signin,
        data: jsonEncode(params.toJson()),
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "An error occurred");
    }
  }
}
