import 'package:geolocator/geolocator.dart';

class LocationService {
  double latitude;
  double longtitude;

  Future<dynamic> getCurrentLocation() async {
    try {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);

      this.latitude = currentPosition.latitude;
      this.longtitude = currentPosition.longitude;

      print(this.latitude);
      print(this.longtitude);
    } catch (e) {
      print(e);
    }
  }
}
