import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatefulWidget {
  final String url;
  const PdfView({required this.url});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF View'),
      ),
      body: Container(
        child: SfPdfViewer.network(
          widget.url,
          controller: PdfViewerController(),
          onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
            print(details.error);
          }
        ),
      )
      );
  }
}