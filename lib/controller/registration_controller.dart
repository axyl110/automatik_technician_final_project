import 'package:automatik_technician_final_project/models/user_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RegistrationController extends GetxController {
  UserModel user = UserModel(
    firstName: '',
    lastName: '',
    email: '',
    phoneNumber: '',
    password: '',
  );
  void updateUserField(String fieldName, String value) {
    if (fieldName == 'firstName') {
      user.firstName = value;
    } else if (fieldName == 'lastName') {
      user.lastName = value;
    } else if (fieldName == 'email') {
      user.email = value;
    } else if (fieldName == 'phoneNumber') {
      user.phoneNumber = value;
    } else if (fieldName == 'password') {
      user.password = value;
    }

    
  }
  void registerUser() async {
    try {
      // Create a new user document in Firestore
      await FirebaseFirestore.instance.collection('technician_users').add({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'phoneNumber': user.phoneNumber,
      });

      // Implement user registration logic using Firebase Auth if needed

      print('User registered successfully.');
    } catch (e) {
      print('Error registering user: $e');
    }
  }
}
