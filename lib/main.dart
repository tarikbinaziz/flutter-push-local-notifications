import 'package:flutter/material.dart';
import 'package:flutter_local_notification/local_notification_service.dart';

void main() async {
  // // This is a basic Flutter widget binding.
  WidgetsFlutterBinding.ensureInitialized();
  // // call initialize method
 await LocalNotificationService.initialize();

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: TextButton(
              onPressed: () {}, child: const Text("Get Notification"))),
    );
  }
}
