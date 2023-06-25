import 'package:edwins_componant_lib/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 245, 245, 245),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin:const EdgeInsets.only(top: 20),
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
                height: 100,
                child: Lottie.network('https://assets10.lottiefiles.com/packages/lf20_wd1udlcz.json'),
              ),
              Container(
                margin:const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: TextField(
                  decoration: InputDecoration(
                      label:const Text('First Name'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                margin:const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: TextField(
                  decoration: InputDecoration(
                      label:const Text('Last Name'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                margin:const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: TextField(
                  decoration: InputDecoration(
                      label:const Text('Email'),
                      hintText: 'example@gmail.com',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                margin:const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: TextField(
                  decoration: InputDecoration(
                      label:const Text('Password'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 32, right: 32, top: 20),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Login'),
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
                    Get.to(()=> const LoginPage());
                  },
                )
              ])
            ],
          ),
        ),
      ),
    );;
  }
}