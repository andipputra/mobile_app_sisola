

import 'package:mobile_app_sisola/model/api/api.dart';
import 'package:mobile_app_sisola/model/data/data.dart';

class AuthRepository {
  Future<User?> getCurrentUser() async {
    return null;
  }

  Future<User?> login(String email, String password) async {
    var hasil = await AuthApi().login(email, password);

    return hasil;
  }
}
