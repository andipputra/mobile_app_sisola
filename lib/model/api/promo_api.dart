
import 'package:dio/dio.dart';
import 'package:mobile_app_sisola/model/data/data.dart';
import 'package:mobile_app_sisola/utils/constant/constanta_resource.dart';

class PromoApi {
  final dio = Dio(BaseOptions(baseUrl: urlApi));

  Future<List<Promo>> getListArtikelHome() async {
    final response = await dio.request(getPromoCarouselMenuPath,
        options: Options(method: 'POST'));

    // print('response promo ${response.data['RESULT']}');

    var listPromo = <Promo>[];

    if (response.data['STATUS_TYPE'] == 'MSG') {
      for (var item in response.data['RESULT']) {
        listPromo.add(Promo.fromJson(item));
      }
    }

    print('promo length = ${listPromo.length}');

    return listPromo;
  }
}
