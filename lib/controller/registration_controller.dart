// ignore_for_file: avoid_print, unused_element

import 'package:automatik_technician_final_project/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class RegistrationController extends GetxController {
  final locationController = TextEditingController();
  UserModel user = UserModel(
    fullName: '',
    email: '',
    phoneNumber: '',
    password: '',
    profilePictureUrl: '',
    latitude: 0.0,
    longitude: 0.0,
  );
  // Define a property to store the selected image.
  Rx<XFile?> selectedImage = Rx<XFile?>(null);

  void updateUserField(String fieldName, String value) {
    if (fieldName == 'fullName') {
      user.fullName = value;
    } else if (fieldName == 'email') {
      user.email = value;
    } else if (fieldName == 'phoneNumber') {
      user.phoneNumber = value;
    } else if (fieldName == 'password') {
      user.password = value;
    }

    // Method to select an image.
    Future<void> selectImage() async {
      final imagePicker = ImagePicker();
      final pickedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        // Set the selectedImage property with the picked image.
        selectedImage.value = pickedImage;
      }
    }

    Future<void> setUserLocation() async {
      Location location = Location();
      LocationData? currentLocation;

      try {
        currentLocation = await location.getLocation();
        user.latitude = currentLocation.latitude!;
        user.longitude = currentLocation.longitude!;
        locationController.text =
            "${user.latitude.toString()}, ${user.longitude.toString()}";
      } catch (e) {
        print("Error getting location: $e");
      }
    }
  }

  Future<void> registerUser() async {
    try {
      // Step 1: Create user in Firebase Authentication
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      // Step 2: Create a new user document in Firestore
      await FirebaseFirestore.instance
          .collection('technician_users')
          .doc(userCredential.user!.uid)
          .set(user.toMap());

      print('User registered successfully.');
    } catch (e) {
      print('Error registering user: $e');
    }
  }

  }
