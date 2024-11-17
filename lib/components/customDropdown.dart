import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key, required this.onDateOfBirthSelected});

  final ValueChanged<Map<String, String>> onDateOfBirthSelected;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String selectedMonth = "Month";
  final monthList = [
    "Month",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];

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
    final screenWidth = MediaQuery.of(context).size.width;
    final fieldWidth = (screenWidth - 60) / 3; // Adjust for padding and spacing

    return Row(
      children: [
        Container(
          width: fieldWidth,
          padding: const EdgeInsets.only(right: 5),
          child: DropdownButtonFormField(
            value: selectedMonth,
            items: monthList
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                )
                .toList(),
            onChanged: (val) {
              setState(() {
                selectedMonth = val as String;
                _notifyParent();
              });
            },
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.grey,
              size: 24,
            ),
            decoration: InputDecoration(
              filled: true, // Set filled to true to change the background
              fillColor: Colors.white, // Set the background color to white
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            menuMaxHeight: 200,
          ),
        ),
        Container(
          width: fieldWidth,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: TextFormField(
            controller: _dayController,
            decoration: InputDecoration(
              filled: true, // Set filled to true to change the background
              fillColor: Colors.white, // Set the background color to white
              hintText: "Day",
              hintStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: (val) {
              _notifyParent();
            },
          ),
        ),
        Container(
          width: fieldWidth,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: TextFormField(
            controller: _yearController,
            decoration: InputDecoration(
              filled: true, // Set filled to true to change the background
              fillColor: Colors.white, // Set the background color to white
              hintText: "Year",
              hintStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: (val) {
              _notifyParent();
            },
          ),
        ),
      ],
    );
  }
}
