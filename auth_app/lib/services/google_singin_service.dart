import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleSingService {
  
  static GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',

  ],
);
static Future<GoogleSignInAccount> singInWhitGoogle() async {
  try {
  final GoogleSignInAccount account = await _googleSignIn.signIn();
  final googleKey = await account.authentication;

  // print(account);
  // print("-----------------id token------------------");
  // print(googleKey.idToken);

  final singinWithGoogleEndpoint = Uri(
    scheme: "https",
    host: "localhost:3000",
    path: "/google"
  );

  final session =  await http.post(
    singinWithGoogleEndpoint,
    body: {
      "token":googleKey.idToken
    }
  );

  print("------------backend---------------");
  print(session.body);


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