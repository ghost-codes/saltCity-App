class UserModel {
  String email;
  String userName;
  String uid;
  String photoUrl;
  String mobile;

  UserModel({this.email, this.userName, this.uid, this.photoUrl});

  factory UserModel.fromJson(json) {
    return UserModel(
      userName: json['userName'],
      email: json['email'],
      uid: json['uid'],
      photoUrl: json['photoUrl'],
    );
  }
}
