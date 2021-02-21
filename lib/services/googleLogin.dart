import 'package:google_sign_in/google_sign_in.dart';
import 'package:routes_app/services/constants.dart';
import 'package:routes_app/widgets/helper.dart';

void googlelogin() async {
  Constants.registered = false;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  if (await _googleSignIn.isSignedIn()) {
    Constants.registered = true;
  }

  await _googleSignIn.signIn().then((GoogleSignInAccount acc) async {
    GoogleSignInAuthentication auth = await acc.authentication;
    Constants.name = acc.displayName;
    Constants.id = int.parse(acc.id.toString().substring(0, 8));
    Constants.email = acc.email;

    print('email : ${acc.email}, id : ${acc.id}, name : ${acc.displayName}');

    acc.authentication.then((GoogleSignInAuthentication auth) async {
      // print(auth.idToken);
      // print(auth.accessToken);
    });
  });
}
