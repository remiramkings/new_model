import 'package:flutter/material.dart';

class PostalCodeDetailsModel{
  String postalCodeId;
  String postalCode;
  String place;
  String branchType;
  String circle;
  String district;
  String division;
  String block;
  String region;
  String country;
  String districtId;
  String countryId;
  String company;
  String postalStatusId;
  String districtMasterId;
  String districtName;
  String? stateMasterId;
  String stateCode;
  String companyId;
  String stateName;
  String statusId;

  PostalCodeDetailsModel({
    required this.postalCodeId,
    required this.postalCode,
    required this.place,
    required this.branchType,
    required this.circle,
    required this.district,
    required this.division,
    required this.block,
    required this.region,
    required this.country,
    required this.districtId,
    required this.countryId,
    required this.company,
    required this.postalStatusId,
    required this.districtMasterId,
    required this.districtName,
    required this.stateMasterId,
    required this.stateCode,
    required this.companyId,
    required this.stateName,
    required this.statusId
  });

  factory PostalCodeDetailsModel.fromMap(Map<String, dynamic> map){
    return PostalCodeDetailsModel(
      postalCodeId: map['postal_code_id'],
      postalCode: map['postal_code'], 
      place: map['place'],
      branchType: map['branch_type'],
      circle: map['circle'],
      district: map['district'], 
      division: map['division'], 
      block:map['block'],
      region: map['region'], 
      country: map['country'], 
      districtId: map['district_id'],
      countryId: map['country_id'],
      company: map['company'],
      postalStatusId: map['postal_status_id'],
      districtMasterId: map['district_master_id'],
      districtName: map['district_name'],
      stateMasterId: map['state_master_id'],
      stateCode: map['state_code'],
      companyId: map['company_id'],
      stateName: map['state_name'],
      statusId: map['status_id']);
  }
}