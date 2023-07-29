import 'package:edwins_componant_lib/views/materials/material_main.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatefulWidget {
  final String link;
  final String title;
  const PdfView({super.key, required this.link , required this.title});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {


  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        title: Text(
          widget.title,
          style:const TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          child:const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const MaterialMain()),
            );
          },
        ),
      ),
      body: SfPdfViewer.network(widget.link, enableHyperlinkNavigation: true),
    ));
  }
}
