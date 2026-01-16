import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/presentation/splash/bloc/splash_cubit.dart';
import 'package:spotify_clone/presentation/splash/pages/splash.dart';
import 'package:spotify_clone/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage()),
    );
  }
}
