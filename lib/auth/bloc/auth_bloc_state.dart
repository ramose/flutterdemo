part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocState {}

final class AuthBlocInitial extends AuthBlocState {}

class AuthBlocLoggedIn extends AuthBlocState {
  final String ? name;
  final String ? email;

  AuthBlocLoggedIn(this.name, this.email);
}

class AuthBlocLoggedOut extends AuthBlocState {}

class AuthBlocLoggedFailed extends AuthBlocState {}
