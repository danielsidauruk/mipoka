import 'package:mipoka/mipoka/domain/entities/partisipan.dart';

// => Just Updated
class PartisipanModel extends Partisipan {
  const PartisipanModel({
    required super.idPartisipan,
    required super.nim,
    required super.namaLengkap,
    required super.nik,
    required super.tempatLahir,
    required super.tglLahir,
    required super.peran,
    required super.dasarKirim,
  });

  factory PartisipanModel.fromEntity(Partisipan partisipan) {
    return PartisipanModel(
      idPartisipan: partisipan.idPartisipan,
      nim: partisipan.nim,
      namaLengkap: partisipan.namaLengkap,
      nik: partisipan.nik,
      tempatLahir: partisipan.tempatLahir,
      tglLahir: partisipan.tglLahir,
      peran: partisipan.peran,
      dasarKirim: partisipan.dasarKirim,
    );
  }

  factory PartisipanModel.fromJson(Map<String, dynamic> json) => PartisipanModel(
    idPartisipan: json["idPartisipan"],
    nim: json["nim"],
    namaLengkap: json["namaLengkap"],
    nik: json["nik"],
    tempatLahir: json["tempatLahir"],
    tglLahir: DateTime.parse(json["tglLahir"]),
    peran: json["peran"],
    dasarKirim: json["dasarKirim"],
  );

  Map<String, dynamic> toJson() => {
    "idPartisipan": idPartisipan,
    "nim": nim,
    "namaLengkap": namaLengkap,
    "nik": nik,
    "tempatLahir": tempatLahir,
    "tglLahir": "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
    "peran": peran,
    "dasarKirim": dasarKirim,
  };
}
