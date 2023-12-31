import 'dart:convert';
import 'package:edwins_componant_lib/views/home_page.dart';
import 'package:edwins_componant_lib/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final TextEditingController emailController = TextEditingController();
final String email = emailController.text;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordController = TextEditingController();
  final bool _isNotValid = false;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    if (emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      var regBody = {
        "email": emailController.text,
        "password": _passwordController.text,
      };
      var response = await http.post(
        Uri.parse(login),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status']) {
        var myToken = jsonResponse['token'];
        prefs.setString('token', myToken);

        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        setState(
          () {
            var snackBar = SnackBar(
              content: const Text(
                'User doesn\'t exist',
                style: TextStyle(color: Colors.black),
              ),
              action: SnackBarAction(
                label: 'Register',
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                },
              ),
              backgroundColor: Colors.white,
              elevation: 10,
              behavior: SnackBarBehavior.floating,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    'Hello',
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.w300,
                      fontSize: 50,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: LottieBuilder.asset('assets/animation_lko0y083.json')),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      label: const Text('Email'),
                      hintText: 'example@gmail.com',
                      errorText: _isNotValid ? "Enter your mail" : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      label: const Text('Password'),
                      errorText: _isNotValid ? "Enter the password" : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 32, right: 32, top: 20),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    loginUser();
                  },
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have account '),
                  GestureDetector(
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
