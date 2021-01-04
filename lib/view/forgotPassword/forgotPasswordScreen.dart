import 'package:flutter/material.dart';
import 'package:routes_app/widgets/customButton.dart';

import '../../project_theme.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/forgot-password';
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ProjectTheme.projectBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.clear),color: ProjectTheme.projectPrimaryColor,
          onPressed: () {
            Navigator.pop(context);
            },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 35, right: 35, top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          buildForm(context, _height, _width),
            buildButton()

        ],),
      ),

    );
  }

  Widget buildForm(BuildContext context, double _height, double _width){
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
            ),),

          SizedBox(height: _height * 0.07,)

      ],),
    );
  }

  Widget buildButton (){
    return CustomRoundedButton(buttontitle: 'Reset Password', onPressed: (){
      Navigator.pop(context);
    });
  }
}
