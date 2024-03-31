import 'package:demo_app/config/config.dart';
import 'package:demo_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pushNotifications = PushNotifications();

@pragma('vm:entry-point')
Future _firebaseBackgroundHandler(RemoteMessage message) async {
  await pushNotifications.setupFlutterNotifications();
  pushNotifications.showFlutterNotification(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  PushNotifications.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
  await pushNotifications.setupFlutterNotifications();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    pushNotifications.onMessageListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Demo App',
      theme: AppTheme(isDarkmode: false).getTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
