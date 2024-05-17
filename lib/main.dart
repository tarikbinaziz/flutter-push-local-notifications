import 'package:flutter/material.dart';
import 'package:flutter_local_notification/notification_service.dart';

void main() async {
  // This is a basic Flutter widget binding.
  WidgetsFlutterBinding.ensureInitialized();
  // call initialize method
  await LocalNotificationService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: TextButton(
              onPressed: () {
                LocalNotificationService.showNotification(
                  title: "title",
                  body: "body",
                  payload: "payload",
                );
              },
              child: Text("Get Notification"))),
    );
  }
}
