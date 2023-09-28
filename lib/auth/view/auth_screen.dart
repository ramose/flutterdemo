import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/auth/bloc/auth_bloc_bloc.dart';
import 'package:flutterdemo/home/view/home.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Credentials? _credentials;

  late Auth0 auth0;

  String appScheme = 'flutterdemo';

  @override
  void initState() {
    super.initState();

    auth0 = Auth0('ramose.auth0.com', 'gX1XSuX9OGwcxxrxTpFKtQ38a3LkAchR');
    // errorMessage = '';
  }

  Future<void> loggingEvent() async {
    try {
      final Credentials credentials =
          await auth0.webAuthentication(scheme: appScheme).login();

      _credentials = credentials;

      print(_credentials?.user.email);

      // setState(() {
      //   isBusy = false;
      //   _credentials = credentials;
      // });
    } on Exception catch (e, s) {
      debugPrint('login error: $e - stack: $s');

      // setState(() {
      //   isBusy = false;
      //   errorMessage = e.toString();
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBlocBloc, AuthBlocState>(
      listener: (context, state) {
        if(state is AuthBlocLoggedIn){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      },
      child: BlocBuilder<AuthBlocBloc, AuthBlocState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('Login')),
            body: Center(
              child: ElevatedButton(
                child: Text('Login'),
                onPressed: () =>
                    context.read<AuthBlocBloc>().add(AuthBlocLogging()),
              ),
              // child: ElevatedButton(
              //     child: Text('Login'), onPressed: () => loggingEvent()),
            ),
          );
        },
      ),
    );
  }
}
