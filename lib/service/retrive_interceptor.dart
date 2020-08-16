import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RetriveInterceptor {
  var _dio;

  Dio get instance => _dio;

  RetriveInterceptor() {
    _dio = Dio();
  }

  RetriveInterceptor.withAuth() {
    _dio = Dio();

    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));
  }

  _onRequest(RequestOptions options) async {
    SharedPreferences prefes = await SharedPreferences.getInstance();

    var token = prefes.get('token');
    options.headers['Authorization'] = token;
  }

  _onResponse(Response e) {
    print("######## response Sucess ########");
    print(e.data);
  }

  _onError(DioError e) {
    print("######## response Sucess ########");
    print(e.error);
    return e;
  }
}
