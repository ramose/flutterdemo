import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/auth/bloc/auth_bloc_bloc.dart';
import 'package:flutterdemo/auth/view/auth_screen.dart';
import 'package:flutterdemo/core/locator/locator.dart';

void main() {
  setupLocator();
  runApp(const InitApp());
}

class InitApp extends StatelessWidget {
  const InitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthBlocBloc>(create: (context) => AuthBlocBloc())
    ], child: const MainApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const AuthScreen(),
    );
  }
}
