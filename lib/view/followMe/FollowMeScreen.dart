import 'package:checkbox_list_tile_more_customizable/checkbox_list_tile_more_customizable.dart';
import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';
import 'package:routes_app/widgets/customButton.dart';

import '../../project_theme.dart';

class FollowMeScreen extends StatefulWidget {
  static const routeName = '/follow-me';
  @override
  _FollowMeScreenState createState() => _FollowMeScreenState();
}

class _FollowMeScreenState extends State<FollowMeScreen> {
  final TextStyle style = TextStyle(
      color: ProjectTheme.projectPrimaryColor, fontWeight: FontWeight.w600);
  double _value = 30;
  double _value1 = 80;
  bool checkedValue = false;
  bool checkedValue1 = false;
  bool checkedValue2 = false;
  bool checkedValue3 = false;
  bool checkedValue4 = false;
  bool checkedValue5 = false;
  bool checkedValue6 = false;

  bool checkedValue61 = false;
  bool checkedValue7 = false;
  bool checkedValue8 = false;
  bool checkedValue9 = false;
  bool checkedValue10 = false;

  bool checkedValue11 = false;
  bool checkedValue12 = false;
  bool checkedValue13 = false;
  bool checkedValue14 = false;


  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ProjectTheme.projectBackgroundColor,
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 35,
            right: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTopContent(),
              buildWeatherdata(_width, _height,),
              buildResturantData(_width, _height),
              buildAlertData(_width, _height),
              buildButton(_width, _height)

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

