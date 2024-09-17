import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Confifigure Local Notification
class LocalNotificationService {
  /// Instance of FlutterLocalNotificationsPlugin
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

// 1. Initialize Local Notification
  static Future< void> initialize() async{
    // initializationSettings  for Android
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@drawable/ic_launcher");
    // initializationSettings for iOS
    const DarwinInitializationSettings iosInitializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: null,
    );

    flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
          android: androidInitializationSettings,
          iOS: iosInitializationSettingsIOS),
      // to handle event when we receive notification
      onDidReceiveNotificationResponse: (details) {
        if (details.input != null) {}
      },
    );
  }

  Future selectNotification(String payload) async {
    //Handle notification tapped logic here
  }



//  void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload, BuildContext context) async {
//     // display a dialog with the notification details, tap ok to go to another page
//     showDialog(
//       context: context,
//       builder: (BuildContext context) => CupertinoAlertDialog(
//         title: Text(title ?? ''),
//         content: Text(body ?? ''),
//         actions: [
//           CupertinoDialogAction(
//             isDefaultAction: true,
//             child: Text('Ok'),
//             onPressed: () async {
//               Navigator.of(context, rootNavigator: true).pop();
//               // await Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) => SecondScreen(payload),
//               //   ),
//               // );
//             },
//           )
//         ],
//       ),
//     );
//   }

  // 2. For displaying the notification
  // static Future<void> display(RemoteMessage message) async {
  //   // To display the notification in device
  //   try {
  //     print(message.notification!.android!.sound);
  //     final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  //     NotificationDetails notificationDetails = NotificationDetails(
  //       android: AndroidNotificationDetails(
  //           message.notification!.android!.sound ?? "Channel Id",
  //           message.notification!.android!.sound ?? "Main Channel",
  //           groupKey: "gfg",
  //           color: Colors.green,
  //           importance: Importance.max,
  //           sound: RawResourceAndroidNotificationSound(
  //               message.notification!.android!.sound ?? "gfg"),

  //           // different sound for
  //           // different notification
  //           playSound: true,
  //           priority: Priority.high),
  //     );
  //     await _notificationsPlugin.show(id, message.notification?.title,
  //         message.notification?.body, notificationDetails,
  //         payload: message.data['route']);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }
}
