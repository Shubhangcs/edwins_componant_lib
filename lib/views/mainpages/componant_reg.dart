import 'package:edwins_componant_lib/views/subpages/componants_add.dart';
import 'package:edwins_componant_lib/views/mainpages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ComponantRegister extends StatelessWidget {
  const ComponantRegister({super.key});

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
                          'Componants',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w400),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 230,
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 50),
                      child: Lottie.network(
                          'https://assets3.lottiefiles.com/packages/lf20_nv3lkb9v.json'),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 50),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            label: Text('Name')),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            label: Text('Phone')),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      width: double.infinity,
                      height: 65,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black),
                      child: GestureDetector(
                        child:const Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w200,
                                fontFamily: 'Quicksand',
                                ),
                          ),
                        ),
                        onTap: (){
                          Get.to(()=>const ComponantAdd());
                        },
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
