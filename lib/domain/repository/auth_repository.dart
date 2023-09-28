import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutterdemo/domain/entity/auth.dart';

// --- could be put on separate file?
const appScheme = 'flutterdemo';
Auth0 auth0 = Auth0('ramose.auth0.com', 'gX1XSuX9OGwcxxrxTpFKtQ38a3LkAchR');
//

class AuthRepository implements Auth {
  @override
  Future<Credentials> logging() async {
    final Credentials credentials =
        await auth0.webAuthentication(scheme: appScheme).login();
    return credentials;
  }
}
