import 'package:flutter/material.dart';
import 'package:new_model_project/model/location_model.dart';

class LocationDetails extends StatefulWidget {

  Function(LocationModel) onSaved;

  LocationDetails({super.key, required this.onSaved});

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  String? selectedUserType;
  bool isChecked = false;
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        TextFormField(
          decoration: InputDecoration(
              hintText: 'Location Name',
              suffixIcon: Icon(
                Icons.pin_drop,
                color: Colors.blue,
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
              selectedUserType = newValue!;
            },
            initialSelection: selectedUserType,
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
                onPressed: () {
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
                onPressed: () {
                  widget.onSaved(
                    LocationModel(
                      name: nameController.text,
                      type: selectedUserType ?? '',
                      lattitude: latController.text,
                      Longitude: longController.text,
                      link: linkController.text,
                      address: addressController.text,
                      isDefault: isChecked
                    )
                  );
                  Navigator.pop(context);
                },
                child: const Text('Save'))
          ],
        )
      ]),
    );
  }
}
