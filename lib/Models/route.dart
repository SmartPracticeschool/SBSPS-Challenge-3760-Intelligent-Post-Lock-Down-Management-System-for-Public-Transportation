
// Routes class to hold uid

//class Routes{
//  final User uid;
//  Routes({this.uid}); //Document uid
//}

// Routes Data Model
class RoutesData{
  String uid;
  String source;
  String destination;
  String time;
  int busno;
  int fare;
  int seats;
  String routes;

  // Constructor
  RoutesData({
    this.uid,
    this.source,
    this.destination,
    this.time,
    this.busno,
    this.fare,
    this.seats,
    this.routes,
  });
}

RoutesData data1 = RoutesData(uid:'1001',source:'Kothrud Stand, Pune',destination:'Sangramwadi, Pune',time:'09 30',busno:21,fare:100,seats:20,routes:'Route1');
RoutesData data2 = RoutesData(uid:'1002',source:'Swargate, Pune',destination:'Paud Phata, Pune',time:'10 30',busno:22,fare:50,seats:18,routes:'Route1');
RoutesData data3 = RoutesData(uid:'1003',source:'Khadki Station, Pune',destination:'Sangramwadi, Pune',time:'13 30',busno:31,fare:30,seats:17,routes:'Route1');
RoutesData data4 = RoutesData(uid:'1004',source:'Kothrud Stand, Pune',destination:'Paud Phata, Pune',time:'12 30',busno:40,fare:150,seats:25,routes:'Route1');
RoutesData data5 = RoutesData(uid:'1005',source:'MSRTC Bus Depot, Pune Station',destination:'Sangramwadi, Pune',time:'11 30',busno:25,fare:120,seats:27,routes:'Route1');

List<RoutesData> fault =  [data1,data2,data3,data4,data5];

String src,dest;
int error;

RoutesData getFare(String src,String dest){
  print('[DEBUG]Inside Function');
  print('[DEBUG]'+fault.length.toString());
  for(int i=0;i < fault.length;i++)
  {
    print('[DEBUG]Inside For');
    var data = fault[i];
    print(data);
    if(data.source == src){
      if(data.destination == dest){
        //int cost = data.fare;
        return data;
      }
    }
  }
  // int error= -1;
  return null;
}


