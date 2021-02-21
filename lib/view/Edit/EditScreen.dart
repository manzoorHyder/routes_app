import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:routes_app/widgets/customButton.dart';

import '../../project_theme.dart';

class EditScreen extends StatefulWidget {
  static const routeName = '/edit';
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextStyle style = TextStyle(
      color: ProjectTheme.projectPrimaryColor, fontWeight: FontWeight.w600,fontSize: 13);




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
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildDetials(),
            buildButtons(),
            buildContainerMap(_height, _width)
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

  Widget buildDetials() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
          left: 60,
          right: 60,
        ),
        child: Column(
          children: [
            buildUser(title: 'Name', controller: _nameController),
            buildUser(title: 'Address', controller: _addressController),
            buildUser(title: 'City', controller: _cityController),
            buildUser(title: 'State/Province', controller: _stateController),
            buildUser(title: 'Country', controller: _countryController),
          ],
        ),
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

  Widget buildButtons() {
    return Padding(
      padding: EdgeInsets.only(
        left: 35,
        right: 35,
      ),
      child: Column(
        children: [
          CustomRoundedButton(buttontitle: 'Locate', onPressed: () {}),
          SizedBox(
            height: 20,
          ),
          CustomRoundedButton(
              buttontitle: 'Use Current Location', onPressed: () {})
        ],
      ),
    );
  }

  Widget buildContainerMap(double _height, double _width) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(

          height: _height * 0.25,
          width: _width * 0.82,
          color: Colors.grey,
          child:
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _initialcameraposition),
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
          ),



        ),
        SizedBox(height: 10,),
        Text('Latitude/Longitude'),
        SizedBox(height: 20,),
        Padding(
    padding: EdgeInsets.only(
    left: 35,
    right: 35,),
          child: CustomRoundedButton(buttontitle: 'Save', onPressed: (){}),

        ),
        SizedBox(height: 30,)
      ],
    );
  }
}
