import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LEDexperiment extends StatefulWidget {
  @override
  _LEDexperimentState createState() => _LEDexperimentState();
}

class _LEDexperimentState extends State<LEDexperiment> {
  int _selectedPdfIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _openPdf(int index) {
    setState(() {
      _selectedPdfIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> pdfPaths = [
      'assets/pdf/LED1.pdf',
      'assets/pdf/LED2.pdf',
      'assets/pdf/LED3.pdf',
      'assets/pdf/LED4.pdf',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('LED Experiments'),
        actions: [
          TextButton(
            onPressed: () => _openPdf(0),
            child: Text(
              'PDF 1',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () => _openPdf(1),
            child: Text(
              'PDF 2',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () => _openPdf(2),
            child: Text(
              'PDF 3',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () => _openPdf(3),
            child: Text(
              'PDF 4',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: SfPdfViewer.asset(
        pdfPaths[_selectedPdfIndex],
        pageLayoutMode: PdfPageLayoutMode.continuous,
        scrollDirection: PdfScrollDirection.vertical,
        enableDoubleTapZooming: true,
      ),
    );
  }
}
