import 'dart:convert';

class LocationModel {
  String name;
  String type;
  String lattitude;
  String Longitude;
  String link;
  String address;
  bool isDefault;

  LocationModel({
    required this.name,
    required this.type,
    required this.lattitude,
    required this.Longitude,
    required this.link,
    required this.address,
    required this.isDefault,
  });

  String toJson(){
    return jsonEncode({
      'name': name,
      'type': type,
      'lattitude': lattitude,
      'Longitude': Longitude,
      'link': link,
      'address': address,
      'isDefault': isDefault,
    });
  }
  
  @override
  String toString(){
    return '${name}, ${type}, ${lattitude}, ${Longitude}, ${link}, ${address}, ${isDefault}';
  }
}