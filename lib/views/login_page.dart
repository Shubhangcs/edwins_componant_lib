import 'package:edwins_componant_lib/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 245, 245, 245),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin:const EdgeInsets.only(top: 20),
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
                child: LottieBuilder.network(
                    'https://assets4.lottiefiles.com/private_files/lf30_iraugwwv.json'),
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
                const Text('Don\'t have account '),
                GestureDetector(
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    Get.to(()=> const RegisterPage());
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
