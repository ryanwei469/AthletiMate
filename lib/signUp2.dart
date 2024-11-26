// import 'package:athletimate/components/customDropdown.dart';
// import 'package:athletimate/components/customSelection.dart';
// import 'package:athletimate/components/topBar.dart';
// import 'package:athletimate/signUp3.dart';
// import 'package:flutter/material.dart';

// class SignUp2 extends StatefulWidget {
//   const SignUp2({
//     super.key,
//     required this.name,
//     required this.email,
//     required this.pwd,
//   });
//   final String name, email, pwd;

//   @override
//   State<SignUp2> createState() => _SignUp2State();
// }

// class _SignUp2State extends State<SignUp2> {
//   Map<String, String> _dob = {
//     'month': "Month",
//     'day': "",
//     'year': "",
//   };

//   List<String> _selectedSports = [];

//   void _onDateOfBirthSelected(Map<String, String> dob) {
//     setState(() {
//       _dob = dob;
//     });
//   }

//   void _onSelectionChanged(List<String> selectedSports) {
//     setState(() {
//       _selectedSports = selectedSports;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: TopBar(context),
//       body: GestureDetector(
//         // Dismiss keyboard when tapping anywhere outside of the text fields
//         onTap: () {
//           // Close the keyboard if it's open
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: SingleChildScrollView(
//           child: Stack(
//             children: [
//               Positioned.fill(
//                 child: Image.asset(
//                   'assets/bg2.jpg',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Column(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(top: 45, bottom: 10),
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Row(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.arrow_back, color: Colors.white),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                         SizedBox(width: 90),
//                         Text(
//                           "SIGN UP",
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.symmetric(vertical: 8),
//                             child: Text(
//                               "Date of Birth",
//                               style: TextStyle(
//                                 color: Colors.white
//                               ),
//                             ),
//                           ),
//                           CustomDropdown(onDateOfBirthSelected: _onDateOfBirthSelected),
//                           const SizedBox(height: 15),
//                           const Padding(
//                             padding: EdgeInsets.symmetric(vertical: 8),
//                             child: Text(
//                               "Sports Tag Selection",
//                               style: TextStyle(
//                                 color: Colors.white
//                               ),
//                             ),
//                           ),
//                           CustomSelection(onSelectionChanged: _onSelectionChanged),
//                           SizedBox(height: 35),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 55),
//                             child: SizedBox(
//                               width: MediaQuery.of(context).size.width * 0.6,
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.of(context).push(
//                                     MaterialPageRoute(builder: (context) => SignUp3())
//                                   );
//                                 },
//                                 style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.all<Color>(Color(0xFF1145A8)),
//                                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(40),
//                                     ),
//                                   ),
//                                   padding: MaterialStateProperty.all<EdgeInsets>(
//                                     const EdgeInsets.symmetric(vertical: 15),
//                                   ),
//                                 ),
//                                 child: const Text(
//                                   "Continue",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:athletimate/components/customDropdown.dart';
import 'package:athletimate/components/customSelection.dart';
import 'package:athletimate/components/topBar.dart';
import 'package:athletimate/signUp3.dart';
import 'package:flutter/material.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({
    super.key,
    required this.name,
    required this.email,
    required this.pwd,
  });
  final String name, email, pwd;

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  Map<String, String> _dob = {
    'month': "Month",
    'day': "",
    'year': "",
  };

  List<String> _selectedSports = [];

  void _onDateOfBirthSelected(Map<String, String> dob) {
    setState(() {
      _dob = dob;
    });
  }

  void _onSelectionChanged(List<String> selectedSports) {
    setState(() {
      _selectedSports = selectedSports;
    });
  }

  bool _isValidDOB(Map<String, String> dob) {
    return dob['month'] != "Month" && dob['day']!.isNotEmpty && dob['year']!.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(context),
      body: GestureDetector(
        // Dismiss keyboard when tapping anywhere outside of the text fields
        onTap: () {
          // Close the keyboard if it's open
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/bg2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 45, bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(width: 90),
                        Text(
                          "SIGN UP",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "Date of Birth",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          CustomDropdown(onDateOfBirthSelected: _onDateOfBirthSelected),
                          const SizedBox(height: 15),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "Sports Tag Selection",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          CustomSelection(onSelectionChanged: _onSelectionChanged),
                          SizedBox(height: 35),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 55),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (!_isValidDOB(_dob)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Please select a valid date of birth."),
                                      ),
                                    );
                                    return;
                                  }

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SignUp3(
                                        name: widget.name,
                                        email: widget.email,
                                        pwd: widget.pwd,
                                        dob: "${_dob['month']} ${_dob['day']}, ${_dob['year']}",
                                        selectedSports: _selectedSports,
                                      ),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(Color(0xFF1145A8)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.symmetric(vertical: 15),
                                  ),
                                ),
                                child: const Text(
                                  "Continue",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
