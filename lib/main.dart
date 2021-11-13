import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

import 'package:push_notifs_o2021/home/home_page.dart';

import 'utils/constants_utils.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (Firebase.apps.length == 0) {
    await Firebase.initializeApp();
  }
  print('Handling a background message ${message.messageId}');
  print(message.notification);

  AwesomeNotifications().createNotificationFromJsonData(message.data);
}

Future initLocalNotifications() async {
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
          channelKey: channelSimpleId,
          channelName: channelSimpleName,
          channelDescription: channelSimpleDescr,
          defaultColor: Colors.purple,
          ledColor: Colors.blue,
          importance: NotificationImportance.Default,
        ),
        NotificationChannel(
          channelKey: channelBigPictureId,
          channelName: channelBigPictureName,
          channelDescription: channelBigPictureDescr,
          defaultColor: Colors.purple,
          ledColor: Colors.yellow,
          importance: NotificationImportance.High,
        ),
        NotificationChannel(
          channelKey: channelScheduleId,
          channelName: channelScheduleName,
          channelDescription: channelScheduleDescr,
          defaultColor: Colors.purple,
          ledColor: Colors.red,
          importance: NotificationImportance.Default,
        ),
      ]);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalNotifications();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //   name: "NOT-DEFAULT",
  //   options: const FirebaseOptions(
  //     apiKey: 'AIzaSyBX2c3eeYqPfuY1TLi5mdswsOhyapqGMv0',
  //     appId: '1:1092699778286:android:5c4da6eb127224603f17ff',
  //     messagingSenderId: '1092699778286',
  //     projectId: 'push-notif-fafeb',
  //   ),
  // );
  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(false);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme(
          primary: Colors.indigo,
          primaryVariant: Colors.indigoAccent,
          secondary: Colors.green,
          secondaryVariant: Colors.lime,
          surface: Colors.grey[200]!,
          background: Colors.grey[200]!,
          // background: Colors.deepPurple[100]!,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.grey,
          onBackground: Colors.deepPurple[100]!,
          onError: Colors.red,
          brightness: Brightness.light,
        ),
      ),
      home: HomePage(),
    );
  }
}
