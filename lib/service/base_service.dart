import 'dart:convert';
import 'package:http/http.dart';

class BaseService {

  Client get client {
    return Client();
  }

  Map<String, dynamic> getMap(Response response) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  List<dynamic> getList(Response response) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  bool isSuccess(Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }

  Uri getApiUri(String url, String endpoint, {Map<String, dynamic>? queryParams}) {
    return Uri.https(url,"/$endpoint", queryParams);
  }

}