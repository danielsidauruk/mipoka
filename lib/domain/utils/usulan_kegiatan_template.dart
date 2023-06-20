import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:docx_template/docx_template.dart';
import 'package:http/http.dart' as http;


// Future<void> fillDocxTemplate() async {
//   final templateBytes = await rootBundle.load('assets/docx_template/usulan_template.docx');
//   final docx = await DocxTemplate.fromBytes(templateBytes.buffer.asUint8List());
//
//   final data = Content()
//     ..add(TextContent('nama_klien', 'Daniel Hamonangan Sidauruk'))
//     ..add(TextContent('nama_proyek', 'MIPOKA'))
//     ..add(TextContent('deskripsi', 'Isi Dokumen'))
//     ..add(TextContent('harga', 'Rp. 500.000'))
//     ..add(TextContent('nama_perusahaan', 'PT. Mikroskil Jaya'));
//
//   // Generate the filled docx document
//   final generatedDocx = await docx.generate(data);
//
//   // Generate the filled docx document
//   if (generatedDocx != null) {
//     // Write the generated docx document to file
//     final directory = await getTemporaryDirectory();
//     final outputPath = '${directory.path}/usulan_kegiatan_output_01.docx';
//     final outputFile = File(outputPath);
//     await outputFile.writeAsBytes(generatedDocx);
//
//     const storageUrl = 'https://storage.googleapis.com/usulan_kegiatan_output/usulan_kegiatan_output.docx';
//     final uploadResponse = await http.put(Uri.parse(storageUrl), body: await outputFile.readAsBytes());
//     if (uploadResponse.statusCode == 200) {
//       print('File uploaded successfully');
//     } else {
//       print('File upload failed');
//     }
//   }
//
// }

void fillDocxTemplate() async {
  final f = File("assets/docx_template/template.docx");
  final docx = await DocxTemplate.fromBytes(await f.readAsBytes());

  /*
    Or in the case of Flutter, you can use rootBundle.load, then get bytes

    final data = await rootBundle.load('lib/assets/users.docx');
    final bytes = data.buffer.asUint8List();

    final docx = await DocxTemplate.fromBytes(bytes);
  */

  // Load test image for inserting in docx
  final testFileContent = await File('assets/docx_template/test.jpg').readAsBytes();

  final listNormal = ['Foo', 'Bar', 'Baz'];
  final listBold = ['ooFPlop', 'raB', 'zaB'];

  final contentList = <Content>[];

  final b = listBold.iterator;
  for (var n in listNormal) {
    b.moveNext();

    final c = PlainContent("value")
      ..add(TextContent("normal", n))
      ..add(TextContent("bold", b.current));
    contentList.add(c);
  }

  Content content = Content();
  content
    ..add(TextContent("docname", "Simple docname"))
    ..add(TextContent("passport", "Passport NE0323 4456673"))
    ..add(TableContent("table", [
      RowContent()
        ..add(TextContent("key1", "Paul"))
        ..add(TextContent("key2", "Viberg"))
        ..add(TextContent("key3", "Engineer"))
        ..add(ImageContent('img', testFileContent)),
      RowContent()
        ..add(TextContent("key1", "Alex"))
        ..add(TextContent("key2", "Houser"))
        ..add(TextContent("key3", "CEO & Founder"))
        ..add(ListContent("tablelist", [
          TextContent("value", "Mercedes-Benz C-Class S205"),
          TextContent("value", "Lexus LX 570")
        ]))
        ..add(ImageContent('img', testFileContent))
    ]))
    ..add(ListContent("list", [
      TextContent("value", "Engine")
        ..add(ListContent("listnested", contentList)),
      TextContent("value", "Gearbox"),
      TextContent("value", "Chassis")
    ]))
    ..add(ListContent("plainlist", [
      PlainContent("plainview")
        ..add(TableContent("table", [
          RowContent()
            ..add(TextContent("key1", "Paul"))
            ..add(TextContent("key2", "Viberg"))
            ..add(TextContent("key3", "Engineer")),
          RowContent()
            ..add(TextContent("key1", "Alex"))
            ..add(TextContent("key2", "Houser"))
            ..add(TextContent("key3", "CEO & Founder"))
            ..add(ListContent("tablelist", [
              TextContent("value", "Mercedes-Benz C-Class S205"),
              TextContent("value", "Lexus LX 570")
            ]))
        ])),
      PlainContent("plainview")
        ..add(TableContent("table", [
          RowContent()
            ..add(TextContent("key1", "Nathan"))
            ..add(TextContent("key2", "Anceaux"))
            ..add(TextContent("key3", "Music artist"))
            ..add(ListContent(
                "tablelist", [TextContent("value", "Peugeot 508")])),
          RowContent()
            ..add(TextContent("key1", "Louis"))
            ..add(TextContent("key2", "Houplain"))
            ..add(TextContent("key3", "Music artist"))
            ..add(ListContent("tablelist", [
              TextContent("value", "Range Rover Velar"),
              TextContent("value", "Lada Vesta SW Sport")
            ]))
        ])),
    ]))
    ..add(ListContent("multilineList", [
      PlainContent("multilinePlain")
        ..add(TextContent('multilineText', 'line 1')),
      PlainContent("multilinePlain")
        ..add(TextContent('multilineText', 'line 2')),
      PlainContent("multilinePlain")
        ..add(TextContent('multilineText', 'line 3'))
    ]))
    ..add(TextContent('multilineText2', 'line 1\nline 2\n line 3'))
    ..add(ImageContent('img', testFileContent));

  final docGenerated = await docx.generate(content);
  final fileGenerated = File('generated.docx');
  if (docGenerated != null) await fileGenerated.writeAsBytes(docGenerated);

  const storageUrl = 'https://storage.googleapis.com/usulan_kegiatan_output/usulan_kegiatan_output.docx';
  final uploadResponse = await http.put(Uri.parse(storageUrl), body: await fileGenerated.readAsBytes());
  if (uploadResponse.statusCode == 200) {
    print('File uploaded successfully');
  } else {
    print('File upload failed');
  }
}
