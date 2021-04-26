import 'package:dio/dio.dart';
import 'package:mobile_app_sisola/model/data/data.dart';
import 'package:mobile_app_sisola/utils/constant/constanta_resource.dart';

class ProdukApi{
  final dio = Dio(BaseOptions(baseUrl: urlApi));

  Future<List<Produk>> getListProduk() async {
    final response = await dio.request(getProdukPath,
        options: Options(method: 'POST'));

        var listProduk = <Produk>[];

    if (response.data['STATUS_TYPE'] == 'MSG') {
      for (var item in response.data['RESULT']) {
        listProduk.add(Produk.fromJson(item));
      }
    }

    print('produk length = ${listProduk.length}');

    return listProduk;
  }
}