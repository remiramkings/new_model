import 'package:flutter/material.dart';
import 'package:new_model_project/model/postal_details_model.dart';
import 'package:new_model_project/service/pin_number_service.dart';


class AutocompleteWidget extends StatefulWidget {
  final Function(PostalCodeDetailsModel) onSelect;
  const AutocompleteWidget({
    super.key,
    required this.onSelect
  });
  
  @override
  State<StatefulWidget> createState() {
    return AutocompleteState();
  }
}
class AutocompleteState extends State<AutocompleteWidget> {

  List<PostalCodeDetailsModel> postalCodes = [];

  onSearch(String postalPrefix) async {

  }

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<PostalCodeDetailsModel>(
      optionsBuilder: (TextEditingValue textEditingValue) async {
        return await PinNumberService
          .getInstance()
          .getPostalCodeDetails(textEditingValue.text.toLowerCase());
      },
      fieldViewBuilder: (
        BuildContext context,
        TextEditingController textEditingController,
        FocusNode focusNode,
        VoidCallback onFieldSubmitted,
      ) {
        return TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          
          onFieldSubmitted: (String value) {
            onFieldSubmitted();
          },
          decoration: const InputDecoration(
            hintText: 'Postal code'
          ),
        );
      },      
      displayStringForOption: (option) => "${option.postalCode} - ${option.place}",
      optionsViewBuilder: (
        BuildContext context,
        AutocompleteOnSelected<PostalCodeDetailsModel> onSelected,
        Iterable<PostalCodeDetailsModel> options,
      ) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: SizedBox(
              height: 200.0,
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final PostalCodeDetailsModel option = options.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                    },
                    child: ListTile(
                      title: Text("${option.postalCode} - ${option.place}"),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
      onSelected: widget.onSelect,
    );
  }
}
