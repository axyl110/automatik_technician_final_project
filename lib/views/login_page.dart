import 'package:automatik_technician_final_project/controller/login_controller.dart';
import 'package:automatik_technician_final_project/views/registration_page.dart';
import 'package:automatik_technician_final_project/views/dashboard_page.dart';
import 'package:automatik_technician_final_project/widgets/button.dart';
import 'package:automatik_technician_final_project/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/validators.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Image.asset('assets/LOGO.png'),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailTextEditingController,
                    validator: UnifiedValidators.emailValidator,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.blueAccent),
                    decoration: kTextFieldDecoration.copyWith(
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email),
                    ),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordTextEditingController,
                    validator: UnifiedValidators.passwordValidator,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    style: const TextStyle(color: Colors.blueAccent),
                    decoration: kTextFieldDecoration.copyWith(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    onChanged: (value) {},
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    child: RoundedButton(
                      buttonTitle: 'LOGIN',
                      color: Colors.blueAccent,
                      buttonOnPressed: () async {
                        final email = emailTextEditingController.text.trim();
                        final password =
                            passwordTextEditingController.text.trim();

                        if (email.isNotEmpty && password.isNotEmpty) {
                          // Call the login function from the controller
                          final loginSuccess = await controller.loginUser(email, password);

                          if (loginSuccess) {
                            // Navigate to the dashboard page
                            Get.off(() => DashboardPage());
                          } else {
                            // Handle login failure
                            // You can show an error message or perform other actions here
                          }
                        } else {
                          // Handle empty email or password
                          // You can show an error message or perform other actions here
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You want to create an account?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextButton(
                        child: Text(
                          "Register here",
                          style: TextStyle(color: Colors.grey[850]),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationPage(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}