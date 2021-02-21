import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:routes_app/view/Edit/EditScreen.dart';
import 'package:routes_app/view/followMe/FollowMeScreen.dart';
import 'package:routes_app/widgets/customButton.dart';

import '../../project_theme.dart';

class MyPOIScreen extends StatefulWidget {
  static const routeName = '/POI';
  @override
  _MyPOIScreenState createState() => _MyPOIScreenState();
}

class _MyPOIScreenState extends State<MyPOIScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectTheme.projectBackgroundColor,
      appBar: buildAppbar(),
      body: Padding(
        padding: EdgeInsets.only(
          left: 35,
          right: 35,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRoundedButton(
                buttontitle: 'Add New POI',
                onPressed: () {
                  Navigator.pushNamed(context, EditScreen.routeName);
                }),
            buildYourPOI()
          ],
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

  Widget buildYourPOI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Text('Email',
            style: TextStyle(
                color: ProjectTheme.projectPrimaryColor,
                fontWeight: FontWeight.w600)),
        SizedBox(
          height: 20,
        ),
        buildDetials(),
        buildDetials(),
        buildDetials()
      ],
    );
  }

  Widget buildDetials() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 16),
                )),
            Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.pushNamed(context, FollowMeScreen.routeName);
                  },
                )),
            Expanded(
                flex: 1,
                child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.pushNamed(context, EditScreen.routeName);
                    })),
            Expanded(
                flex: 1,
                child: IconButton(
                    icon: Icon(Icons.delete_forever_sharp),
                    onPressed: () {
                      ConfirmAlertBox(
                          icon: Icons.delete_forever_sharp,
                          title: 'Delete POI',
                          buttonColorForNo: ProjectTheme.projectPrimaryColor,
                          infoMessage: 'Are you sure?',
                          context: context,
                          onPressedYes: () {
                            Navigator.pop(context);
                          });
                    })),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
