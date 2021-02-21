import 'package:flutter/material.dart';
import 'package:routes_app/project_theme.dart';
import 'package:routes_app/services/constants.dart';
import 'package:routes_app/services/googleLogin.dart';
import 'package:routes_app/services/signUpApi.dart';
import 'package:routes_app/view/forgotPassword/forgotPasswordScreen.dart';
import 'package:routes_app/view/homePage/HomePageScreen.dart';
import 'package:routes_app/view/signUp/SignUpScreen.dart';
import 'package:routes_app/services/facebook_login.dart';
import 'package:routes_app/widgets/cricularIndicator.dart';
import 'package:routes_app/widgets/customToast.dart';
import 'package:routes_app/widgets/helper.dart';
import 'package:routes_app/services/signInApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool visibility = true;
  bool isLoggingIn = false;
  SignUp signup = SignUp();
  SignIn signIn = SignIn();

  void initState() async {
    super.initState();

    final prefs = await SharedPreferences.getInstance();
    final prefsIsLogin = prefs.getBool('loggedIn');

      if (prefsIsLogin) {
        _SignIn(context);
      }


  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ProjectTheme.projectBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 35, right: 35, top: _height * 0.17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTopContent(_width, _height),
              buildForm(_width, _height),
              buildButton(context, _height, _width),
              buildSocialLogin(_height, _width),
              buildBottomButtons(context, _height, _width)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopContent(double _width, double _height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * 0.23),
          child: Text(
            'Company Name',
            style: TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: _height * 0.05,
        ),
        Text(
          'Sign In',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: _height * 0.015,
        ),
        Text(
          'Hi there Nice to see you again.',
          style: TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: _height * 0.035,
        )
      ],
    );
  }

  Widget buildForm(double _width, double _height) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: TextStyle(color: ProjectTheme.projectPrimaryColor),
          ),
          TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty) return '';
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Example@email.com',
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),

                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF4DD942),
                  ),
                ),
                fillColor: Colors.red[900],
                // hintText: 'Username',
                // contentPadding: EdgeInsets.only(top: 20),
              )),
          SizedBox(
            height: 18,
          ),
          Text(
            'Password',
            style: TextStyle(color: ProjectTheme.projectPrimaryColor),
          ),
          TextFormField(
            style: TextStyle(letterSpacing: 5),
            obscureText: visibility,
            controller: _passwordController,
            validator: (value) {
              if (value.isEmpty) return '';
              return null;
            },
            decoration: InputDecoration(
              hintText: '••••••••',
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF4DD942),
                ),
              ),
              fillColor: Colors.red[900],
              // hintText: 'Password',

              suffixIcon: IconButton(
                icon: visibility
                    ? Icon(
                        Icons.visibility,
                        color: Colors.grey,
                      )
                    : Icon(
                        Icons.visibility,
                        color: Colors.black,
                      ),
                onPressed: visibilePassword,
              ),
            ),
          ),
          SizedBox(
            height: _height * 0.035,
          )
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context, double _height, double _width) {
    return Column(
      children: [
        Container(
          height: _height * 0.07,
          width: _width,
          child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  CustomCircularLoader(context);
                  bool result = await signIn.signIn(
                    email: _emailController.text.trim(),
                    id: 0,
                    pwd: _passwordController.text.trim(),
                  );
                  print(result);
                  if (result) {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('loggedIn', true);
                    await prefs.setString(
                        'email', _emailController.text.trim());
                    await prefs.setString(
                        'pwd', _passwordController.text.trim());
                    await prefs.setInt('id', 0);

                    Navigator.pop(context);
                    setState(() {
                      _emailController.clear();
                      _passwordController.clear();
                      // Navigator.pushNamed(context, HomePageScreen.routeName);
                    });
                  } else {
                    Navigator.pop(context);
                    customToast(text: 'Login failed');
                  }
                }
              },
              color: ProjectTheme.projectPrimaryColor,
              child: const Text('Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700))),
        ),
        SizedBox(
          height: _height * 0.03,
        )
      ],
    );
  }

  Widget buildSocialLogin(double _height, double _width) {
    TextStyle style = TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);
    return Column(
      children: [
        Text(
          'or use on of your social profiles',
          style: TextStyle(
              color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: _height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF3B5998),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              height: _height * 0.06,
              width: _width * .38,
              child: FlatButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                label: Text(
                  'Google',
                  style: style.copyWith(color: Color(0xFF3B5998)),
                ),
                icon: ImageIcon(
                  AssetImage(
                    'assets/g.png',
                  ),
                  color: Color(0xFF3B5998),
                ),
                color: Colors.white,
                onPressed: () async {
                  await googlelogin();
                  print(Constants.name);
                  CustomCircularLoader(context);
                  print('++++++++++++++++++++++++++++ ${Constants.id}');

                  if (Constants.registered == true) {
                    bool result = await signIn.signIn(
                        email: '', id: Constants.id, pwd: '');
                    print(result);
                    if (result) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('loggedIn', true);
                      await prefs.setString('email', '');
                      await prefs.setString('pwd', '');
                      await prefs.setInt('id', Constants.id);
                    } else {
                      customToast(text: 'Login failed');
                    }
                  } else {
                    bool result = await signup.google(
                      systype: 'google',
                      email: Constants.email.trim(),
                      name: Constants.name.trim(),
                      id: Constants.id,
                      termsdt: Helper.getDate(DateTime.now()),
                    );
                    print(result);

                    if (result) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('loggedIn', true);
                      await prefs.setString('email', '');
                      await prefs.setString('pwd', '');
                      await prefs.setInt('id', Constants.id);
                    } else {
                      customToast(text: 'Sorry couldn\'t register');
                    }
                  }

                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              height: _height * 0.06,
              width: _width * .38,
              child: FlatButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                label: Text(
                  'Facebook',
                  style: style,
                ),
                icon: ImageIcon(
                  AssetImage(
                    'assets/fb.png',
                  ),
                  color: Colors.white,
                ),
                color: Color(0xFF3B5998),
                onPressed: () async {
                  await fblogin();
                  CustomCircularLoader(context);
                  if (Constants.registered == true) {
                    bool result = await signIn.signIn(
                        email: '', id: Constants.id, pwd: '');
                    print(result);
                    if (result) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('loggedIn', true);
                      await prefs.setString('email', '');
                      await prefs.setString('pwd', '');
                      await prefs.setInt('id', Constants.id);
                    } else {
                      customToast(text: 'Login failed');
                    }
                  } else {
                    bool result = await signup.fbSignUp(
                      systype: 'facebook',
                      email: Constants.email,
                      name: Constants.name,
                      first_name: Constants.first_name,
                      last_name: Constants.last_name,
                      id: Constants.id,
                      termsdt: Helper.getDate(DateTime.now()),
                    );
                    print(result);

                    if (result) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('loggedIn', true);
                      await prefs.setString('email', '');
                      await prefs.setString('pwd', '');
                      await prefs.setInt('id', Constants.id);
                    } else {
                      customToast(text: 'Sorry couldn\'t register');
                    }
                  }
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: _height * 0.035,
        )
      ],
    );
  }

  Widget buildBottomButtons(
      BuildContext context, double _height, double _width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: Text(
            'Forgot Password?',
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onTap: () {
            Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
          },
        ),
        InkWell(
          child: Text(
            'Sign Up',
            style: TextStyle(
                color: ProjectTheme.projectPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          onTap: () {
            Navigator.pushNamed(context, SignUpScreen.routeName);
          },
        )
      ],
    );
  }

  visibilePassword() {
    setState(() {
      if (visibility)
        visibility = false;
      else
        visibility = true;
    });
  }


  void _SignIn(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    final prefsEmail = prefs.getString('email');
    final prefsPass = prefs.getString('pwd');
    final prefsId = prefs.getInt('id');
    try {
      bool result = await signIn.signIn(email: prefsEmail,pwd: prefsPass,id: prefsId);

      if(result) {
        // Navigator.pushNamed(context, HomePageScreen.routeName);
      }

        // Navigator.pushNamedAndRemoveUntil(
        //     context, BottomNavigation.routeName, (route) => false);
    } catch (e) {
      customToast(text: e.toString());
    }
  }

}
