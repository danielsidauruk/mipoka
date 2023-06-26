import 'package:equatable/equatable.dart';

// Just updated 26 / 06 / 2023
class Partisipan extends Equatable {
  final int idPartisipan;
  final String noInduk;
  final String namaPartisipan;
  final String nik;
  final String tempatLahir;
  final DateTime tglLahir;
  final String peranPartisipan;
  final String dasarPengiriman;

  const Partisipan({
    required this.idPartisipan,
    required this.noInduk,
    required this.namaPartisipan,
    required this.nik,
    required this.tempatLahir,
    required this.tglLahir,
    required this.peranPartisipan,
    required this.dasarPengiriman,
  });

  Partisipan copyWith({
    int? idPartisipan,
    String? noInduk,
    String? namaPartisipan,
    String? nik,
    String? tempatLahir,
    DateTime? tglLahir,
    String? peranPartisipan,
    String? dasarPengiriman,
  }) {
    return Partisipan(
      idPartisipan: idPartisipan ?? this.idPartisipan,
      noInduk: noInduk ?? this.noInduk,
      namaPartisipan: namaPartisipan ?? this.namaPartisipan,
      nik: nik ?? this.nik,
      tempatLahir: tempatLahir ?? this.tempatLahir,
      tglLahir: tglLahir ?? this.tglLahir,
      peranPartisipan: peranPartisipan ?? this.peranPartisipan,
      dasarPengiriman: dasarPengiriman ?? this.dasarPengiriman,
    );
  }

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
  ];
}
