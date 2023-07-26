import 'package:edwins_componant_lib/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class OsPage extends StatelessWidget {
  const OsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopNav(title: "OS Page")
          ],
        ),
      ),
    );
  }
}
