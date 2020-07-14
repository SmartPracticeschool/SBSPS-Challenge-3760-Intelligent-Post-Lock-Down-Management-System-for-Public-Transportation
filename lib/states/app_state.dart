import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class AppState with ChangeNotifier {
  static LatLng _initialPosition;
  LatLng _lastPosition = _initialPosition;
  LatLng sourcePosition;
  bool locationServiceActive = true;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLines = {};
  GoogleMapController _mapController;
  TextEditingController locationController =
  TextEditingController(); // Take users current location
  TextEditingController destinationController =
  TextEditingController(); // Take users destination location
  LatLng get initialPosition => _initialPosition;
  LatLng get lastPosition => _lastPosition; // To access private variable from outside the class, we get them
  GoogleMapController get mapController => _mapController;
  Set<Marker> get markers => _markers;
  Set<Polyline> get polyLines => _polyLines;

  AppState() {
    _getPermission();
    _getUserLocation();
    _loadingInitialPosition();
  }

  // Ask permission for location
  Future<void> _getPermission() async {
    var status = await Permission.location.status;
    if (status.isUndetermined) {
      // We didn't ask for permission yet.
      Permission.location.request();
    }

// You can can also directly ask the permission about its status.
    if (await Permission.location.isDenied) {
      // The OS restricts access, for example because of parental controls.
      Permission.location.request();
    }
    if(await Permission.location.isPermanentlyDenied){
      // The user opted to never again see the permission request dialog for this
      // app. The only way to change the permission's status now is to let the
      // user manually enable it in the system settings.
      openAppSettings();
    }
  }

// TO GET THE USERS LOCATION
  void _getUserLocation() async {
    print("GET USER METHOD RUNNING =========");
    Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy:
        LocationAccuracy.high); // Getting position with high accuracy
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(
        position.latitude,
        position.longitude); // Obtaining placemarks with the co-ordinates
    _initialPosition = LatLng(position.latitude, position.longitude);
    sourcePosition=LatLng(position.latitude, position.longitude);
    print(
        "the latitude is: ${position.latitude} and the longitude is: ${position.longitude} ");
    print("initial position is : ${_initialPosition.toString()}");
    locationController.text =
        placemark[0].name; // Will convert LatLng position into address
    notifyListeners();
  }

  //  LOADING INITIAL POSITION
  void _loadingInitialPosition() async {
    await Future.delayed(Duration(seconds: 5)).then((v) {
      if (_initialPosition == null) {
        locationServiceActive = false;
        notifyListeners();
      }
    });
  }

  // ON CAMERA MOVE
  void onCameraMove(CameraPosition position) {
    print("CAMERA MOVING =========");
    _lastPosition = position.target;
    notifyListeners();
  }

  // ON CREATE
  void onCreated(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  //SOURCE
  void source(String source) async{
    List<Placemark> placemark = await Geolocator().placemarkFromAddress(source);
    double latitude = placemark[0].position.latitude;
    double longitude = placemark[0].position.longitude;
    sourcePosition = LatLng(latitude, longitude);
    locationController.text = source; // To have Auto-completed location name in the Source TextField
    _addMarker(sourcePosition, source);
  }

  // SEND REQUEST -- DESTINATION
  void sendRequest(String intendedLocation) async {
    print("SENDING REQUEST =========");
    List<Placemark> placemark =
    await Geolocator().placemarkFromAddress(intendedLocation);
    double latitude = placemark[0].position.latitude;
    double longitude = placemark[0].position.longitude;
    LatLng destination = LatLng(latitude, longitude);
    _addMarker(destination, intendedLocation);
    createRoute(sourcePosition, destination);
    destinationController.text = intendedLocation; // To have Auto-completed location name in the Destination TextField
    notifyListeners();
  }

  // ADD A MARKER ON THE MAP
  void _addMarker(LatLng location, String address) {
    print("MARKERS ADDING");
    _markers.clear();
    _markers.add(Marker(
        markerId: MarkerId(address), // Provide different ID for every marker used
        position: location,
        infoWindow: InfoWindow(title: address, snippet: "Go here"), // Specify basic information on marker
        icon: BitmapDescriptor.defaultMarker));
    notifyListeners();
  }

  // TO CREATE ROUTE
  void createRoute(LatLng source, LatLng destination) {
    print("CREATING ROUTES =========");
    List<LatLng> results = <LatLng>[];
    results.add(source);
    results.add(destination);
    _polyLines.clear();
    _polyLines.add(Polyline(
        polylineId: PolylineId(_lastPosition.toString()),
        width: 3,
        points: results,
        color: Colors.blue));
    notifyListeners();
  }
}
