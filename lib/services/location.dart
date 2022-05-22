import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    await Geolocator.requestPermission();

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
      // ignore: avoid_print
      print(position);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
