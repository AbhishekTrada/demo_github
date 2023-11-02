
import 'package:demo_github/Modules/Auth/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void initState(){
    super.initState();
    emailController.text == "";
    passwordController.text = "";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        elevation: 3.0,
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
          const SizedBox(height: 30.0,),
          InkWell(
            onTap: (){
              if (validation() == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Successfully Signup"),
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()),
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
                  borderRadius: BorderRadius.circular(10.0)
              ),
              height: 50,
              width: 250,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: const Text('Login'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 80.0),
            child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupScreen()),
                    );
                  },
                  child: const Text('Signup',
                    style: TextStyle(
                        fontSize: 15.0
                    ),),
                )),
          ),
        ],
      ),
    );
  }
  bool validation() {
    if (emailController.text.isEmpty) {
      const snackBar =  SnackBar(
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
