import 'package:mipoka/mipoka/domain/entities/biaya_kegiatan.dart';
import 'package:mipoka/mipoka/domain/entities/partisipan.dart';

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