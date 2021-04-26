import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_app_sisola/model/data/data.dart';
import 'package:mobile_app_sisola/model/repository/artikel_repository.dart';
import 'package:mobile_app_sisola/model/repository/produk_repository.dart';
import 'package:mobile_app_sisola/model/repository/promo_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final _artikelRepo = ArtikelRepository();
  final _promoRepo = PromoRepository();
  final _prdukRepo = ProdukRepository();

  Future<void> loadHome() async {
    emit(HomeLoading());
    try {
      var listArtikel = await _artikelRepo.getArtikelForMenu();
      var listPromo = await _promoRepo.getListPromoForMenu();
      var listProduk = await _prdukRepo.getListProduk();

      if (listArtikel.isNotEmpty &&
          listPromo.isNotEmpty &&
          listProduk.isNotEmpty) {
        emit(HomeLoaded(
            artikel: listArtikel, promo: listPromo, produk: listProduk));
      } else {
        emit(HomeFailure('Cannot Loaded Home'));
      }
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
