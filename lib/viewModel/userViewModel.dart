// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// // Read user info
// Future<UserModel?> getUser(String userId) async {
//   DocumentSnapshot snapshot = await _firestore.collection('users').doc(userId).get();

//   if(snapshot.exists){
//     return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
//   }

//   return null;

// }

// // Update profile photo
// Future<void> updatePhoto(String userId, String? photoUrl) async{
//   await _firestore.collection('users').doc(userId).update({
//     'profilePhoto': user.profilePhoto,
//   });
// }

// // Update user
// import 'package:athletimate/model/User.dart';

// Future<void> updateUser(String userId, UserModel user) async{
//   await _firestore.collection('users').doc(userId).update({
//     'name': user.name,
//     'email': user.email
//   });
// }

// // Delete/Deactivate user
// Future<void> deleteUser(String userId) async{
//   await _firestore.collection('users').doc(userId).delete();
// }

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:athletimate/model/User.dart';

class UserViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Sign up a user and optionally upload profile photo
  Future<bool> signUpUser({
    required String name,
    required String email,
    required String password,
    required String dob,
    required List<String> selectedSports,
    File? profilePhoto, // Optional photo
  }) async {
    try {
      // Step 1: Register user with Firebase Auth
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String userId = userCredential.user!.uid;

      // Step 2: Upload profile photo if provided
      String? photoUrl;
      if (profilePhoto != null) {
        photoUrl = await _uploadProfilePhoto(userId, profilePhoto);
      }

      // Step 3: Save user details to Firestore
      await _saveUserDetails(
        userId: userId,
        name: name,
        email: email,
        dob: dob,
        selectedSports: selectedSports,
        profilePhotoUrl: photoUrl,
      );

      return true;
    } catch (e) {
      print("Error during sign-up: $e");
      return false;
    }
  }

  /// Helper function to upload profile photo to Firebase Storage
  Future<String> _uploadProfilePhoto(String userId, File photo) async {
    try {
      Reference ref = _storage.ref().child('profilePhotos/$userId.jpg');
      UploadTask uploadTask = ref.putFile(photo);
      TaskSnapshot snapshot = await uploadTask;

      // Get download URL
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print("Error uploading photo: $e");
      rethrow; // Rethrow the error if something goes wrong
    }
  }

  /// Helper function to save user details to Firestore
  Future<void> _saveUserDetails({
    required String userId,
    required String name,
    required String email,
    required String dob,
    required List<String> selectedSports,
    String? profilePhotoUrl,
  }) async {
    UserModel newUser = UserModel(
      userId: userId,
      name: name,
      email: email,
      pwd: "", // Don't save plaintext passwords
      dob: dob,
      selectedSports: selectedSports,
    );

    Map<String, dynamic> userData = newUser.toMap();
    if (profilePhotoUrl != null) {
      userData['profilePhoto'] = profilePhotoUrl;
    }

    await _firestore.collection('users').doc(userId).set(userData);
  }
}
