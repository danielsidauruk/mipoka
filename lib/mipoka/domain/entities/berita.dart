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

  Berita updateWith({
    int? idBerita,
    String? jenisKegiatan,
    String? penulis,
    String? gambar,
    String? teks,
  }) {
    return Berita(
      idBerita: idBerita ?? this.idBerita,
      jenisKegiatan: jenisKegiatan ?? this.jenisKegiatan,
      penulis: penulis ?? this.penulis,
      gambar: gambar ?? this.gambar,
      teks: teks ?? this.teks,
    );
  }

  @override
  List<Object?> get props => [
    idBerita,
    jenisKegiatan,
    penulis,
    gambar,
    teks,
  ];
}
