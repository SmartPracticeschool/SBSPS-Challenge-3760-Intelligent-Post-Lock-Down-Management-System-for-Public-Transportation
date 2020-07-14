import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_gen_rd/Models/user.dart';
import 'package:qr_gen_rd/Models/route.dart';

//                                                                      USER

// Collection Reference:-: Instance & Reference to the collection of user database in FireStore
final CollectionReference _userCollection = Firestore.instance.collection("user_data");

class UserDatabaseService{
  final String uid;
  UserDatabaseService({this.uid});  // Document uid constructor

  // To add or update fields in DB collection
  Future updateUserData(UserPersonelData data)async {
    return await _userCollection.document(uid).setData({
      'uid' : uid,
      'email': data.email,
      'name' : data.name,
      'DOB'  : data.dob,
      'CoronaHist'  : data.previousCoronaPos,
      'HealthIssue'  : data.healthIssues,
    });
  }

  // Get user data from snapshots
  UserPersonelData userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserPersonelData(
        uid: uid,
        email: snapshot.data['email'],
        name: snapshot.data['name'],
        dob: snapshot.data['DOB'],
        previousCoronaPos: snapshot.data['CoronaHist'],
        healthIssues: snapshot.data['HealthIssue'],
    );
  }
  Stream<UserPersonelData> get userData {
    return _userCollection.document(uid).snapshots()
        .map(userDataFromSnapshot);
  }

}

//                                                                    ROUTES

// Collection Reference:-: Instance & Reference to the collection of routes database in FireStore
final CollectionReference _routesCollection = Firestore.instance.collection("routes_data");

class RoutesDatabaseService{
  final String uid;
  RoutesDatabaseService({this.uid});  // Document uid constructor

  // To add or update fields in DB collection
  Future updateRoutesData(RoutesData data)async {
    return await _routesCollection.document(data.routes.toString()).setData({
      'source': data.source,
      'destination' : data.destination,
      'time'  : data.time,
      'busno'  : data.busno,
      'fare' : data.fare,
      'seats'  : data.seats,
      'routes' : data.routes,
    });
  }

  // Stream that returns/retrieve fields from DB collection

//  Stream<QuerySnapshot> get routes{
//    return _routesCollection.snapshots();
//  }

  // Route list from snapshot
  RoutesData routesFromSnapshot(DocumentSnapshot snapshot) {
      return RoutesData(
        source: snapshot.data['source'],
        destination: snapshot.data['destination'],
        time: snapshot.data['time'],
        busno: snapshot.data['busno'],
        fare:  snapshot.data['fare'],
        seats: snapshot.data['seats'],
        routes: snapshot.data['routes'],
      );
    }
}
