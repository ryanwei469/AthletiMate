// import 'package:athletimate/components/topBar.dart';
// import 'package:athletimate/dashboard.dart';
// import 'package:flutter/material.dart';

// class SignUp3 extends StatefulWidget {
//   const SignUp3({super.key});

//   @override
//   State<SignUp3> createState() => _SignUp3State();
// }

// class _SignUp3State extends State<SignUp3> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: TopBar(context),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/bg3.jpg'), // Replace with your image file
//             fit: BoxFit.cover, // Cover the whole screen
//             scale: 0.5
//           ),
//         ),
//         child: Center( // Centering the content on top of the background
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
//             child: Column(
//               mainAxisSize: MainAxisSize.min, // Minimize the column to fit its children
//               crossAxisAlignment: CrossAxisAlignment.center, // Center align the column's content
//               children: [
//                 const Text(
//                   "ADD A PROFILE PHOTO",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white, // Make the text white to contrast with background
//                   ),
//                 ),
//                 const SizedBox(height: 40), // Space between title and avatar
//                 CircleAvatar(
//                   radius: 80,
//                   backgroundColor: Colors.grey[300],
//                   child: const Icon(
//                     Icons.person,
//                     size: 80,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 30), // Space between avatar and button
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.6,
//                   child: ElevatedButton(
//                     onPressed: () {}, 
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF1145A8)),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(60),
//                         ),
//                       ),
//                       padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
//                     ),
//                     child: const Text(
//                       "Add a photo",
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 40), // Space between button and "Skip" text
//                 InkWell(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => const Dashboard(),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     "Skip",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:athletimate/components/topBar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:athletimate/viewModel/userViewModel.dart';
import 'package:athletimate/dashboard.dart';

class SignUp3 extends StatefulWidget {
  final String name;
  final String email;
  final String pwd;
  final String dob;
  final List<String> selectedSports;

  const SignUp3({
    Key? key,
    required this.name,
    required this.email,
    required this.pwd,
    required this.dob,
    required this.selectedSports,
  }) : super(key: key);

  @override
  State<SignUp3> createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  File? _selectedPhoto;

  // Function to pick a photo
  Future<void> _pickPhoto() async {
    try {
      // Open file picker to choose an image from the gallery
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image, // Only allow image files
      );

      if (result != null) {
        setState(() {
          // Assign the selected file to the _selectedPhoto variable
          _selectedPhoto = File(result.files.single.path!);
        });
      } else {
        print('No file selected');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  // Function to finalize signup
  Future<void> _finalizeSignup() async {
    UserViewModel userViewModel = UserViewModel();

    bool success = await userViewModel.signUpUser(
      name: widget.name,
      email: widget.email,
      password: widget.pwd,
      dob: widget.dob,
      selectedSports: widget.selectedSports,
      profilePhoto: _selectedPhoto, // Optional photo
    );

    if (success == true) {
      // Navigate to the dashboard on success
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } else {
      // Show error message on failure
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sign-up failed. Please try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(context),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/bg3.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.only(top: 150, bottom: 30),
                    child: Text(
                      "ADD PROFILE PHOTO",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: _selectedPhoto != null ? FileImage(_selectedPhoto!) : null,
                    child: _selectedPhoto == null
                        ? Icon(Icons.person, size: 80, color: Colors.grey)
                        : null,
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                        onPressed: _pickPhoto,
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
                          "Add a photo",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Test data
                  // Text(widget.name + widget.pwd +" " +widget.email),
                  // Text(widget.dob + widget.selectedSports.join(", ")),
                  // Text(_selectedPhoto?.path ?? "No photo selected"),
                  
                  TextButton(
                    // onPressed: _finalizeSignup, // Skip profile photo
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Dashboard())
                      );
                    },
                    child: Text("Skip",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ]
        )
      )
    );
  }
}
