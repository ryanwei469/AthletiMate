class UserModel {
  String? userId;
  String name;
  String email;
  String pwd; // Note: Storing passwords in plaintext is insecure; avoid saving passwords directly.
  String dob;
  List<String> selectedSports;

  UserModel({
    this.userId,
    required this.name,
    required this.email,
    required this.pwd,
    required this.dob,
    required this.selectedSports,
  });

  /// Convert `UserModel` to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      // Do not store passwords in plaintext
      'dob': dob,
      'selectedSports': selectedSports,
    };
  }

  /// Create a `UserModel` instance from a Firestore map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String?,
      name: map['name'] as String,
      email: map['email'] as String,
      pwd: '', // Do not populate password when reading from Firestore
      dob: map['dob'] as String,
      selectedSports: List<String>.from(map['selectedSports'] ?? []),
    );
  }
}
