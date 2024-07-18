import 'package:firebase_core/firebase_core.dart';
import 'package:mvc_demo/core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CekPaketAJI',
        navigatorKey: Get.navigatorKey,
        // theme: defaultTheme().getTheme(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              unselectedItemColor: Colors.grey, selectedItemColor: Colors.blue),
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginView());

    //theme: DarkTheme().getTheme(),
  }
}
