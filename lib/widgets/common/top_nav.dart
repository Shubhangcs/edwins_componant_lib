import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/home_page.dart';

class TopNav extends StatelessWidget {

final String title;
  const TopNav({super.key ,required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin:const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                    child:  Center(
                      child: Text(
                       title,
                        style:const TextStyle(
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
    );
  }
}
