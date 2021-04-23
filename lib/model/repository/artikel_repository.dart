
import 'package:mobile_app_sisola/model/api/api.dart';
import 'package:mobile_app_sisola/model/data/data.dart';

class ArtikelRepository{

  final _artikelApi = ArtikelApi();

  Future<List<Artikel>> getArtikelForMenu() async {
    var listArtikel = await _artikelApi.getListArtikelHome();

    return listArtikel;
  }
}