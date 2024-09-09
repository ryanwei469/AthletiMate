class UserModel{
  String? userId;
  String name;
  String email;
  String pwd;
  String dob;
  List<String> selectedSports;

  UserModel({
    this.userId,
    required this.name,
    required this.email,
    required this.pwd,
    required this.dob,
    required this.selectedSports
  });
}