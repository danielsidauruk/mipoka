import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:docx_template/docx_template.dart';
import 'package:http/http.dart' as http;


Future<void> fillDocxTemplate() async {
  final templateBytes = await rootBundle.load('assets/docx_template/usulan_template.docx');
  final docx = await DocxTemplate.fromBytes(templateBytes.buffer.asUint8List());

  // final content = Content()
  //   ..add(TextContent("nama_klien", "Daniel Hamonangan Sidauruk",))
  //   ..add(TextContent("nama_proyek", "MIPOKA"))
  //   ..add(TextContent("deskripsi", "Isi Dokumen"))
  //   ..add(TextContent("harga", "Rp. 500.000"))
  //   ..add(TextContent("nama_perusahaan", "PT. Mikroskil Jaya"));

  final data = Content()
    ..add(TextContent('nama_klien', 'Daniel Hamonangan Sidauruk'))
    ..add(TextContent('nama_proyek', 'MIPOKA'))
    ..add(TextContent('deskripsi', 'Isi Dokumen'))
    ..add(TextContent('harga', 'Rp. 500.000'))
    ..add(TextContent('nama_perusahaan', 'PT. Mikroskil Jaya'));

  // Generate the filled docx document
  final generatedDocx = await docx.generate(data);

  // Generate the filled docx document
  final directory = await getTemporaryDirectory();
  final outputPath = '${directory.path}/output.docx';
  final outputFile = File(outputPath);
  await outputFile.writeAsBytes(generatedDocx!);

  const storageUrl = 'https://storage.googleapis.com/usulan_kegiatan_output/usulan_kegiatan_output.docx';
  final uploadResponse = await http.put(Uri.parse(storageUrl), body: await outputFile.readAsBytes());
  if (uploadResponse.statusCode == 200) {
    print('File uploaded successfully');
  } else {
    print('File upload failed');
  }
}
