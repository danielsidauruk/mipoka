import 'package:equatable/equatable.dart';

class Notifikasi extends Equatable{
  final int idNotifikasi;
  final String teksNotifikasi;
  final String tglNotifikasi;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;

  const Notifikasi({
    required this.idNotifikasi,
    required this.teksNotifikasi,
    required this.tglNotifikasi,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  Notifikasi copyWith({
    int? idNotifikasi,
    String? teksNotifikasi,
    String? tglNotifikasi,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
  }) =>
      Notifikasi(
        idNotifikasi: idNotifikasi ?? this.idNotifikasi,
        teksNotifikasi: teksNotifikasi ?? this.teksNotifikasi,
        tglNotifikasi: tglNotifikasi ?? this.tglNotifikasi,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  @override
  List<Object?> get props => [
    idNotifikasi,
    teksNotifikasi,
    tglNotifikasi,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy
  ];
}
