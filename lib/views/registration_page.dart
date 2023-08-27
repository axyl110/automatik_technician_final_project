import 'package:automatik_technician_final_project/controller/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Implement your form fields here using FormBuilder or TextField
            ElevatedButton(
              onPressed: controller.registerUser,
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}