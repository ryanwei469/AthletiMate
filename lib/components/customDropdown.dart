import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget{
  const CustomDropdown({super.key, required this.onDateOfBirthSelected});

  final ValueChanged<Map<String, String>> onDateOfBirthSelected; // Callback for DOB

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String selectedMonth = "Month";
  final monthList = ["Month","1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];

  TextEditingController _dayController = TextEditingController();
  TextEditingController _yearController = TextEditingController();

  void _notifyParent() {
    widget.onDateOfBirthSelected({
      'month': selectedMonth,
      'day': _dayController.text,
      'year': _yearController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 120,
          padding: EdgeInsets.only(right: 5),
          child: DropdownButtonFormField(
              value: selectedMonth,
              items: monthList.map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: TextStyle(
                    fontWeight: FontWeight.normal
                  ),
                ),
              )).toList(),
              onChanged: (val){
                setState(() {
                  selectedMonth = val as String;

                  // Notify parent of the selected Month
                  _notifyParent();
                });
              },
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.grey,
                size: 24
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(4)
                )
              ),
              menuMaxHeight: 200,
            ),
        ),
        Container(
          width: 120,
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: TextFormField(
            validator: (value) {},
            controller: _dayController,
            obscureText: false,
            autocorrect: false,
            enableSuggestions: false,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "Day",
              hintStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1, style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(4)
              )
            ),
            keyboardType: TextInputType.number,
            onChanged: (val){
              _notifyParent();
            },
          )
        ),
        Container(
          width: 120,
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: TextFormField(
            validator: (value) {},
            controller: _yearController,
            obscureText: false,
            autocorrect: false,
            enableSuggestions: false,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "Year",
              hintStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1, style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(4)
              )
            ),
            keyboardType: TextInputType.number,
            onChanged: (val){
              _notifyParent();
            },
          )
        )
      ],
    );
  }
}