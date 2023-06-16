import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:new_model_project/model/location_model.dart';
import 'package:new_model_project/service/location_service.dart';

class LocationDetails extends StatefulWidget {
  final LocationModel? locationModel;
  final Function(LocationModel) onSaved;

  LocationDetails({super.key, required this.onSaved, this.locationModel});

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  String? selectedLocationType;
  bool isChecked = false;
  bool isLoading = false;
  var items = [
    'Office',
    'Home',
    'Others',
  ];

  TextEditingController nameController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future<Placemark?> getLocation(Position position) async {
    return await LocationService.getAddressFromLocation(position);
  }

  getLocationDetails() async {
    setState(() {
      isLoading = true;
    });
    Position position = await LocationService.getCurrentLocation();
    Placemark? placemark = await getLocation(position);
    setState(() {
      latController.text = position.latitude.toString();
      longController.text = position.longitude.toString();
      addressController.text = placemark == null
          ? ""
          : '${placemark.name},${placemark.street},${placemark.locality},${placemark.subLocality},${placemark.administrativeArea},${placemark.postalCode},${placemark.country}' ??
              '';
      nameController.text = placemark == null ? "" : placemark.locality!;
      isLoading = false;
    });
  }

  @override
  initState(){
    super.initState();
    initializeLocationDetails();
  }

  initializeLocationDetails(){
    if(widget.locationModel == null){
      return;
    }
    setState(() {
      nameController.text = widget.locationModel!.name;
      latController.text = widget.locationModel!.lattitude;
      longController.text = widget.locationModel!.Longitude;
      linkController.text = widget.locationModel!.link;
      addressController.text = widget.locationModel!.address;
      selectedLocationType = widget.locationModel!.type;
      isChecked = widget.locationModel!.isDefault;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(children: [
        TextFormField(
          decoration: InputDecoration(
              hintText: 'Location Name',
              suffixIcon: isLoading ? 
                const SizedBox( width: 10, height: 10, child: Center(child: CircularProgressIndicator(),))
                : InkWell(
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.blue,
                ),
                onTap: () {
                  getLocationDetails();
                },
              )),
          controller: nameController,
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.topLeft,
          child: DropdownMenu(
            inputDecorationTheme:
                const InputDecorationTheme(border: UnderlineInputBorder()),
            dropdownMenuEntries: items.map((String item) {
              return DropdownMenuEntry(
                value: item,
                label: item,
              );
            }).toList(),
            onSelected: (String? newValue) {
              selectedLocationType = newValue!;
            },
            initialSelection: selectedLocationType,
            label: Text('Type'),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Latitude',
          ),
          controller: latController,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Longitude',
          ),
          controller: longController,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Link',
          ),
          controller: linkController,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Address',
          ),
          controller: addressController,
        ),
        Row(
          children: [
            Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                }),
            Text('Default location')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                onPressed: isLoading ? null : () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
            const SizedBox(width: 20),
            TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                onPressed: isLoading ? null : () {
                  widget.onSaved(LocationModel(
                      name: nameController.text,
                      type: selectedLocationType ?? '',
                      lattitude: latController.text,
                      Longitude: longController.text,
                      link: linkController.text,
                      address: addressController.text,
                      isDefault: isChecked));
                  Navigator.pop(context);
                },
                child: const Text('Save'))
          ],
        )
      ]),
    );
  }
}
