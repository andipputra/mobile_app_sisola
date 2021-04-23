import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_app_sisola/model/data/data.dart';
import 'package:mobile_app_sisola/model/repository/repository.dart';

part 'promohome_state.dart';

class PromohomeCubit extends Cubit<PromohomeState> {
  PromohomeCubit() : super(PromohomeInitial());

  final _promoRepo = PromoRepository();

  void loadPromoList() async {
    emit(PromohomeLoading());

    try {
      var listPromo = await _promoRepo.getListPromoForMenu();

      // print('List Promo in Cubit');
      // print(listPromo);

      if (listPromo.isNotEmpty) {
        print('List Promo Not null');
        emit(PromohomeLoaded(listPromo));
        print('emitted promo loaded');
      } else {
        emit(PromohomeFailure('Gagal Load Promo'));
      }
    } catch (error) {
      emit(PromohomeFailure('error'));
    }
  }
}
