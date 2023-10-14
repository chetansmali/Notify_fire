import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:notify_flutter/main.dart';

class FirebaseApi{
//create the instance of firebase messageing
final _firebaseMessaging = FirebaseMessaging.instance;

//function to initalized notification
Future<void> initNotifications() async{
//request permision from the user(will promt the user)
await _firebaseMessaging.requestPermission();

//fetch the FCM token for this device
final fcmToken = await _firebaseMessaging.getToken();

//print the token (normally you would send this to your server)
if (kDebugMode) {
  print('Token : $fcmToken');
}

//initialized the futher settings for the push noti.
initpushnotifications();
}

//function to handle recived messages
void handleMessage(RemoteMessage? message){
  //if message is null then do nothing
  if(message == null) return;

  //navigate to the new screen when message is recived & user tap the notification
  navigationKey.currentState?.pushNamed(
    '/notification_screens',
    arguments: message,
  );
}

//function to initialized foregorund and background settings
Future initpushnotifications() async{
//handel notification if the app was treminated and now opened
FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

//attach event listener for when a notification opens the app
FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
}
}