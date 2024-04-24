import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class TodoLocation extends StatefulWidget {
  const TodoLocation({super.key});
  @override
  State<TodoLocation> createState() => _TodoLocationState();
}

class _TodoLocationState extends State<TodoLocation> {
  StreamSubscription<Position>? positionStream;
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      }
    }
  
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately. 
      print(
      'Location permissions are permanently denied, we cannot request permissions.');
    } 

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    print('''**************************
    Get Current Position
*****************************''');
    var pos = await Geolocator.getCurrentPosition();
    print(pos.latitude);
    print(pos.longitude);

    print('''**************************
      Listen to location updates
    *****************************''');
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
    (Position? position) {
        print(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');
    });
    return pos;
  }


  @override
  void initState() {
    determinePosition();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    if(positionStream != null) {
      positionStream!.cancel();
    }
  }

  TextEditingController country = TextEditingController();
  @override
  Widget build (BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Text('geolocator')
        )
      );
  }
}