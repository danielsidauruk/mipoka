import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PengajuanKegiatanEvent {}

class UpdateQty extends PengajuanKegiatanEvent {
  final int qty;

  UpdateQty(this.qty);
}

class UpdateHargaSatuan extends PengajuanKegiatanEvent {
  final int hargaSatuan;

  UpdateHargaSatuan(this.hargaSatuan);
}

class CalculateTotal extends PengajuanKegiatanEvent {}

class PengajuanKegiatanState {
  final int qty;
  final int hargaSatuan;
  final int total;

  PengajuanKegiatanState({
    required this.qty,
    required this.hargaSatuan,
    required this.total,
  });

  PengajuanKegiatanState copyWith({
    int? qty,
    int? hargaSatuan,
    int? total,
  }) {
    return PengajuanKegiatanState(
      qty: qty ?? this.qty,
      hargaSatuan: hargaSatuan ?? this.hargaSatuan,
      total: total ?? this.total,
    );
  }
}

class PengajuanKegiatanInitial extends PengajuanKegiatanState {
  PengajuanKegiatanInitial()
      : super(qty: 0, hargaSatuan: 0, total: 0);
}



class PengajuanKegiatanCubit extends Cubit<PengajuanKegiatanState> {
  PengajuanKegiatanCubit()
      : super(PengajuanKegiatanInitial());

  void updateQty(int qty) {
    emit(state.copyWith(qty: qty));
    calculateTotal();
  }

  void updateHargaSatuan(int hargaSatuan) {
    emit(state.copyWith(hargaSatuan: hargaSatuan));
    calculateTotal();
  }

  void calculateTotal() {
    final total = state.qty * state.hargaSatuan;
    emit(state.copyWith(total: total));
  }
}


