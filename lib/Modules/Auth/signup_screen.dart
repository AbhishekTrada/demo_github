import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.text == "";
    passwordController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
        centerTitle: true,
        elevation: 3.0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          InkWell(
            onTap: () {
              if (validation() == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Successfully Signup"),
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              } else {
                const SnackBar(
                  content: Text('Enter a Password'),
                );
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0)),
              height: 50,
              width: 250,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: const Text('Sign up'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 80.0),
            child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 15.0),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  bool validation() {
    if (emailController.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text('Enter a Email'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
    if (passwordController.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text('Enter a Password'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
    return true;
  }

}
