import 'dart:convert';
import 'package:edwins_componant_lib/constants.dart';
import 'package:edwins_componant_lib/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

TextEditingController nameController = TextEditingController();

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isNotValid = false;

  void registerUser() async {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty) {
      var regBody = {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      };

      var response = await http.post(
        Uri.parse(registration),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );
      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status']) {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      } else {
        setState(() {
          var snackBar = SnackBar(
            content: const Text('Email already exist' , style: TextStyle(color: Colors.black),),
            action: SnackBarAction(
              label: 'login',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
            backgroundColor: Colors.white,
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      }
    } else {
      setState(() {
        _isNotValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    'Welcome',
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
                height: 200,
                child: Lottie.asset('assets/animation_lko1atef.json')
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      label: const Text('Name'),
                      errorText: _isNotValid ? "Enter your name" : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      label: const Text('Email'),
                      hintText: 'example@gmail.com',
                      errorText: _isNotValid ? "Enter an email" : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      label: const Text('Password'),
                      errorText: _isNotValid ? "Enter a valid password" : null,
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
                    registerUser();
                  },
                  child: Text('Register'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('Already have an account '),
                GestureDetector(
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
