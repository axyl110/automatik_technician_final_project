import 'package:automatik_technician_final_project/views/login_page.dart';
import 'package:automatik_technician_final_project/views/registration_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/LOGO.png'),
              const SizedBox(height: 80),
              ConstrainedBox(
                constraints:
                    const BoxConstraints.tightFor(width: 320, height: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: const Size(320, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('LOGIN'),
                ),
              ),
                 const SizedBox(height: 20),
             ConstrainedBox(
                constraints:
                    const BoxConstraints.tightFor(width: 320, height: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    fixedSize: const Size(320, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('REGISTER'),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
