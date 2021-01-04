import 'package:flutter/material.dart';
import 'package:routes_app/project_theme.dart';
import 'package:routes_app/view/Edit/EditScreen.dart';
import 'package:routes_app/view/followMe/FollowMeScreen.dart';
import 'package:routes_app/view/forgotPassword/forgotPasswordScreen.dart';
import 'package:routes_app/view/homePage/HomePageScreen.dart';
import 'package:routes_app/view/myPOI/MyPOIScreen.dart';
import 'package:routes_app/view/profile/profileScreen.dart';
import 'file:///D:/Projects/routes_app/lib/view/signInScreen/signInScreen.dart';
import 'package:routes_app/view/signUp/SignUpScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor: ProjectTheme.projectBackgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (ctx) => SignInScreen(),
        SignUpScreen.routeName: (ctx) => SignUpScreen(),
        ForgotPasswordScreen.routeName: (ctx) => ForgotPasswordScreen(),
        HomePageScreen.routeName: (ctx) => HomePageScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
        FollowMeScreen.routeName: (ctx) => FollowMeScreen(),
        MyPOIScreen.routeName: (ctx) => MyPOIScreen(),
        EditScreen.routeName: (ctx) => EditScreen()
      },

    );
  }
}

