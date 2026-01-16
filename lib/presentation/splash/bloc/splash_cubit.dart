import 'package:spotify_clone/domain/auth/usecases/is_signed_in.dart';
import 'package:spotify_clone/presentation/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    Future.delayed(Duration(seconds: 2));
    var isLoggedIn = await sl<IsSignedInUseCase>().call(null);

    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }
}
