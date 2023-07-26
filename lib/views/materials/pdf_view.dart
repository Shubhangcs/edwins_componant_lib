import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatefulWidget {
  final String link;
  const PdfView({super.key ,required this.link });

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SfPdfViewer.network(widget.link),
    ));
  }
}