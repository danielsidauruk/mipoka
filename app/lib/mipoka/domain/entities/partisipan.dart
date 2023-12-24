import 'package:equatable/equatable.dart';

class Partisipan extends Equatable{
  final int idPartisipan;
  final String noInduk;
  final String namaPartisipan;
  final String nik;
  final String tempatLahir;
  final String tglLahir;
  final String peranPartisipan;
  final String dasarPengiriman;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const Partisipan({
    required this.idPartisipan,
    required this.noInduk,
    required this.namaPartisipan,
    required this.nik,
    required this.tempatLahir,
    required this.tglLahir,
    required this.peranPartisipan,
    required this.dasarPengiriman,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  Partisipan copyWith({
    int? idPartisipan,
    String? noInduk,
    String? namaPartisipan,
    String? nik,
    String? tempatLahir,
    String? tglLahir,
    String? peranPartisipan,
    String? dasarPengiriman,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      Partisipan(
        idPartisipan: idPartisipan ?? this.idPartisipan,
        noInduk: noInduk ?? this.noInduk,
        namaPartisipan: namaPartisipan ?? this.namaPartisipan,
        nik: nik ?? this.nik,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        tglLahir: tglLahir ?? this.tglLahir,
        peranPartisipan: peranPartisipan ?? this.peranPartisipan,
        dasarPengiriman: dasarPengiriman ?? this.dasarPengiriman,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idPartisipan,
    noInduk,
    namaPartisipan,
    nik,
    tempatLahir,
    tglLahir,
    peranPartisipan,
    dasarPengiriman,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];
}
