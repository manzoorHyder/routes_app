import 'package:flutter/material.dart';
import 'package:routes_app/view/homePage/HomePageScreen.dart';
import 'package:routes_app/widgets/customButton.dart';

import '../../project_theme.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign-up';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool visibility = true;
  bool isLoggingIn = false;
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ProjectTheme.projectBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 35, right: 35, top: _height * 0.13),
          child: Column(
            children: [
              buildForm(_width, _height),
              buildButtons(_width, _height)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildForm(double _width, double _height) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign Up',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: _height * 0.035,
          ),
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
            height: _height * 0.02,
          ),
          CheckboxListTile(
              title: Text(
                'I agree to the Terms of Services and Privacy Policy.',
                style: TextStyle(fontSize: 14),
              ),
              activeColor: ProjectTheme.projectPrimaryColor,
              value: checkedValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkedValue = newValue;
                });
              },
              controlAffinity: ListTileControlAffinity.leading),
          SizedBox(
            height: _height * 0.035,
          )
        ],
      ),
    );
  }

  Widget buildButtons(double _width, double _height) {
    return Column(
      children: [
        CustomRoundedButton(
          buttontitle: 'Continue',
          onPressed: () {
            if (_formKey.currentState.validate()) {
              if (checkedValue == true) {
                setState(() {
                  isLoggingIn = true;
                  Navigator.pushNamed(context, HomePageScreen.routeName);
                });
              }
            }
          },
        ),
        SizedBox(
          height: _height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Have an Account?  ',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            InkWell(
              child: Text(
                'Sign In',
                style: TextStyle(
                    color: ProjectTheme.projectPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            )
          ],
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
}
