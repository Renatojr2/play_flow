import 'dart:convert';

class UserModel {
  final String name;
  final String photoUrl;

  UserModel({
    this.name,
    this.photoUrl,
  });

  Map<String, dynamic> toMap() => {
        "name": name,
        "photoUrl": photoUrl,
      };

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromMap(String json) =>
      UserModel.fromJson(jsonDecode(json));

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(name: map['name'], photoUrl: map['photoUrl']);
  }
}
