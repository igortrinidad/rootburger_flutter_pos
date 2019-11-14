import 'package:dio/dio.dart';
import 'package:rootburger_flutter_pos/helpers/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDio{

  Dio dio = Dio();

  CustomDio() {
    dio.options.baseUrl = API_URL;
    dio.interceptors.add(InterceptorsWrapper(

      onRequest: (RequestOptions options) async {

        SharedPreferences prefs = await SharedPreferences.getInstance();

        if(prefs.getKeys().contains("authorization")) {
          options.headers["Authorization"] = prefs.getString("authorization");
          print("<<<<<< REQUEST HEADER AUTHORIZATION >>>>>>");
          print(prefs.getString("authorization"));
        }

        if(prefs.getKeys().contains("deviceauthorization")) {
          options.headers["DeviceAuthorization"] = prefs.getString("deviceauthorization");
          print("<<<<<< REQUEST HEADER DEVICE AUTHORIZATION >>>>>>");
          print(prefs.getString("deviceauthorization"));
        }

        print(options.headers);

        return options;
      },

      onResponse: (Response response) async {

        SharedPreferences prefs = await SharedPreferences.getInstance();

        if(response.headers["authorization"] != null) {
          print("<<<<<< RESPONSE HEADER AUTHORIZATION >>>>>>");
          String token = response.headers["authorization"].toString().replaceAll("[", "").replaceAll("]", "");
          print(token);
          prefs.setString("authorization", token);
        }

        if(response.headers["deviceauthorization"] != null) {
          print("<<<<<< RESPONSE HEADER DEVICE AUTHORIZATION >>>>>>");
          String token = response.headers["deviceauthorization"].toString().replaceAll("[", "").replaceAll("]", "");
          print(token);
          prefs.setString("deviceauthorization", token);
        }

        return response;
      },

      onError: (DioError e) {
        return e;
      }

    ));

  }

  getClient() => dio;

}