import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import '';
//
// // void showPDFViewer(BuildContext context, String pdfLink) {
// //   showDialog(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return AlertDialog(
// //         content: SizedBox(
// //           width: double.maxFinite,
// //           height: 300,
// //           child: SfPdfViewer.network(pdfLink),
// //         ),
// //       );
// //     },
// //   );
// // }
//
// Future<void> loadPdf() async {
//   const url = 'https://storage.googleapis.com/usulan_kegiatan_output/cheatsheet-gcp-A4.pdf';
//   final response = await http.get(Uri.parse(url));
//
//   if (response.statusCode == 200) {
//     setState(() {
//       document = await PDFDocument.openData(response.bodyBytes);
//       isLoading = false;
//     });
//   }
// }

class CustomPdfViewer extends StatelessWidget {
  final String pdfUrl;

  const CustomPdfViewer({super.key, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: SfPdfViewer.network(
        pdfUrl,
      ),
    );
  }
}

