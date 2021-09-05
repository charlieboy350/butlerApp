import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

const kGoogleApiKey = "AIzaSyAUaL1JP9-J0nb_NCJCQ-qFMebDoKZrbsQ";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class PlacePickerProvider extends ChangeNotifier {
  Completer<GoogleMapController> completer = Completer();
  Set<Marker> _markers = {};
  // LatLng pinPosition = LatLng(24.9056, 67.0822);
  Prediction prediction;
  String placePickerText;
  String city;
  String country;
  double lat, lng;

  CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(31.582045, 74.329376), zoom: 14.4746, bearing: 5);
  CameraPosition get cameraPosition => _cameraPosition;

  Set<Marker> get markers => _markers;
  Future<void> displayPlacePicker(BuildContext context,
      {String hint = "Search Area", provider}) async {
    // show input autocomplete with selected mode
    // then get the Prediction selected
    Prediction p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      language: "en",
      mode: Mode.overlay,
      hint: hint,
      components: [Component(Component.country, "pk")],
    );

    displayPrediction(p, context, provider);
  }

  Future<Null> displayPrediction(
      Prediction p, context,  provider) async {
    if (p != null) {
      // get detail (lat/lng)
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      lat = detail.result.geometry.location.lat;
      lng = detail.result.geometry.location.lng;

      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

      print("${p.description} - $lat/$lng");

      placePickerText = "${p.description}";
      if (provider != null) {
        //city refers to locality

        if (placemarks.length > 0) {
          country = placemarks[0].country;
          city = placemarks[0].locality;

          // provider.setLocationAddress(
          //     locationAdd: country,
          //     cityName: city,
          //     lat: lat.toString(),
          //     lng: lng.toString());
        }
      }

        await animateTo(lat, lng);
      notifyListeners();
    }
  }

  void onError(PlacesAutocompleteResponse response) {
    print(response.errorMessage);
  }

  Future<void> animateTo(double lat, double lng) async {
    final c = await completer.future;
    final p = CameraPosition(target: LatLng(lat, lng), zoom: 14.4746);
    print(p);
    c.animateCamera(CameraUpdate.newCameraPosition(p));
  }

  addMarkers(String title, LatLng pinPosition, int isFranchise) {
    _markers.add(
      Marker(
          position: pinPosition,
          markerId: MarkerId(pinPosition.toString()),
          infoWindow: InfoWindow(title: title),
          icon: BitmapDescriptor.defaultMarkerWithHue(isFranchise == 1
              ? BitmapDescriptor.hueRed
              : BitmapDescriptor.hueAzure)),
    );
  }

  //store listing screen code

  void getLocation() async {
    var currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    print('location' + currentLocation.latitude.toString());

    animateTo(currentLocation.latitude, currentLocation.longitude);

    getAddressFromLatLng(currentLocation.latitude, currentLocation.longitude);
  }

  getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(lat, lng);

      Placemark place = p[0];
      city = place.locality;
      country = place.country;

      placePickerText =
          "${place.name}, ${place.locality}, ${place.subLocality}, ${place.country}";

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
