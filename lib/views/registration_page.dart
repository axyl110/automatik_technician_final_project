// ignore_for_file: must_be_immutable

import 'package:automatik_technician_final_project/controller/registration_controller.dart';
import 'package:automatik_technician_final_project/views/login_page.dart';
import 'package:automatik_technician_final_project/widgets/button.dart';
import 'package:automatik_technician_final_project/widgets/dimensions.dart';
import 'package:automatik_technician_final_project/widgets/textfield.dart';
import 'package:automatik_technician_final_project/widgets/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class RegistrationPage extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());

  RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.selectedImage();
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: controller.selectedImage.value != null
                        ? FileImage(File(controller.selectedImage.value!
                            .path)) // Convert XFile to File
                        : const AssetImage('assets/default_profile_image.png')
                            as ImageProvider<Object>,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: UnifiedValidators.emptyValidator,
                  keyboardType: TextInputType.name,
                  decoration: kTextFieldDecoration.copyWith(
                    labelText: "Full Name",
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                  ),
                  onChanged: (value) =>
                      controller.updateUserField('fullName', value),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.height20, right: Dimensions.height20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: const Offset(1, 10),
                            color: Colors.grey.withOpacity(0.2))
                      ]),
                ),
                TextFormField(
                  validator: UnifiedValidators.emailValidator,
                  keyboardType: TextInputType.emailAddress,
                  decoration: kTextFieldDecoration.copyWith(
                    labelText: 'Email',
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                  ),
                  onChanged: (value) =>
                      controller.updateUserField('email', value),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.height20, right: Dimensions.height20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: const Offset(1, 10),
                            color: Colors.grey.withOpacity(0.2))
                      ]),
                ),
                TextFormField(
                  validator: UnifiedValidators.emptyValidator,
                  keyboardType: TextInputType.number,
                  decoration: kTextFieldDecoration.copyWith(
                    labelText: 'Phone Number',
                    prefixIcon: const Icon(
                      Icons.phone,
                    ),
                  ),
                  onChanged: (value) =>
                      controller.updateUserField('phoneNumber', value),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.height20, right: Dimensions.height20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: const Offset(1, 10),
                            color: Colors.grey.withOpacity(0.2))
                      ]),
                ),
                TextFormField(
                  validator: UnifiedValidators.passwordValidator,
                  decoration: kTextFieldDecoration.copyWith(
                    labelText: 'Password',
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                  ),
                  obscureText: true,
                  onChanged: (value) =>
                      controller.updateUserField('password', value),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: UnifiedValidators.emptyValidator,
                  keyboardType: TextInputType.name,
                  decoration: kTextFieldDecoration.copyWith(
                    labelText: 'Address',
                    prefixIcon: const Icon(
                      Icons.location_on_rounded,
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Select Location'),
                          content: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Add your location selection UI elements here
                              // For example, you can use a map or other input methods
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Save the selected location and update the controller
                                // For example: controller.setUserLocation(latitude, longitude);
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: RoundedButton(
                    buttonTitle: 'REGISTER',
                    color: Colors.amber,
                    buttonOnPressed: () {
                      controller.registerUser();
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Alredy have an account?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    TextButton(
                      child: Text(
                        "Login here",
                        style: TextStyle(color: Colors.grey[850]),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(height: 40),
                Image.asset('assets/AUTOMATIK.png')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
