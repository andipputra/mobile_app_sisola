import 'dart:convert';

import 'package:mobile_app_sisola/model/data/data.dart';
import 'package:mobile_app_sisola/utils/constant/constanta_resource.dart';
import 'package:dio/dio.dart';

class AuthApi {
  // final dio = Dio();
  // final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final dio = Dio(BaseOptions(baseUrl: urlApi));

  Future<User?> login(String email, String password) async {
    // var sp = await _pref;

    // final uri = Uri.http(urlApi, loginPath);
    // print(uri);
    //
    // final uri = urlApi+loginPath;

    var body = <String, dynamic>{'email': email, 'password': password};
    final bodyJson = jsonEncode(body);

    final response = await dio.request(loginPath,
        data: bodyJson, options: Options(method: 'POST'));

    // final response = await dio.post(uri, data: bodyJson);

    User? resBody;

    print('Response');
    print(response.data);

    if (response.data['STATUS_TYPE'] == 'MSG') {
      resBody = User.fromJson(response.data['RESULT']);
    } else {
      resBody = null;
    }

    return resBody;

    // await Dio().post(uri, body: bodyJson);
    // print(response);
    // if (response.statusCode != 200) return 'response error';
    // print('respon body: ${response.body}');
    // Map<String, dynamic> decode = jsonDecode(response.body);
    // print('decode = $decode');
    // print('hasil decode: $decode');
    // var isError = decode.containsKey('error');

    // if (isError) {
    //   // await sp.setString('isError', decode['error']);
    //   await sp.setBool('isLogin', false);
    //   return decode['error'];
    // } else {
    //   var user = jsonEncode(User.fromJson(decode));
    //   print('user: $user');
    //   await sp.setString('user', user);
    //   await sp.setBool('isLogin', true);
    //   return 'Berhasil';
    // }
  }

  // Future<String> register(String nik, String name, String email,
  //     String password, String location, String dateOfBirth) async {
  //   final url = Uri.http(urlApi, registerPath);
  //   print('url : $url');
  //   var newBody =
  //       RegisterModel(nik, name, email, password, location, dateOfBirth);
  //   // var newBody = new RegisterModel('345678765434567', 'fewfew', 'email@gmail.co', 'password', 'location', '2019-03-12');
  //   print('newBody: $newBody');

  //   final body = newBody.toJson();
  //   final bodyJson = jsonEncode(body);
  //   print('body json: $bodyJson');
  //   final response = await http.post(url, body: bodyJson);
  //   print('response : ${response.body}');
  //   var res = response.body;
  //   print('Res = $res');

  //   Map<String, dynamic> decode = jsonDecode(response.body);
  //   print('decode: $decode');
  //   var isSuccess = decode.containsKey('success');
  //   var isFailure = decode.containsKey('error');

  //   print('Is sukses = $isSuccess, is Fail = $isFailure');
  //   if (isSuccess) {
  //     print('error');
  //     return decode['success'];
  //   } else {
  //     print(decode['error']);

  //     return decode['error'];
  //   }
  // }

  // Future<String> forgetPassword(String email) async {
  //   final uri = Uri.http(urlApi, getForgotPwPath);
  //   print('url: $uri');

  //   var body = <String, dynamic>{'email': email};
  //   final bodyJson = jsonEncode(body);
  //   final response = await http.post(uri, body: bodyJson);
  //   print('response body: ${response.body}');
  //   // var decode = jsonDecode(response.body);
  //   Map<String, dynamic> decode = jsonDecode(response.body);
  //   var isSuccess = decode.containsKey('success');
  //   print('isSuccess: $isSuccess');
  //   // print(decode.containsKey('success'));
  //   if (isSuccess) {
  //     return decode['success'];
  //   } else {
  //     // print('pesan api: ' + decode['error']);
  //     return decode['error'];
  //   }
  // }
}
