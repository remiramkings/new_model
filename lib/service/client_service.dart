import 'dart:convert';

import 'package:http/http.dart';
import 'package:new_model_project/model/client_model.dart';
import 'package:new_model_project/service/base_service.dart';

class ClientService extends BaseService {

  static ClientService _instance = new ClientService();

  static ClientService getInstance(){
    return _instance;
  }

  Future<bool> saveClient(Map<String, dynamic> clientData) async {
    Uri uri = getApiUri('test.abc.todomor.com','api/Saveclient');
    var headers = {'Content-Type': 'application/json'};
    Response response = await client.put(uri, headers: headers, body: jsonEncode(clientData));
    return isSuccess(response);
  }

  Future<ClientModel?> getClientData() async {
    Uri uri = getApiUri('test.abc.todomor.com','api/getclientdetailstoedit/19753/0');
    var headers = {'Content-Type': 'application/json'};
    Response response = await client.get(uri, headers: headers);
    if(!isSuccess(response)){
      return null;
    }
    Map<String, dynamic> map = getMap(response);
    if(!map.containsKey('clients')){
      return null;
    }

     return ClientModel.fromMap(map['clients'] as Map<String, dynamic>);
  }
}