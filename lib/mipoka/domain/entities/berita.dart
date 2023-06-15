import 'package:equatable/equatable.dart';
import 'package:mipoka/mipoka/data/models/berita_model.dart';

class Berita extends Equatable {
  final int idBerita;
  final String jenisKegiatan;
  final String penulis;
  final String gambar;
  final String teks;

  const Berita({
    required this.idBerita,
    required this.jenisKegiatan,
    required this.penulis,
    required this.gambar,
    required this.teks,
  });

  @override
  List<Object?> get props => [
    idBerita,
    jenisKegiatan,
    penulis,
    gambar,
    teks,
  ];

  BeritaModel toBeritaModel() {
    return BeritaModel(
      idBerita: idBerita,
      jenisKegiatan: jenisKegiatan,
      penulis: penulis,
      gambar: gambar,
      teks: teks,
    );
  }
}
