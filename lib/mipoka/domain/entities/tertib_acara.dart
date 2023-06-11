import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TertibAcara extends Equatable {
  final int idTertibAcara;
  final TimeOfDay waktuMulai;
  final TimeOfDay waktuSelesai;
  final String aktivitas;
  final String keterangan;

  TertibAcara({
    required this.idTertibAcara,
    required this.waktuMulai,
    required this.waktuSelesai,
    required this.aktivitas,
    required this.keterangan,
  });

  @override
  List<Object?> get props => [
    idTertibAcara,
    waktuMulai,
    waktuSelesai,
    aktivitas,
    keterangan,
  ];
}
