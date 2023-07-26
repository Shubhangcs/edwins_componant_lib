import 'package:edwins_componant_lib/views/contact/contact.dart';
import 'package:edwins_componant_lib/views/materials/material_main.dart';
import 'package:edwins_componant_lib/views/operating_systems/operating_system.dart';
import 'package:edwins_componant_lib/widgets/card_model.dart';
import 'package:edwins_componant_lib/widgets/top_menu.dart';
import 'package:flutter/material.dart';
import 'componants/componants_add.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          children: [
            const TopMenu(),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      child: const CardModel(
                        title: 'Components',
                        subtitle: 'Hardware',
                        imagepath: 'assets/componants.png',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ComponantAdd()),
                        );
                      },
                    ),
                    GestureDetector(
                      child: const CardModel(
                        title: 'Operating Systems',
                        subtitle: 'Software',
                        imagepath: 'assets/operating_systems.png',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OsPage()),
                        );
                      },
                    ),
                    GestureDetector(
                      child: const CardModel(
                        title: 'Materials',
                        subtitle: 'Books and References',
                        imagepath: 'assets/materials.png',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MaterialMain()),
                        );
                      },
                    ),
                    GestureDetector(
                      child: const CardModel(
                        title: 'Contact Us',
                        subtitle: 'Help',
                        imagepath: 'assets/contact_us.png',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContactUs()),
                        );
                      },
                    ),
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
