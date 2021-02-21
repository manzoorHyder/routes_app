import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:routes_app/services/constants.dart';

class SignIn {
  String url =
      'https://asia-south1-a-new-bi-1474057880268.cloudfunctions.net/oifom-signin';
  Future<bool> signIn({
    String email,
    int id,
    String pwd,
  }) async {
    try {
      final http.Response response = await http.post(url,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.acceptHeader: "application/json"
          },
          body: json.encode(<String, dynamic>{
            "email": email,
            "userid": id,
            "pwd": pwd,
          }));
      print(response.body);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body) == null) {
          return false;
        } else {
          return true;
        }
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

}
