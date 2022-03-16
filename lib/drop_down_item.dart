import 'package:flutter/material.dart';
class DropDownItem extends StatefulWidget {
  const DropDownItem({Key? key}) : super(key: key);

  @override
  _DropDownItemState createState() => _DropDownItemState();
}

class _DropDownItemState extends State<DropDownItem> {

  // Initial Selected Value
  String dropdownvalue = 'Kilo Gram';

  // List of items in our dropdown menu
  var items = [
    'Kilo Gram',
    'Gram',
    'Litter',
    'Milli litter',
    'Count',
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(

      decoration: InputDecoration(
        border: OutlineInputBorder()
      ),

        // Initial Value
        value: dropdownvalue,

        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),

        // Array list of items
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue!;
          });
        },
      );
  }
}