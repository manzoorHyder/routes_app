import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:routes_app/services/constants.dart';

class SignUp {
  String url =
      'https://asia-south1-a-new-bi-1474057880268.cloudfunctions.net/oifom-signup-1';
  Future<bool> fbSignUp({
    String systype,
    String name,
    String first_name,
    String last_name,
    String email,
    int id,
    String termsdt,
  }) async {
    try {
      final http.Response response = await http.post(url,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.acceptHeader: "application/json"
          },
          body: json.encode(<String, dynamic>{
            "systype": systype,
            "name": name,
            "first_name": first_name,
            "last_name": last_name,
            "email": email,
            "id": id,
            "termsdt": termsdt,
          }));
      print(response.body);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == 0) {
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

  Future<bool> self(
      {String systype,
      String name,
      String first_name,
      String last_name,
      String email,
      int id,
      String termsdt,
      String pwd,
      String birthdate}) async {
    try {
      final http.Response response = await http.post(url,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.acceptHeader: "application/json"
          },
          body: json.encode(<String, dynamic>{
            "systype": systype,
            "name": name,
            "first_name": first_name,
            "last_name": last_name,
            "email": email,
            "id": id,
            "termsdt": termsdt,
            "pwd": pwd,
            "birthdate": birthdate
          }));
      print(response.body);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == 0) {
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

  Future<bool> google({
    String systype,
    String name,
    String email,
    int id,
    String termsdt,
  }) async {
    try {
      final http.Response response = await http.post(url,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.acceptHeader: "application/json"
          },
          body: json.encode(<String, dynamic>{
            "systype": systype,
            "name": name,
            "email": email,
            "id": id,
            "termsdt": termsdt,
            // "pwd" : pwd,
            // "birthdate": birthdate
          }));
      print(response.body);
      if (response.statusCode == 200) {
        // if (jsonDecode(response.body)['err'] ==
        //     'Email address already in use.  Please use forgotten password to login. In create-user-function @@ create-user-function') {
        //   Constants.registered = true;
        //   print('--------------${Constants.registered}');
        // }

        if (jsonDecode(response.body)['status'] == 0) {
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
