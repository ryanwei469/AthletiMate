import 'package:flutter/material.dart';

class CustomSelection extends StatefulWidget{
  const CustomSelection({super.key, required this.onSelectionChanged});

  final ValueChanged<List<String>> onSelectionChanged; // Callback for selected sports

  @override
  State<CustomSelection> createState() => _CustomSelectionState();
}

class _CustomSelectionState extends State<CustomSelection> {
  var sports = ["Golf", "Basketball", "Soccer",
                "Bowling", "Padel", "Tennis",
                "Badminton", "Volleyball", "Others"];

  // List to keep track of selected items
  List<bool> _selectedSports = List.generate(9, (index) => false);

  void _notifyParent() {
    final selectedSports = sports.asMap().entries
        .where((entry) => _selectedSports[entry.key])
        .map((entry) => entry.value)
        .toList();
    widget.onSelectionChanged(selectedSports);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 300,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 140,
          childAspectRatio: 4/2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 20
        ),
        itemCount: sports.length,
        itemBuilder: (count, index){
          return GestureDetector(
            child: InkWell(
              onTap: (){
                setState(() {
                  // Toggle the selection state of the tapped item
                  _selectedSports[index] = !_selectedSports[index];

                  // Notify parent with the updated selection
                  _notifyParent();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _selectedSports[index] ? Colors.blue : Colors.grey[300],
                ),
                child: Center(
                  child: Text(sports[index],
                    style: TextStyle(
                      color: _selectedSports[index] ? Colors.white : Colors.black,
                    ),
                  )
                ),
              ),
            ),
          );
        }),
    );
  }
}