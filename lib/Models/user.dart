// User class to hold user data
class User{
  final String uid;
  User({this.uid}); //Document uid
}

// User Data Model
class UserPersonelData{
  String uid;
  String email;
  String name;
  String dob;
  bool previousCoronaPos;
  String healthIssues;

  // Constructor
  UserPersonelData({
    this.uid,
    this.email,
    this.name,
    this.dob,
    this.previousCoronaPos,
    this.healthIssues,
  });
}
