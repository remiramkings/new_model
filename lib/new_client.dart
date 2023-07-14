import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_model_project/location_details.dart';
import 'package:new_model_project/model/client_model.dart';
import 'package:new_model_project/model/location_model.dart';
import 'package:new_model_project/row_auto_complete.dart';
import 'package:new_model_project/service/client_service.dart';

class NewClient extends StatefulWidget {
  ClientModel? clientModel;
  NewClient({super.key, this.clientModel});

  @override
  State<NewClient> createState() => _NewClientState();
}

class _NewClientState extends State<NewClient> {
  List<LocationModel> locations = [];
  ClientModel? clientDetails;

  TextEditingController nameController = TextEditingController();
  TextEditingController primaryNumberController = TextEditingController();
  TextEditingController secondaryNumberController = TextEditingController();
  TextEditingController whatsAppNumberController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController followUpDateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController commentController = TextEditingController();

@override
Future loadClientDetails() async {
 var cd = await ClientService.getInstance().getClientData();
 setState(() {
   clientDetails = cd;
   nameController.text = clientDetails!.name;
   primaryNumberController.text = clientDetails!.primaryNumber;
   secondaryNumberController.text = clientDetails!.secondaryNumber;
   whatsAppNumberController.text = clientDetails!.whatsAppNumber;
   dobController.text = clientDetails!.dob;
   panController.text = clientDetails!.pan;
   gstController.text = clientDetails!.gst;
   emailController.text = clientDetails!.email;
   followUpDateController.text = clientDetails!.followUpDate;
   locationController.text = clientDetails!.location;
   addressController.text = clientDetails!.address;
   commentController.text = clientDetails!.comment;

 });
}
  void initState() {
    loadClientDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: Row(
            children: [
              Expanded(flex: 1, child: Text('New Model')),
              InkWell(
                child: Text('SAVE'),
                onTap: () async {
                  ClientModel clientModel = ClientModel.create(
                      nameController.text,
                      primaryNumberController.text,
                      secondaryNumberController.text,
                      whatsAppNumberController.text,
                      dobController.text,
                      panController.text,
                      gstController.text,
                      emailController.text,
                      followUpDateController.text,
                      locationController.text,
                      addressController.text,
                      commentController.text,
                      id: clientDetails != null ? clientDetails!.id : '0',
                      companyId: clientDetails != null ? clientDetails!.companyId : '0'
                      );
                  bool isSuccess = await ClientService.getInstance()
                      .saveClient(ClientModel.toMap(clientModel));
                  print("Save client: $isSuccess");
                },
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AutocompleteWidget(onSelect: (postalCodeModel){
                  print("Selected postalCodeModel: ${postalCodeModel}");
                }),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          hintText: 'Name'),
                      controller: nameController,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          hintText: 'Primary Number'),
                      controller: primaryNumberController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Secondary Number'),
                      controller: secondaryNumberController,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'WhatsApp Number'),
                      controller: whatsAppNumberController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'DOB',
                        suffixIcon: InkWell(
                          child: Icon(
                            Icons.calendar_month,
                            color: Colors.blue,
                          ),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1970),
                                lastDate: DateTime.now());
                            if (pickedDate == null) {
                              return;
                            }
                            String formatted =
                                DateFormat('dd-MM-yyyy').format(pickedDate!);
                            if (pickedDate != null) {
                              setState(() {
                                dobController.text = formatted;
                              });
                            }
                          },
                        ),
                      ),
                      controller: dobController,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'PAN'),
                      controller: panController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'GST'),
                      controller: gstController,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Email'),
                      controller: emailController,
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Follow Up Date',
                  suffixIcon: InkWell(
                    child: Icon(
                      Icons.calendar_month,
                      color: Colors.blue,
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2025));
                      if (pickedDate == null) {
                        return;
                      }
                      String formatted =
                          DateFormat('dd-MM-yyyy').format(pickedDate!);
                      if (pickedDate != null) {
                        setState(() {
                          followUpDateController.text = formatted;
                        });
                      }
                    },
                  ),
                ),
                controller: followUpDateController,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Location',
                    suffixIcon: InkWell(
                      child: Icon(
                        Icons.pin_drop,
                        color: Colors.blue,
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              AlertDialog(content: LocationDetails(
                            onSaved: (locationModel) {
                              setState(() {
                                locations.add(locationModel);
                              });
                            },
                          )),
                        );
                      },
                    )),
                controller: locationController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Address',
                ),
                controller: addressController,
              ),
              
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Comment',
                ),
                controller: commentController,
              ),
              SizedBox(height: 20),
              Container(
                  alignment: Alignment.centerLeft, child: Text('Locations')),
              Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      LocationModel locModel = locations[index];
                      return InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey, width: 1))),
                          child: Text('${locModel.toString()}'),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                AlertDialog(content: LocationDetails(
                                  locationModel: locModel,
                              onSaved: (locationModel) {
                                setState(() {
                                  locations[index] = locationModel;
                                });
                              },
                            )),
                          );
                        },
                      );
                    },
                  ))
            ]),
          ),
        ));
  }
}
