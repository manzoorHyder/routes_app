import 'package:dropdown_date_picker/dropdown_date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:routes_app/listofYear.dart';
import 'package:routes_app/widgets/customButton.dart';

import '../../project_theme.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fName = TextEditingController();
  final TextEditingController _lName = TextEditingController();
  final TextEditingController bDate = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _CpasswordController = TextEditingController();
  final TextStyle style = TextStyle(
      color: ProjectTheme.projectPrimaryColor, fontWeight: FontWeight.w600);
  final now = DateTime.now();
  bool visibility = true;
  bool isLoggingIn = false;

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ProjectTheme.projectBackgroundColor,
      appBar: buildAppbar(),
      body: Padding(
        padding: EdgeInsets.only(left: 35, right: 35, top: _height * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildEmail(),
              buildUserDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.clear),
        color: ProjectTheme.projectPrimaryColor,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: style,
        ),
        TextFormField(
            controller: _emailController,
            readOnly: true,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(.4)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(.4)),
                ),
                hintText: 'example@email.com',
                hintStyle: TextStyle(fontWeight: FontWeight.w500))),
        SizedBox(
          height: 30,
        )
      ],
    );
  }

  Widget buildUserDetails() {
    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        buildUser(controller: _fName, title: 'First Name'),
        buildUser(controller: _lName, title: 'Last Name'),
        Text(
          'Date of Birth',
          style: style,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 100,
              height: 37,
              child: OutlineDropdownButton(
                iconSize: 25,
                hint: Text('Year'),
                items: <String>[
                  (now.year).toString()
                ].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 100,
              height: 37,
              child: OutlineDropdownButton(
                iconSize: 25,
                hint: Text('Month'),
                items: <String>[
                  'Month',
                ].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 100,
              height: 37,
              child: OutlineDropdownButton(
                iconSize: 25,
                hint: Text('Day'),
                items: <String>[
                  'Day',
                ].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ],
        ),

        // DropdownDatePicker(
        //   firstDate: ValidDate(year: now.year - 100, month: 1, day: 1),
        //   lastDate: ValidDate(year: now.year, month: now.month, day: now.month),
        // ),
        SizedBox(
          height: 20,
        ),
        CustomRoundedButton(
          buttontitle: 'Save',
          onPressed: () {},
        ),
        buildPassword(),
        SizedBox(
          height: 20,
        ),
        buildButton()
      ]),
    );
  }

  Widget buildDropDown() {
    SizedBox(
      width: 100,
      height: 37,
      child: OutlineDropdownButton(
        iconSize: 25,
        hint: Text('List of miles out'),
        items: <String>[
          'List of miles out',
        ].map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }

  Widget buildUser({
    TextEditingController controller,
    String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: style,
        ),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value.isEmpty) return '';
            return null;
          },
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 25,
        ),
        Text(
          'Password',
          style: style,
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
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),

            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            // fillColor: Colors.red[900],
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
        Text(
          'Verify Password',
          style: style,
        ),
        TextFormField(
          style: TextStyle(letterSpacing: 5),
          obscureText: visibility,
          controller: _CpasswordController,
          validator: (value) {
            if (value.isEmpty) return '';
            return null;
          },
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),

            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            // fillColor: Colors.red[900],
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
      ],
    );
  }

  Widget buildButton() {
    return CustomRoundedButton(
        buttontitle: 'Update Password', onPressed: () {});
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
