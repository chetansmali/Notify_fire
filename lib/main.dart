import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notify_flutter/api/firebase_api.dart';
import 'package:notify_flutter/firebase_options.dart';
import 'package:notify_flutter/pages/home_screen.dart';
import 'package:notify_flutter/pages/notification_page.dart';

final navigationKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomePage(),
      navigatorKey: navigationKey,
      routes: {
        '/notification_screens':(context) => const NotificationPage(),
      },
    );
  }
}

