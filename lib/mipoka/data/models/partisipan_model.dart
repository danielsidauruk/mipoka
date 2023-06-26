import 'package:mipoka/mipoka/domain/entities/partisipan.dart';

// => Just Updated
class PartisipanModel extends Partisipan {
  const PartisipanModel({
    required super.idPartisipan,
    required super.noInduk,
    required super.namaPartisipan,
    required super.nik,
    required super.tempatLahir,
    required super.tglLahir,
    required super.peranPartisipan,
    required super.dasarPengiriman,
  });

  factory PartisipanModel.fromEntity(Partisipan partisipan) {
    return PartisipanModel(
      idPartisipan: partisipan.idPartisipan,
      noInduk: partisipan.noInduk,
      namaPartisipan: partisipan.namaPartisipan,
      nik: partisipan.nik,
      tempatLahir: partisipan.tempatLahir,
      tglLahir: partisipan.tglLahir,
      peranPartisipan: partisipan.peranPartisipan,
      dasarPengiriman: partisipan.dasarPengiriman,
    );
  }

  factory PartisipanModel.fromJson(Map<String, dynamic> json) => PartisipanModel(
    idPartisipan: json["id_partisipan"],
    noInduk: json["no_induk"],
    namaPartisipan: json["nama_partisipan"],
    nik: json["nik"],
    tempatLahir: json["tempat_lahir"],
    tglLahir: json["tgl_lahir"],
    peranPartisipan: json["peran_partisipan"],
    dasarPengiriman: json["dasar_pengiriman"],
  );

  Map<String, dynamic> toJson() => {
    "id_partisipan": idPartisipan,
    "no_induk": noInduk,
    "nama_partisipan": namaPartisipan,
    "nik": nik,
    "tempat_lahir": tempatLahir,
    "tgl_lahir": tglLahir,
    "peran_partisipan": peranPartisipan,
    "dasar_pengiriman": dasarPengiriman,
  };
}
