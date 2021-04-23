
import 'package:mobile_app_sisola/model/api/api.dart';
import 'package:mobile_app_sisola/model/data/data.dart';

class PromoRepository {

  final _promoApi = PromoApi();

  Future<List<Promo>> getListPromoForMenu() async {
    var listPromo = await _promoApi.getListArtikelHome();

    return listPromo;
  }
}