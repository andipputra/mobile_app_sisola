import 'package:mobile_app_sisola/model/api/produk_api.dart';
import 'package:mobile_app_sisola/model/data/data.dart';

class ProdukRepository{
  final _produkApi = ProdukApi();

  Future<List<Produk>> getListProduk() async {
    var listProduk = await _produkApi.getListProduk();

    return listProduk;
  }
}