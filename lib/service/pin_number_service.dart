import 'package:new_model_project/service/base_service.dart';
import 'package:http/http.dart';

import '../model/postal_details_model.dart';

class PinNumberService extends BaseService{
  static PinNumberService _instance = PinNumberService();
  static PinNumberService getInstance(){
    return _instance;
  }

  Future<List<PostalCodeDetailsModel>> getPostalCodeDetails(String pin) async{
    Uri uri = getApiUri('uat.fibrcrm.com', 'api/PostalCodeDetails/6/$pin');
    var headers = {'Content-Type': 'application/json'};
    Response response = await client.get(uri, headers: headers);
    if(!isSuccess(response)){
      return [];
    }
    List<dynamic> list = getList(response);
    if(list.isEmpty){
      return [];
    }
    return list
      .map((e) => PostalCodeDetailsModel.fromMap(e as Map<String, dynamic>))
      .toList();
  } 
}