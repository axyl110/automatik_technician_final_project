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
            TextField(
              decoration: const InputDecoration(labelText: 'First Name'),
              onChanged: (value) => controller.updateUserField('firstName', value),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(labelText: 'Last Name'),
              onChanged: (value) => controller.updateUserField('lastName', value),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) => controller.updateUserField('email', value),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(labelText: 'Phone Number'),
              onChanged: (value) => controller.updateUserField('phoneNumber', value),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) => controller.updateUserField('password', value),
            ),
            const SizedBox(height: 20),
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