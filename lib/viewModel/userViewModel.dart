// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// // Create an admin user
// Future<void> createAdminUser(UserModel user) async{
//   await _firestore.collection('users').add({
//     'name': 'admin_${user.name}',
//     'email': user.email
//   });
// }

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