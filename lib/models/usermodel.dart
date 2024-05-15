import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? id,username,email;
  UserModel({this.email,this.id,this.username});
  factory UserModel.fromMap(DocumentSnapshot map){
    return UserModel(
      email: map["email"],
      username: map["username"],
      id:map.id
    );
  }
  Map<String,dynamic> toMap(){
    return {
     // "id":id,
      "email":email,
      "username":username,
    };
  }
}