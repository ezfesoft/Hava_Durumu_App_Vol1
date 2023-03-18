import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hava_durumu/utils/location.dart';
import 'package:location/location.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = new Location();

  late LocationData _locationData;

  Future<void> getLocationData() async {
    _locationData = await location.getLocation();
    print("Versiyon2Kod=" +
        _locationData.altitude.toString() +
        _locationData.latitude.toString());
    print("Versiyon2Kod=" + _locationData.heading.toString());
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
    getLocationData2();
  }

  //-----
  Future<void> getLocationData2() async {
    LocationHelper locationData2 = LocationHelper();
    await locationData2.getCurrentLocation();

    if (locationData2.latitude == null || locationData2.longitude == null) {
      print("konum bilgileri gelmiyor.");
    } else {
      print("latitude: " + locationData2.latitude.toString());
      print("longitude: " + locationData2.longitude.toString());
    }
  }
  //-----

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.blue])),
        child: Center(
          child: SpinKitCircle(
            color: Colors.white,
            size: 150.0,
            duration: Duration(microseconds: 900000),
          ),
        ),
      ),
    );
  }
}
