import 'package:edwins_componant_lib/views/materials/pdf_view.dart';
import 'package:edwins_componant_lib/widgets/card_model.dart';
import 'package:edwins_componant_lib/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class MaterialMain extends StatefulWidget {
  const MaterialMain({super.key});

  @override
  State<MaterialMain> createState() => _MaterialMainState();
}

class _MaterialMainState extends State<MaterialMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            TopNav(title: 'Materials'),
            GestureDetector(
              child: CardModel(
                  title: "Python",
                  subtitle: "detail",
                  imagepath:
                      "https://static.realpython.com/python-basics-sample-chapters.png"),
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PdfView(
                          link:
                              "https://static.realpython.com/python-basics-sample-chapters.pdf"),
                    ),
                  );
                });
              },
            )
          ],
        ),
      )),
    );
  }
}
