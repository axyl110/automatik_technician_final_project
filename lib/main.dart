import 'package:automatik_technician_final_project/views/registration_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    home: RegistrationPage(),
    debugShowCheckedModeBanner: false,
  ));
}
