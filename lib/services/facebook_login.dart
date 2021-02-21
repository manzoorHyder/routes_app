import 'dart:convert';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:routes_app/services/constants.dart';

void fblogin() async {
  Constants.registered = false;
  final facebookLogin = FacebookLogin();
  final facebookLoginResult = await facebookLogin.logInWithReadPermissions(['email']);

  if (await facebookLogin.isLoggedIn) {
    Constants.registered = true;
  }

  final token = facebookLoginResult.accessToken.token;

  final graphResponse = await http.get(
      'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');
  final profile = json.decode(graphResponse.body);
  print(profile);
  Constants.name = profile['name'];
  Constants.email = profile['email'];
  Constants.id = int.parse(profile['id']);
  Constants.first_name = profile['first_name'];
  Constants.last_name = profile['last_name'];

}