import 'package:equatable/equatable.dart';

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
}
