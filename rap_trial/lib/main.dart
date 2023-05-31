import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rap_trial/screens/login_page.dart';
import 'package:rap_trial/screens/player_position.dart';
import 'package:rap_trial/screens/profile_setup.dart';
import 'firebase_options.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          unselectedWidgetColor: const Color.fromARGB(255, 30, 30, 30)),
      home: AnimatedSplashScreen(
          splash: Image.asset('assets/images/rap4.png'),
          splashIconSize: double.maxFinite,
          duration: 1000,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.black,
          nextScreen: const MyLoginPage()),
    );
  }
}
