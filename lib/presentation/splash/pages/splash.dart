import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helper/app_navigation/app_navigation.dart';
import 'package:spotify_clone/presentation/auth/pages/signin.dart';
import 'package:spotify_clone/presentation/home/pages/home.dart';
import 'package:spotify_clone/presentation/splash/bloc/splash_cubit.dart';
import 'package:spotify_clone/presentation/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            AppNavigation.pushReplacement(context, SigninPage());
          }

          if (state is Authenticated) {
            AppNavigation.pushReplacement(context, HomePage());
          }
        },
        child: Center(child: Icon(Icons.star, size: 50)),
      ),
    );
  }
}
