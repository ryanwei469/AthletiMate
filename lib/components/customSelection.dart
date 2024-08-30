import 'package:flutter/material.dart';

class CustomSelection extends StatefulWidget{
  const CustomSelection({super.key});

  @override
  State<CustomSelection> createState() => _CustomSelectionState();
}

class _CustomSelectionState extends State<CustomSelection> {
  var sports = ["Golf", "Basketball", "Soccer",
                "Bowling", "Padel", "Tennis",
                "Badminton", "Volleyball", "Others"];

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
        itemCount: 9,
        itemBuilder: (count, index){
          return GestureDetector(
            child: InkWell(
              onTap: (){},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300]
                ),
                child: Center(
                  child: Text(sports[index])
                ),
              ),
            ),
          );
        }),
    );
  }
}