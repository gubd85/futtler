import 'package:app_conferencia/service/retrive_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  Map<String, String> get baseEnvironment => DotEnv().env;

  Future<dynamic> login() async {
    var dio = RetriveInterceptor().instance;
    String url =
        baseEnvironment['baseURL'] + '/organicos-erp-api/api/autenticacao';
    var data = {"username": "gustavo", "password": "123456"};
    var opt = {"Content-Type": "application/json"};

    return dio
        .post(url, data: data, options: Options(headers: opt))
        .then((res) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', res.data['token']);

      return "";
    }).catchError((err) {
      throw Exception('Login ou senha invalido');
    });
  }

  // void callLoginService(Dio dio) async {

  //   try {
  //     Response response = await dio.post(
  //       url,
  //       data: ,
  //       options: Options(
  //         headers: ,
  //       ),
  //     );
  //     if (response.statusCode == 200) print(response.data);
  //     if (response.statusCode == 422) print(response.data);
  //   } on DioError catch (e) {
  //     print(e.response.data['message']);
  //   }
  // }
}
