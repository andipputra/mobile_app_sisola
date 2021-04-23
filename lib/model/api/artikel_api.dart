
import 'package:dio/dio.dart';
import 'package:mobile_app_sisola/model/data/data.dart';
import 'package:mobile_app_sisola/utils/constant/constanta_resource.dart';

class ArtikelApi {
  final dio = Dio(BaseOptions(baseUrl: urlApi));

  Future<List<Artikel>> getListArtikelHome() async {
    final response = await dio.request(getArtikelMenuPath,
        options: Options(method: 'POST'));

    // var decode = jsonDecode(response.data);

    print('response artikel ${response.data}');

    var listArtikel = <Artikel>[];

    if (response.data['STATUS_TYPE'] == 'MSG') {
      for (var item in response.data['RESULT']) {
        listArtikel.add(Artikel.fromJson(item));
      }
    }

    return listArtikel;
  }
}
