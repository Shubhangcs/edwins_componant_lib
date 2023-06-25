import 'package:edwins_componant_lib/views/componants/componant_reg.dart';
import 'package:edwins_componant_lib/views/operating_systems/os_page.dart';
import 'package:edwins_componant_lib/widgets/main_page/card_model.dart';
import 'package:edwins_componant_lib/widgets/componants/top_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: Column(
            children: [
              TopMenu(),
              Expanded(
                child: Container(
                 margin: EdgeInsets.only(top: 40),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30) , topRight: Radius.circular(30),),
                       color: Colors.white,
                    ),
                  child: Column(
                    children: [
                       GestureDetector(child: const CardModel(title: 'Componants' , subtitle: 'Hardware' , imagepath: 'assets/componants.png',) , onTap: () {Get.to(()=>const ComponantRegister());},),
                      GestureDetector(child: const CardModel(title: 'Operating Systems',subtitle: 'Software',imagepath: 'assets/operating_systems.png',), onTap: (){Get.to(()=>const OsPage());},),
                       GestureDetector(child: const CardModel(title: 'Materials',subtitle: 'Books and References',imagepath: 'assets/materials.png',), onTap: (){Get.to(()=>const ComponantRegister());},),
                       GestureDetector(child: const CardModel(title: 'Contact Us',subtitle: 'Help',imagepath: 'assets/contact_us.png',), onTap: (){Get.to(()=>const ComponantRegister());},),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        );
  }
}