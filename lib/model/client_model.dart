import 'package:intl/intl.dart';

class ClientModel{
  String id;
  String? clientTypeId;
  String companyId;
  String name;
  String primaryNumber;
  String secondaryNumber;
  String whatsAppNumber = '0';
  String dob;
  String pan;
  String gst;
  String email;
  String followUpDate;
  String location;
  String address;
  String comment;

  ClientModel({
    required this.id,
    required this.clientTypeId,
    required this.companyId,
    required this.name,
    required this.primaryNumber,
    required this.secondaryNumber,
    required this.whatsAppNumber,
    required this.dob,
    required this.pan,
    required this.gst,
    required this.email,
    required this.followUpDate,
    required this.location,
    required this.address,
    required this.comment
  });

  factory ClientModel.  create(
    String name,
    String primaryNumber,
    String secondaryNumber,
    String whatsAppNumber,
    String dob,
    String pan,
    String gst,
    String email,
    String followUpDate,
    String location,
    String address,
    String comment,
    {String id = '0', String companyId = '114'}
  ) {
    return ClientModel(
      id: id,
      clientTypeId: null,
      companyId: companyId,
      name: name,
      primaryNumber: primaryNumber,
      secondaryNumber: secondaryNumber,
      whatsAppNumber: whatsAppNumber,
      dob: dob,
      pan: pan,
      gst: gst,
      email: email,
      followUpDate: followUpDate,
      location: location ,
      address: address,
      comment: comment
    );
  }

  static T getKeyValue<T>(Map<String, dynamic> map, String key, T defaultVal){    
    return (!map.containsKey(key)||map[key]==null)?defaultVal:(map[key] as T);
  }

  factory ClientModel.fromMap(Map<String, dynamic> map){
    return ClientModel(id: getKeyValue<String>(map, 'client_id', ''),
        clientTypeId: getKeyValue<String>(map, 'client_type_id', ''),
        companyId: getKeyValue<String>(map, 'company_id', ''),
        name: getKeyValue<String>(map, 'client_name', ''),
        primaryNumber:  getKeyValue<String>(map, 'client_mobile_number', ''),
        secondaryNumber: getKeyValue<String>(map, 'client_phone_number', ''), 
        whatsAppNumber: getKeyValue<String>(map, 'whatsapp_number', ''),
        dob: getKeyValue<String>(map, 'dob', ''),
        pan: getKeyValue<String>(map, 'pan_number', ''),
        gst: getKeyValue<String>(map, 'gst_number', ''),
        email: getKeyValue<String>(map, 'client_email', ''),
        followUpDate: getKeyValue<String>(map, 'lastfollow_up_date', ''),
        location: getKeyValue<String>(map, 'Add_Location', ''),
        address: getKeyValue<String>(map, 'office_address', ''),
        comment: getKeyValue<String>(map, 'comments', ''));
  }

  static Map<String, dynamic> toMap(ClientModel clientModel){
    return {      
      "client_id": clientModel.id,
      "client_type_id": clientModel.clientTypeId,
      "company_id": clientModel.companyId,
      "created_date": DateFormat('dd-MM-yyyy').format(DateTime.now()),
      "created_user_id": "838",
      "client_mobile_number": clientModel.primaryNumber,
      "client_phone_number": clientModel.secondaryNumber,
      "whatsapp_linked": "0",
      "whatsapp_number": clientModel.whatsAppNumber,
      'dob' : clientModel.dob,
      'pan_number' : clientModel.pan,
      'gst_number' : clientModel.gst,
      'client_email' : clientModel.email,
      'lastfollow_up_date' : clientModel.followUpDate,
      'Add_Location' : clientModel.location,
      'office_address' : clientModel.address,
      'comments' : clientModel.comment,
      "name_title": null,
      "client_name": clientModel.name,
      "client_location": "",
      "location_lat": 0,
      "location_lng": 0,
      "total_enq": "0",
      "closed_enq": "0",
      "lost_enq": null,
      "total_prodts": null,
      "closed_prodts": null,
      "lost_prodts": null,
      "next_visit_date": null,
      "lastupdate_date": null,
      "lastupdated_user_id": null,
      "grand_total": null,
      "advance": null,
      "status_id": "1",
      "AddContact": "0",
      "assigned_user_id": "838",
      "sales_rep_code": null,
      "sales_rep_name": null,
      "same_as_billing_addr": null,
      "sales_office": null,
      "client_region_id": "514",
      "client_branch": null,
      "opening_balance": null,
      "drop_down_1": null,
      "drop_down_2": null,
      "drop_down_3": null,
      "drop_down_4": null,
      "text_box_1": null,
      "text_box_2": null,
      "referral_id": null,
      "text_box_3": null,
      "text_box_4": null,
      "site_address": null,
      "last_check_in": null,
      "client_code": null,
      "crm_code": null,
      "client_route": null,
      "aadhar_no": null,
      "source": null,
      "Fax_No": null,
      "country": null,
      "state": null,
      "district": null,
      "city": null,
      "postal_code": null,
      "website": null,
      "dealer_status": "0",
      "taluk": null,
      "panchayath": null,
      "attachment": null,
      "profile_pic": null,
      "client_category_id": null,
      "doc_count": "0",
      "sap_flag": null,
      "add_edit_flag": null
    };
  }
  
}