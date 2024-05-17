import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future init() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('noti_icon');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: (id, title, body, payload) {});
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) {});
  }

  // show simple notification
  static Future showNotification({
    String? title,
    String? body,
    String? payload,
  }) async {
    // creatte notification details for android
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    // call flutter local notification plugin to show notification 
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}


// Future<void> _initializeNotifications() async {
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('app_icon');

  //   final InitializationSettings initializationSettings = InitializationSettings(
  //     android: initializationSettingsAndroid,
  //   );

  //   await flutterLocalNotificationsPlugin.initialize(
  //     initializationSettings,
  //     onDidReceiveNotificationResponse: (NotificationResponse response) async {
  //       // Handle foreground notification interaction
  //       print('User interacted with a notification while the app is in the foreground.');
  //       print('Notification details: ${response.notificationResponseType}');

  //       // Navigate to the second screen when the notification is clicked
  //       Navigator.of(context).push(
  //         MaterialPageRoute(builder: (context) => SecondScreen()),
  //       );
  //     },
  //     onDidReceiveBackgroundNotificationResponse: (NotificationResponse response) async {
  //       // Handle background or terminated app notification interaction
  //       print('User interacted with a notification while the app is in the background or terminated.');
  //       print('Notification details: ${response.notificationResponseType}');

  //       // Navigate to the second screen when the notification is clicked
  //       Navigator.of(context).push(
  //         MaterialPageRoute(builder: (context) => SecondScreen()),
  //       );
  //     },
  //   );
  // }


  
  // Future<void> _showNotification() async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //     'your_channel_id', // Change this to a unique channel ID
  //     'Your channel name',
      
  //     importance: Importance.max,
  //     priority: Priority.high,
  //     ticker: 'ticker',
  //   );
  //   const NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);

  //   await flutterLocalNotificationsPlugin.show(
  //     0,
  //     'Notification Title',
  //     'Notification Body',
  //     platformChannelSpecifics,
  //     payload: "context", // Pass the Navigator context as payload
  //   );
  // }
