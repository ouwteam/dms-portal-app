import 'package:dms_portal/common/snack_alert.dart';
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
  String? _currentAddress = "";

  _getCurrentLocation() async {
    try {
      print("geting your coodinate..");
      _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true,
      );
      print("got it!");
    } catch (e) {
      snackAlert(
        context,
        "Your device is not support geolocator system!",
        AlertType.error,
      );

      if (this.mounted) {
        setState(() {
          _currentAddress = "Not support";
        });
      }

      return;
    }

    String address =
        "${_currentPosition!.latitude},${_currentPosition!.longitude}";
    try {
      print("getting your address based on coordinate..");
      List<Placemark> places = await placemarkFromCoordinates(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      );

      address = [
        places[0].country,
        places[0].administrativeArea,
        places[0].subAdministrativeArea,
        places[0].street,
        places[0].postalCode,
      ].join(", ");
      print("got it!");
    } catch (e) {
      snackAlert(
        context,
        "Your device is not support geocoding system. We show you the coordinates!",
        AlertType.error,
      );
    }

    if (this.mounted) {
      setState(() {
        _currentAddress = address;
        _currentPosition = _currentPosition;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _getCurrentLocation();
  }

  @override
  void dispose() {
    super.dispose();
    _currentPosition = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text("Home Page, address : $_currentAddress"),
        //   ],
        // ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.location_on),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Location',
                              style: Theme.of(context).textTheme.caption,
                            ),
                            if (_currentAddress != null)
                              Text(_currentAddress!,
                                  style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
