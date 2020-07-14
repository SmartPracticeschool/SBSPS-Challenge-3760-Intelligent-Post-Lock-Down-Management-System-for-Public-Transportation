import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:qr_gen_rd/states/app_state.dart'; //AppState Management
import 'package:qr_gen_rd/Screens/payments/payment.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qr_gen_rd/styles/loading.dart';
import 'package:spring/spring.dart';
import 'package:spring/springs/spring_translate.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:qr_gen_rd/Models/route.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AppState(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(child: Map()),
      ),
    );
  }
}

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

  // Auto complete text fields
  List<String> added = [];
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> keySource = GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> keyDest = GlobalKey();

  List<String> suggestions = [
    "Dahanukar Colony, Kothrud, Pune",
    "Gandhi Bhawan Phata, Pune",
    "Karve Putla, Pune",
    "Kothrud Stand, Pune",
    "Swargate, Pune",
    "Sanewadi, Pune",
    "Pune Station Depot, Pune",
    "Paud Phata, Pune",
    "Shivaji Bus Stand, Pune",
    "Shanipar Bus Stand, Pune",
    "Pashan Jakat Naka, Pune",
    "Sangramwadi, Pune",
    "Na Ta Wadi, Pune",
    "Pune By Pass, Pune",
    "Khadki Station, Pune",
    "Karve Nagar PMT Bus Stop, Pune",
    "Pune Manapa Bus Station",
    "Ambedkar Chowk Galinde Path-Down, Pune",
    "Kasba Peth Police Chowky, Pune",
    "Near RTO Pune",
    "MSRTC Bus Depot, Pune Station",
    "Pumping Station, Pune"
  ];

  SimpleAutoCompleteTextField textField;
  bool showWhichErrorText = false;
// End of AutoComplete text fields

  @override
  Widget build(BuildContext context) {

    // AutoComplete
    Column body = Column(children: [
      ListTile(
          title: textField,
          onTap: (){
            textField.triggerSubmitted();
          },
       ),
    ]);

    body.children.addAll(added.map((item) {
      return ListTile(title: Text(item));
    }));
    //AutoComplete

    final appState = Provider.of<AppState>(context);
   // final routes = Provider.of<List<RoutesData>>(context);  // Instance of List of RoutesData

    return appState.initialPosition == null
        ? Container(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Loading(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: appState.locationServiceActive == false,
                // If app is unable to load initial position
                child: TypewriterAnimatedTextKit(
                  text: ["Please enable location services"],
                  isRepeatingAnimation: false,
                  textStyle: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              )
            ],
          ))
        : Stack(
            children: <Widget>[
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: appState.initialPosition,
                  // Setting up zoom value
                  zoom: 15,
                ),
                // Method called when the map is ready to be used.
                onMapCreated: appState.onCreated,
                // Enabling current location
                myLocationEnabled: true,
                // Type of map
                mapType: MapType.normal,
                // Displays a compass
                compassEnabled: true,
                // To set markers
                markers: appState.markers,
                // Method called when map is rolledover
                onCameraMove: appState.onCameraMove,
                // Displays polyline on Map
                polylines: appState.polyLines,
              ),
              Positioned(
                // Textfield For Source
                top: 65.0,
                right: 13.0,
                left: 13.0,
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 3.0),
                          blurRadius: 10,
                          spreadRadius: 3)
                    ],
                  ),
                  child: SimpleAutoCompleteTextField(
                    key: keySource,
                    //cursorColor: Colors.black,
                    controller: appState.locationController,
                    textInputAction: TextInputAction.go,
                    suggestions: suggestions,
                    textChanged: (text) => currentText = text,
                    textSubmitted: (text) => setState(() {
                      if (text != "") {
                        appState.source(text);
                        src = text;
                        //appState.locationController;
                      }
                    }),
                    decoration: InputDecoration(
                      icon: Container(
                        margin: EdgeInsets.only(left: 20, bottom: 10),
                        width: 10,
                        height: 10,
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                      hintText: "Enter The Source...",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15.0, top: 5.0),
                    ),
                  ),
                ),
              ),
              Positioned(
                // Textfield for destination
                top: 125.0,
                right: 13.0,
                left: 13.0,
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 3.0),
                          blurRadius: 10,
                          spreadRadius: 3)
                    ],
                  ),
                  child: SimpleAutoCompleteTextField(
                    key: keyDest,
//                    onTap: () async{
//                      await appState.getLocationAutoComplete(context);
//                      //await appState.sendRequest(appState.p.description);
//                    },
                    controller: appState.destinationController,
                    textInputAction: TextInputAction.go,
                    suggestions: suggestions,
                    textChanged: (text) => currentText = text,
                    textSubmitted: (text) => setState(() {
                      if (text != "") {
                        appState.sendRequest(text);
                        dest = text;
                        //appState.destinationController;
                      }
                    }),
//                    onSubmitted: (value) {
//                      print("DESTINATION VALUE SUBMITTED: $value");
//                      appState.sendRequest(value);
//                    },
                    decoration: InputDecoration(
                      icon: Container(
                        margin: EdgeInsets.only(left: 20, bottom: 9),
                        width: 10,
                        height: 10,
                        child: Icon(
                          Icons.directions_bus,
                          color: Colors.blue,
                        ),
                      ),
                      hintText: "Enter The Destination...",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15.0, top: 5.0),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 18,
                right: 65,
                child: SpringTranslate(
                  motion: Motion.Mirror,
                  beginOffset: Offset(-1, -3),
                  endOffset: Offset.zero,
                  animStatus: (T) => print(T),
                  child: Container(
                    width: 60,
                    height: 60,
                    child: FittedBox(
                      child: FloatingActionButton(
                        hoverElevation: 5,
                        elevation: 4,
                        backgroundColor: Colors.blue.withOpacity(0.9),
                        onPressed: () {
                          routeBooked = getFare(src,dest);
                          print(routeBooked.fare);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Payments()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.payment,color: Colors.white,),
                            Text(
                              "BOOK",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
