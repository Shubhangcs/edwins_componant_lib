import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:edwins_componant_lib/constants.dart';
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
  List books = [];

  @override
  void initState() {
    super.initState();
    getMaterials();
  }

  Future<void> getMaterials() async {
    final response = await http.get(Uri.parse(materials));
    final res = jsonDecode(response.body);
    setState(() {
      books = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            const TopNav(title: 'Materials'),
            Container(
              child: Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child:  CardModel(
                        title: books[index]['name'],
                        subtitle: books[index]['name'],
                        imagepath: "assets/1489798288.png"),
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PdfView(link: books[index]['link']),
                          ),
                        );
                      });
                    },
                  );
                },
                itemCount: books.length,
              )),
            ),
          ],
        ),
      )),
    );
  }
}
