// import 'package:athletimate/components/bottomBar.dart';
// import 'package:athletimate/components/topBar.dart';
// import 'package:flutter/material.dart';

// class Settings extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: TopBar(context),
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/bg2.jpg',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Column(
//             children: [
//               SizedBox(height: 45),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.arrow_back, color: Colors.white),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                     SizedBox(width: 80),
//                     Text(
//                       "SETTINGS",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Column(
//                     children: [
//                       // First Container
//                       Container(
//                         padding: EdgeInsets.all(15),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.white,
//                         ),
//                         child: const Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: Icon(
//                                 Icons.thumb_up_off_alt_outlined,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Leave Feedback",
//                                     style: TextStyle(fontWeight: FontWeight.w600),
//                                   ),
//                                   Text(
//                                     "Help us to improve our app by giving your valuable feedback",
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 20),

//                       // Grouped Containers with Divider
//                       Container(
//                         padding: EdgeInsets.all(15),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.white,
//                         ),
//                         child: const Column(
//                           children: [
//                             // First Row in the Group
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(10),
//                                   child: Icon(
//                                     Icons.notifications_outlined,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 SizedBox(width: 10),
//                                 Expanded(
//                                   child: 
//                                     Text(
//                                       "Clear Cache",
//                                       style: TextStyle(fontWeight: FontWeight.w600),
//                                     ),
//                                 ),
//                               ],
//                             ),

//                             SizedBox(height: 5),
//                             Divider(color: Colors.black), // Horizontal line
//                             SizedBox(height: 5),

//                             // Second Row in the Group
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(10),
//                                   child: Icon(
//                                     Icons.help_outline_outlined,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 SizedBox(width: 10),
//                                 Expanded(
//                                   child: Text(
//                                     "FAQ",
//                                     style: TextStyle(fontWeight: FontWeight.w600),
//                                   ),
//                                 ),
//                                 Icon(
//                                   Icons.arrow_forward_ios_rounded
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 20),

//                       Container(
//                         alignment: Alignment.centerLeft,
//                         child: const Padding(
//                           padding: EdgeInsets.all(10),
//                           child: Text(
//                             "Legal",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white
//                             ),
//                             textAlign: TextAlign.right,
//                           ),
//                         ),
//                       ),

//                       // Grouped Containers with Divider
//                       Container(
//                         padding: EdgeInsets.all(15),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.white,
//                         ),
//                         child: const Column(
//                           children: [
//                             // First Row in the Group
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(10),
//                                   child: Icon(
//                                     Icons.insert_drive_file_outlined,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 SizedBox(width: 10),
//                                 Expanded(
//                                   child: Text(
//                                     "Terms and Conditions",
//                                     style: TextStyle(fontWeight: FontWeight.w600),
//                                   ),
//                                 ),
//                                 Icon(
//                                   Icons.arrow_forward_ios_rounded
//                                 )
//                               ],
//                             ),

//                             SizedBox(height: 5),
//                             Divider(color: Colors.black), // Horizontal line
//                             SizedBox(height: 5),
                    
//                             // Second Row in the Group
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(10),
//                                   child: Icon(
//                                     Icons.security_outlined,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 SizedBox(width: 10),
//                                 Expanded(
//                                   child: Text(
//                                     "Data and privacy",
//                                     style: TextStyle(fontWeight: FontWeight.w600),
//                                   ),
//                                 ),
//                                 Icon(
//                                   Icons.arrow_forward_ios_rounded
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 20),

//                       // Sign out
//                       Container(
//                         padding: EdgeInsets.all(15),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.white,
//                         ),
//                         child: const Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: Icon(
//                                 Icons.logout_outlined,
//                                 color: Colors.red,
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             Expanded(
//                               child: Text(
//                                 "Sign out",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.red
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:athletimate/components/topBar.dart';
import 'package:athletimate/opening.dart';
import 'package:athletimate/signIn.dart';
import 'package:athletimate/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut(); // Sign out the user
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Opening()),
        (route) => false, // Remove all routes
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error logging out: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(context),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bg2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 45),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 80),
                    const Text(
                      "SETTINGS",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        // First Container: Leave Feedback
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.thumb_up_off_alt_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Leave Feedback",
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Help us to improve our app by giving your valuable feedback",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Grouped Containers with Divider
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              // First Row: Clear Cache
                              Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.notifications_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      "Clear Cache",
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Divider(color: Colors.black),
                              const SizedBox(height: 5),
                              // Second Row: FAQ
                              Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.help_outline_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      "FAQ",
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Legal Section Header
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Legal",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),

                        // Grouped Containers with Divider for Legal
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              // First Row: Terms and Conditions
                              Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.insert_drive_file_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      "Terms and Conditions",
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Divider(color: Colors.black),
                              const SizedBox(height: 5),
                              // Second Row: Data and Privacy
                              Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.security_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      "Data and privacy",
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Logout Button
                        GestureDetector(
                          onTap: () => _logout(context),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.logout_outlined,
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Expanded(
                                  child: Text(
                                    "Sign out",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
