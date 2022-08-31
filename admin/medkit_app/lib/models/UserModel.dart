class UsersModel {
  UsersModel({
    required this.uid,
    required this.name,
    required this.keyName,
    required this.email,
    required this.creationTime,
    required this.lastSignInTime,
    required this.photoUrl,
    required this.phoneNumber,
    required this.address,
    required this.status,
    required this.updatedTime,
  });

  String uid;
  String name;
  String keyName;
  String email;
  String creationTime;
  String lastSignInTime;
  String photoUrl;
  String phoneNumber;
  String address;
  String status;
  String updatedTime;
}
