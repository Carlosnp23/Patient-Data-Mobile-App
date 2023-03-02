import 'package:flutter/material.dart';
import 'package:patient_data_mobileapp/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.cyan),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _textEmail = TextEditingController();
  final _textPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            const Expanded(
              child: Center(
                child: Text("LOGO"),
              ),
            ),

            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    // Clear whats currently in the textfield
                    _textEmail.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Password",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Clear whats currently in the textfield
                      _textPassword.clear();
                    },
                    icon: const Icon(Icons.clear),
                  )),
            ),
            ElevatedButton(
              child: const Text("Login"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Dashboard()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
