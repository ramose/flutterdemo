import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterdemo/core/locator/locator.dart';
import 'package:flutterdemo/domain/entity/auth.dart';
import 'package:flutterdemo/domain/repository/auth_repository.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

Credentials? _credentials;
// late Auth0 auth0;
// const appScheme = 'flutterdemo';
// Auth0 auth0 = Auth0('ramose.auth0.com', 'gX1XSuX9OGwcxxrxTpFKtQ38a3LkAchR');

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBlocBloc() : super(AuthBlocInitial()) {
    on<AuthBlocLogging>((event, emit) async {
      if (kDebugMode) {
        print('logging');
      }

      try {
        _credentials = await sl<Auth>().logging();
        emit(AuthBlocLoggedIn(
            _credentials?.user.name, _credentials?.user.email));
      } on Exception catch (e, s) {
        emit(AuthBlocLoggedFailed());
      }
    });
  }
}

// Future<Credentials> loggingEvent() async {
//   final Credentials credentials =
//       await auth0.webAuthentication(scheme: appScheme).login();
//   return credentials;
// }
