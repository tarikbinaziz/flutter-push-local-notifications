// initialization
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Define a private FlutterNotificationPluginVariable
FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// Create a method called setup to initialize the plugin for each platform

Future<void> setupFlutterNotifications() async {
  AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('@drawable/ic_launcher');
  const DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );
  await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
}

// Background notification selection
Future<void> onDidReceiveNotificationResponse(
  NotificationResponse notificationResponse,
) async {
  // ContextLess.navigatorkey.currentState!.pushNamedAndRemoveUntil(
  //   Routes.messageScreen,
  //   arguments: MessageScreenArgument(
  //     orderId: orderId,
  //     senderId: receiverId,
  //     receiverId: senderId,
  //   ),
  //   (route) => true,
  // );
}

// Write a simple method to show local notifications.

/*
  1.The androidNotificationDetail and iOSNotification detail contain settings such as enabling/disabling badge, sound etc.
  2.Android specifically requires you to define channels to distinguish between various notifications.
  3.Pass on this setting along with id(0 in our example), title and body to show the method of FlutterLocalNotification.
  4.Id is used to identify a notification just in case we want to cancel. Cancelling notifications will be covered in later publications.
*/

void showLocalNotification(
    {required String title, required String body}) async {
  const androidNotificationDetails = AndroidNotificationDetails("0", "general");
  const iosNotificationDetails = DarwinNotificationDetails();
  const notificationDetails = NotificationDetails(
      android: androidNotificationDetails, iOS: iosNotificationDetails);

  _flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails);
}
