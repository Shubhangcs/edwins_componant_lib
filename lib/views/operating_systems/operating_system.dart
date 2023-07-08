import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_page.dart';

class OsPage extends StatelessWidget {
  const OsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                width: double.infinity,
                height: 80,
                child: Row(
                  children: [
                    SizedBox(
                      width: 75,
                      child: GestureDetector(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 8,
                          child: const Center(
                            child: Icon(Icons.arrow_back_ios_new_rounded),
                          ),
                        ),
                        onTap: () {
                          Get.back(result: const HomePage());
                        },
                      ),
                    ),
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 8,
                        child: const Center(
                          child: Text(
                            'Operating Systems',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
