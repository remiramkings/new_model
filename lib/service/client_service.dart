import 'dart:convert';

import 'package:http/http.dart';
import 'package:new_model_project/service/base_service.dart';

class ClientService extends BaseService {

  static ClientService _instance = new ClientService();

  static ClientService getInstance(){
    return _instance;
  }

  Future<bool> saveClient(Map<String, dynamic> clientData) async {
    Uri uri = getApiUri('api/Saveclient');
    var headers = {'Content-Type': 'application/json'};
    Response response = await client.put(uri, headers: headers, body: jsonEncode(clientData));
    return isSuccess(response);    
  }
}