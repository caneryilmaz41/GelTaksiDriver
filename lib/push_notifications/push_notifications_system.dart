import 'package:driver_taksi/global/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationSystem {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future initiliazeCloudMessaging() async {
    //uygulama kapalıyken -Terminated
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? remoteMessage) {
      if (remoteMessage != null) {
        print("Gelen Mesaj1::");
        print(remoteMessage.data["rideRequestId"]);
       // readUserRequestInformation(remoteMessage!.data["rideRequestId"]);
      }
    });

    //uygulama açıkken-Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage) {
    if (remoteMessage != null) {
    print("Gelen Mesaj2::");
   print(remoteMessage.data["rideRequestId"]);
   //readUserRequestInformation(remoteMessage!.data["rideRequestId"]);  
  }
    });

    //uygulama çalışıyor ama açık değil-Background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage) {
      print("Gelen Mesajer3::"+remoteMessage!.data["rideRequestId"]);
      
      //readUserRequestInformation(remoteMessage!.data["rideRequestId"]);
     
    });
  }
  readUserRequestInformation(){
    
  }
  Future generateAndGetToken() async {
    String? registrationToken = await messaging.getToken();
    print("****FCM KAYIT TOKEN****");
    print(registrationToken);
    FirebaseDatabase.instance
        .ref()
        .child("drivers")
        .child(currenFirebaseUser!.uid) 
        .child("token")
        .set(registrationToken);

    messaging.subscribeToTopic("allDrivers");
    messaging.subscribeToTopic("allUsers");
  }
}
