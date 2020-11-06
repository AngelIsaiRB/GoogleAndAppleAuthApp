import 'package:google_sign_in/google_sign_in.dart';

class GoogleSingService {
  
  static GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',

  ],
);
static Future<GoogleSignInAccount> singInWhitGoogle() async {
  try {
  final GoogleSignInAccount account = await _googleSignIn.signIn();
  print(account);
  final googleKey = await account.authentication;
  print("-----------------id token------------------");
  print(googleKey.idToken);
  return account;
  } catch (e) {
    print(e);
    print("error en gogle sing in");
    return null;
  }
}

static Future singOut()async {
  await _googleSignIn.signOut();
}
}