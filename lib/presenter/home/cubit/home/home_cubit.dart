import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_app_sisola/model/data/data.dart';
import 'package:mobile_app_sisola/model/repository/artikel_repository.dart';
import 'package:mobile_app_sisola/model/repository/promo_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ArtikelRepository _artikelRepo = ArtikelRepository();
  final PromoRepository _promoRepo = PromoRepository();

  Future<void> loadHome() async {
    emit(HomeLoading());
    try {
      var listArtikel = await _artikelRepo.getArtikelForMenu();
      var listPromo = await _promoRepo.getListPromoForMenu();

      if (listArtikel.isNotEmpty && listPromo.isNotEmpty) {
        emit(HomeLoaded(listArtikel, listPromo));
      } else {
        emit(HomeFailure('Cannot Loaded Home'));
      }
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
