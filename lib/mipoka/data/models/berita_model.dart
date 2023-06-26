import 'package:mipoka/mipoka/domain/entities/berita.dart';

class BeritaModel extends Berita {
  const BeritaModel({
    required super.idBerita,
    required super.judul,
    required super.penulis,
    required super.gambar,
    required super.teks,
    required super.tglTerbit,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
  });

  factory BeritaModel.fromEntity(Berita berita) {
    return BeritaModel(
      idBerita: berita.idBerita,
      judul: berita.judul,
      penulis: berita.penulis,
      gambar: berita.gambar,
      teks: berita.teks,
      tglTerbit: berita.tglTerbit,
      createdAt: berita.createdAt,
      createdBy: berita.createdBy,
      updatedAt: berita.updatedAt,
      updatedBy: berita.updatedBy,
    );
  }

  factory BeritaModel.fromJson(Map<String, dynamic> json) => BeritaModel(
    idBerita: json["id_berita"],
    judul: json["judul"],
    penulis: json["penulis"],
    gambar: json["gambar"],
    teks: json["teks"],
    tglTerbit: json["tgl_terbit"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id_berita": idBerita,
    "judul": judul,
    "penulis": penulis,
    "gambar": gambar,
    "teks": teks,
    "tgl_terbit": tglTerbit,
    "created_at": createdAt,
    "created_by": createdBy,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
  };
}
