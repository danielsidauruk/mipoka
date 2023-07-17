import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/partisipan.dart';
import 'package:mipoka/mipoka/domain/entities/tertib_acara.dart';

class PartisipanArgs {
  final Partisipan partisipan;
  final int id;

  PartisipanArgs({
    required this.partisipan, 
    required this.id,
  });
}

class BiayaKegiatanArgs {
  final BiayaKegiatan biayaKegiatan;
  final int id;

  BiayaKegiatanArgs({
    required this.biayaKegiatan,
    required this.id,
  });
}

class TertibAcaraArgs {
  final TertibAcara tertibAcara;
  final int id;

  TertibAcaraArgs({
    required this.tertibAcara,
    required this.id,
  });
}

class UsulanArgs {
  final int idUsulan;
  final bool isRevisiUsulan;

  UsulanArgs({
    required this.idUsulan,
    this.isRevisiUsulan = false,
  });
}
