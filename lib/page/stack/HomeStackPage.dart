import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomeStackPage extends StatefulWidget {
  final String title;

  HomeStackPage({Key? key, required this.title}) : super(key: key);

  @override
  _HomeStackPage createState() => _HomeStackPage();
}

class _HomeStackPage extends State<HomeStackPage> {
  Position? _currentPosition;
  String? _currentAddress;

  _getCurrentLocation() async {
    Position? pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      forceAndroidLocationManager: true,
    );

    print("we get the pos");
    List<Placemark> places = await placemarkFromCoordinates(
      pos.latitude,
      pos.longitude,
    );

    setState(() {
      _currentAddress = [
        places[0].country,
        places[0].administrativeArea,
        places[0].subAdministrativeArea,
        places[0].street,
        places[0].postalCode,
      ].join(", ");

      _currentPosition = pos;
    });
  }

  @override
  void initState() {
    super.initState();

    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Page, address : $_currentAddress"),
          ],
        ),
      ),
    );
  }
}
