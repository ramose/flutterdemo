import 'package:flutterdemo/domain/entity/auth.dart';
import 'package:flutterdemo/domain/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupLocator() {
  sl.registerFactory<Auth>(() => AuthRepository());
}
