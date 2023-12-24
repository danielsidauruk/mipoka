import 'package:equatable/equatable.dart';

class Berita extends Equatable {
  final int idBerita;
  final String judul;
  final String penulis;
  final String gambar;
  final String teks;
  final String tglTerbit;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const Berita({
    required this.idBerita,
    required this.judul,
    required this.penulis,
    required this.gambar,
    required this.teks,
    required this.tglTerbit,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  Berita copyWith({
    int? idBerita,
    String? judul,
    String? penulis,
    String? gambar,
    String? teks,
    String? tglTerbit,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      Berita(
        idBerita: idBerita ?? this.idBerita,
        judul: judul ?? this.judul,
        penulis: penulis ?? this.penulis,
        gambar: gambar ?? this.gambar,
        teks: teks ?? this.teks,
        tglTerbit: tglTerbit ?? this.tglTerbit,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idBerita,
    judul,
    penulis,
    gambar,
    teks,
    tglTerbit,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}