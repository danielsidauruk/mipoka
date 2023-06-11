import 'package:mipoka/mipoka/domain/entities/berita.dart';

class BeritaModel extends Berita {
  const BeritaModel({
    required int idBerita,
    required String jenisKegiatan,
    required String penulis,
    required String gambar,
    required String teks,
  }) : super(
    idBerita: idBerita,
    jenisKegiatan: jenisKegiatan,
    penulis: penulis,
    gambar: gambar,
    teks: teks,
  );

  factory BeritaModel.fromJson(Map<String, dynamic> json) {
    return BeritaModel(
      idBerita: json['idBerita'] as int,
      jenisKegiatan: json['jenisKegiatan'] as String,
      penulis: json['penulis'] as String,
      gambar: json['gambar'] as String,
      teks: json['teks'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idBerita': idBerita,
      'jenisKegiatan': jenisKegiatan,
      'penulis': penulis,
      'gambar': gambar,
      'teks': teks,
    };
  }
}
