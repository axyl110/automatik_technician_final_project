import 'package:automatik_technician_final_project/models/user_model.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  UserModel user = UserModel(
    firstName: '',
    lastName: '',
    email: '',
    phoneNumber: '',
    password: '',
  );
  void updateUserInfor(UserModel updateUser) {
    user = updateUser;
  }

  void registerUser() {}
}
