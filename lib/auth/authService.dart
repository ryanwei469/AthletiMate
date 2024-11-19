import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // // Create an admin user
  // Future<void> createAdminUser(UserModel user) async{
  //   await _firestore.collection('users').add({
  //     'name': 'admin_${user.name}',
  //     'email': user.email
  //   });
  // }

  Future<void> signOut() async{
    try{
      await _auth.signOut();
      print("User signed out");

    }catch(error){
      print("Error during sign-out: $error");
    }
  }
}