  Widget buildTopContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: style,
        ),
        SizedBox(height: 10,),
        SizedBox(
          width: 200,
          height: 37,
          child: OutlineDropdownButton(iconSize: 25,
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
        ),
        SizedBox(height: 10,),
        Text(
          'While Driving Alert Frequency (?)',
          style: style,
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.grey,
            inactiveTrackColor: Colors.red.withOpacity(.1),
            overlayColor: Colors.transparent,
            trackHeight: 5.0,
            thumbColor: Colors.white,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 9.0),
            // overlayColor: Colors.red.withAlpha(32),
            // overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
          ),
          child: Slider(
            min: 0,
            max: 100,
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
        Text(
          'While Stationary Alert Frequency (?)',
          style: style,
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor:Colors.grey ,
            // Color(0xFFC0C0C0),
            inactiveTrackColor: Colors.red.withOpacity(.1),
            overlayColor: Colors.transparent,
            trackHeight: 5.0,
            thumbColor: Colors.white,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 9.0,
            ),
            // overlayColor: Colors.red.withAlpha(32),
            // overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
          ),
          child: Slider(
            min: 0,
            max: 100,
            value: _value1,
            onChanged: (value) {
              setState(() {
                _value1 = value;
              });
            },
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget buildWeatherdata(double _width, double _height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Weather Alert Types (?)',style: style,),
        Container(height: _height* 0.3,
          child: Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text('Weather Alert Types (?)',style: style,),
              Positioned(
                  child: buildCheckBox(onChanged: (bool newValue) {
                    setState(() {checkedValue = newValue;});},
                      title: 'NWS - Tornado Watch/Warning',
                      value: checkedValue),
              ),
              Positioned(
                top: 30,width: _width ,
                child: buildCheckBox(onChanged: (bool newValue) {
                  setState(() {checkedValue1 = newValue;});},
                    title: 'NWS - Hurricane Watch/Warning',
                    value: checkedValue1),
              ),
              Positioned(
                top: 60,width: _width ,
                child: buildCheckBox(onChanged: (bool newValue) {
                  setState(() {checkedValue2 = newValue;});},
                    title: 'NWS - Wildfire Watch/Warning',
                    value: checkedValue2),
              ),
              Positioned(
                top: 90,width: _width ,
                child: buildCheckBox(onChanged: (bool newValue) {
                  setState(() {checkedValue3 = newValue;});},
                    title: 'NWS - Severe Thunderstorm Watch/Warning',
                    value: checkedValue3),
              ),
              Positioned(
                top: 120,width: _width ,
                child: buildCheckBox(onChanged: (bool newValue) {
                  setState(() {checkedValue4 = newValue;});},
                    title: 'NWS - Flood Watch/Warning',
                    value: checkedValue4),
              ),
              Positioned(
                top: 150,width: _width ,
                child: buildCheckBox(onChanged: (bool newValue) {
                  setState(() {checkedValue5 = newValue;});},
                    title: 'NWS - Precipitation Area',
                    value: checkedValue5),
              ),
              Positioned(
                top: 180,width: _width ,
                child: buildCheckBox(onChanged: (bool newValue) {
                  setState(() {checkedValue6 = newValue;});},
                    title: 'NIFS - Wildfire Current Areas',
                    value: checkedValue6),
              ),


            ],
          ),
        ),
      ],
    );
  }

  Widget buildResturantData (double _width, double _height){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Restaurant Alert Preferences (?)',style: style,),
        Container(height: _height*0.22,
          child: Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Positioned(
                child: buildCheckBox(onChanged: (bool newValue) {
                  setState(() {checkedValue61 = newValue;});},
                    title: 'Mexican',
                    value: checkedValue61),
              ),
              Positioned(top: 30,width: _width ,
                child: buildCheckBox(onChanged: (bool newValue) {
                  setState(() {checkedValue7 = newValue;});},
                    title: 'Asian',
                    value: checkedValue7),
              ),
              Positioned(
                top: 60,width: _width ,
                child: buildCheckBox(onChanged: (bool newValue) {
                  setState(() {checkedValue8 = newValue;});},
                    title: 'Indian',
                    value: checkedValue8),
              ),
              Positioned(
                top: 90,width: _width ,
                child: buildCheckBox(onChanged: (bool newValue) {
                  setState(() {checkedValue9 = newValue;});},
                    title: 'Amercian',
                    value: checkedValue9),
              ),
              Positioned(
                top: 120,width: _width ,
                child: buildCheckBox(onChanged: (bool newValue) {
                  setState(() {checkedValue10 = newValue;});},
                    title: '...',
                    value: checkedValue10),
              ),



            ],
          ),
        ),
      ],
    );

  }

  Widget buildAlertData (double _width, double _height){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Attraction Alert Preferences (?)',style: style,),
        Container(height: _height*0.2,
          child: Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Positioned(
                child: buildCheckBox(onChanged: (bool newValue) {
                  setState(() {checkedValue11 = newValue;});},
                    title: 'Amusement Parks',
                    value: checkedValue11),
              ),
              Positioned(top: 30,width: _width ,
                child: buildCheckBox(onChanged: (bool newValue) {
                  setState(() {checkedValue12 = newValue;});},
                    title: 'Parks',
                    value: checkedValue12),
              ),
              Positioned(
                top: 60,width: _width ,
                child: buildCheckBox(onChanged: (bool newValue) {
                  setState(() {checkedValue13 = newValue;});},
                    title: 'Museums',
                    value: checkedValue13),
              ),
              Positioned(
                top: 90,width: _width ,
                child: buildCheckBox(onChanged: (bool newValue) {
                  setState(() {checkedValue14 = newValue;});},
                    title: '...',
                    value: checkedValue14),
              ),



            ],
          ),
        ),
      ],
    );

  }

Widget buildButton (double _width, double _height){
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 30, right: 30 ),
          child: CustomRoundedButton(buttontitle: 'Save', onPressed: (){}),

        ),
        SizedBox(height: _height * 0.035,)
      ],
    );
}



  Widget buildCheckBox({var onChanged, String title, var value}) {
    return CheckboxListTileMoreCustomizable(
        controlAffinity: ListTileMoreCustomizableControlAffinity.leading,
        // controlAffinity: ListTileControlAffinity.leading
        contentPadding: EdgeInsets.all(0),checkColor: Colors.black,
        horizontalTitleGap: 0,
        minLeadingWidth: 40,
        minVerticalPadding: 0,
        title: Text(
          title,
          style: TextStyle(fontSize: 14),
        ),
        activeColor: ProjectTheme.projectBackgroundColor,
        value: value,
        onChanged: onChanged);
  }
}
