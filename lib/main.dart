import 'package:automatik_technician_final_project/views/home_screen.dart';
import 'package:automatik_technician_final_project/views/login_page.dart';
import 'package:automatik_technician_final_project/views/registration_page.dart';
import 'package:automatik_technician_final_project/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    initialRoute: '/splash',
    getPages: [
      GetPage(name: '/splash', page: () => const SplashScreen()),
      GetPage(name: '/homescreen', page: () => const HomeScreen()),
      GetPage(name: '/registration', page: () => RegistrationPage()),
      GetPage(name: '/login', page: () => LoginPage()),
    ],
    debugShowCheckedModeBanner: false,
  ));
}
