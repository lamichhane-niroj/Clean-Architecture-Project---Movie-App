import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/auth/repositories/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class IsSignedInUseCase implements Usecase<bool, dynamic> {
  @override
  Future<bool> call(params) {
    return sl<AuthRepository>().isSignedIn();
  }
}
