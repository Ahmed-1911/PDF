import 'package:flutter/material.dart';
import 'package:pdf/core/utils/constants.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewPage extends StatelessWidget {
  const PdfViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: SfPdfViewer.asset(Constants.pdfLink),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
