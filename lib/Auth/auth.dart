import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:patient_data_mobileapp/Auth/login.dart';
import 'package:patient_data_mobileapp/Auth/signup.dart';
import 'package:patient_data_mobileapp/main.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  AuthPage createState() => AuthPage();
}

class AuthPage extends State<Auth> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginScreen(onClickedSignUp: toggle)
      : SignUpScreen(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
