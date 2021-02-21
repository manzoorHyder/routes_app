import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:routes_app/view/followMe/FollowMeScreen.dart';
import 'package:routes_app/view/myPOI/MyPOIScreen.dart';
import 'package:routes_app/view/profile/profileScreen.dart';
import 'package:routes_app/view/signInScreen/signInScreen.dart';
import 'dart:async';

import '../../project_theme.dart';

class HomePageScreen extends StatefulWidget {
    static const routeName = '/home-page';
    @override
    _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
    LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
    GoogleMapController _controller;
    Location _location = Location();

    void _onMapCreated(GoogleMapController _cntlr) {
        _controller = _cntlr;
        _location.onLocationChanged.listen((l) {
            _controller.animateCamera(
                CameraUpdate.newCameraPosition(
                    CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
                ),
            );
        });
    }

    @override
    Widget build(BuildContext context) {
        var _height = MediaQuery.of(context).size.height;
        var _width = MediaQuery.of(context).size.width;
        return Scaffold(
            backgroundColor: ProjectTheme.projectBackgroundColor,
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black)),
            drawer: buildDrawer(_height, _width),
            body: GoogleMap(
                initialCameraPosition: CameraPosition(target: _initialcameraposition),
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
            ),
        );
    }

    Widget buildDrawer(double _height, double _width) {
        return Drawer(
            child: Padding(
                padding: const EdgeInsets.only(top: 130.0),
                child: Column(
                    children: [
                        InkWell(
                            child: buildUserDetail(_height, _width),
                            onTap: () {
                                Navigator.pushNamed(context, ProfileScreen.routeName);
                            },
                        ),
                        buildButton(_height, _width)
                    ],
                ),
            ),
        );
    }

    Widget buildUserDetail(double _height, double _width) {
        return Column(
            children: [
                CircleAvatar(
                    child: Icon(Icons.person),
                ),
                SizedBox(
                    height: _height * 0.015,
                ),
                Text(
                    'Johanna Doe',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                    'johanna@company.com',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(
                    height: _height * 0.07,
                )
            ],
        );
    }

    Widget buildButton(double _height, double _width) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                buildListtile(
                    iconLeading: Icons.home,
                    iconTrailing: Icons.keyboard_arrow_right,
                    title: 'Home',
                    onTap: () {
                        Navigator.pop(context);
                    }),

                buildListtile(
                    iconLeading: Icons.settings,
                    iconTrailing: Icons.keyboard_arrow_right,
                    title: 'Follow Me',
                    onTap: () {
                        Navigator.pushNamed(context, FollowMeScreen.routeName);
                    }),
                buildListtile(
                    iconLeading: Icons.my_location,
                    iconTrailing: Icons.keyboard_arrow_right,
                    title: 'My POI',
                    onTap: () {
                        Navigator.pushNamed(context, MyPOIScreen.routeName);
                    }),

                SizedBox(height: _height * 0.03,),
                buildListtile(
                    iconLeading: Icons.logout,
                    iconTrailing: Icons.keyboard_arrow_left,
                    title: 'Sign Out',
                    onTap: () {
                        Navigator.pushNamed(context, '/');
                    }),

            ],
        );
    }

    Widget buildListtile(
        {IconData iconLeading, IconData iconTrailing, String title, var onTap}) {
        return ListTile(
            contentPadding: EdgeInsets.only(right: 30, left: 15),
            leading: Icon(
                iconLeading,
                color: Colors.grey.withOpacity(.5),
                size: 22,
            ),
            title: Text(
                title,
                style: TextStyle(fontSize: 16),
            ),
            trailing: Icon(
                iconTrailing,
                color: Colors.grey.withOpacity(.5),
                size: 22,
            ),
            onTap: onTap);
    }
}
