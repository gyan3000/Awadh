import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LEDexperiment extends StatefulWidget {
  const LEDexperiment({Key? key}) : super(key: key);
  @override
  _LEDexperimentState createState() => _LEDexperimentState();
}

class _LEDexperimentState extends State<LEDexperiment> {
  int _selectedPdfIndex = 0;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  late PdfViewerController _pdfViewerController;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  void _openPdf(int index) {
    setState(() {
      _selectedPdfIndex = index;
    });
  }

  void _zoomIn() {
    _pdfViewerController.zoomLevel = _pdfViewerController.zoomLevel + 0.5;
  }

  void _zoomOut() {
    _pdfViewerController.zoomLevel = _pdfViewerController.zoomLevel - 0.5;
  }

  @override
  Widget build(BuildContext context) {
    List<String> pdfUrls = [
      'assets/pdf/LED1.pdf',
      'assets/pdf/LED2.pdf',
      'assets/pdf/LED3.pdf',
      'assets/pdf/LED4.pdf'
      // 'https://drive.google.com/uc?export=view&id=1XJmkj5y95kYLwkPF51hg0iT4ggimF-pz',
      // 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
      // 'https://drive.google.com/uc?export=view&id=1wGvoUSi97wJkYJctDgECdC5sQBM3wmcq',
      // 'https://drive.google.com/uc?export=view&id=1cG06GbN6__ilWUUgxnQwLCNJUnt-Bl9e',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('LED and Button Experiments'),
        actions: [
          TextButton(
            onPressed: () => _openPdf(0),
            child: Text(
              'EXP 1',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () => _openPdf(1),
            child: Text(
              'EXP 2',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () => _openPdf(2),
            child: Text(
              'EXP 3',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () => _openPdf(3),
            child: Text(
              'EXP 4',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SfPdfViewer.asset(
              pdfUrls[_selectedPdfIndex],
              key: _pdfViewerKey,
              controller: _pdfViewerController,
              pageLayoutMode: PdfPageLayoutMode.single,
              scrollDirection: PdfScrollDirection.vertical,
              enableTextSelection: true,
              onDocumentLoaded: (details) => print(details),
              onDocumentLoadFailed: (details) => print(details.description),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/images/zoom_out.png'),
                ),
                onPressed: _zoomOut,
              ),
              SizedBox(width: 10),
              IconButton(
                icon: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/images/zoom_in.png'),
                ),
                onPressed: _zoomIn,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
