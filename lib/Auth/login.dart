import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:patient_data_mobileapp/main.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onClickedSignUp;

  LoginScreen({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final _textEmail = TextEditingController();
  final _textPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Expanded(child: Image.asset('assets/images/logo.png')),
//
                const SizedBox(
                  height: 20,
                ),
//
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: _textEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid Email'
                            : null,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      icon: const Icon(Icons.email),
                      label: const Text("Email"),
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
                ),
//
                const SizedBox(
                  height: 20,
                ),
//
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: _textPassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 3
                        ? 'Incorrect password, please check again'
                        : null,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.password),
                        label: const Text("Password"),
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
                ),
//
                const SizedBox(
                  height: 20,
                ),
//
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontStyle: FontStyle.normal),
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  icon: const Icon(Icons.login),
                  label: const Text("Login"),
                  onPressed: () async {
                    final isValid = formKey.currentState!.validate();
                    if (!isValid) return;

                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) =>
                            const Center(child: CircularProgressIndicator()));

                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _textEmail.text.trim(),
                        password: _textPassword.text.trim(),
                      );
                    } on FirebaseAuthException catch (e) {
                      // ignore: avoid_print
                      print(e);
                    }

                    // Navigator.of(context) not Working!
                    navigatorKey.currentState!
                        .popUntil((route) => route.isFirst);
                  },
                ),
//
                const SizedBox(
                  height: 20,
                ),
//
                RichText(
                    text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        text: 'No account?  ',
                        children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = onClickedSignUp,
                          text: 'Sign Up',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).colorScheme.secondary))
                    ])),
//
                const SizedBox(
                  height: 40,
                ),
//
              ],
            ),
          ),
        ));
  }
}
