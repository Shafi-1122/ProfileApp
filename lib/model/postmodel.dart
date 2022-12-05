import 'dart:convert';

import 'dart:typed_data';
import 'dart:io';
UserDetails welcomeFromJson(String str) => UserDetails.fromJson(json.decode(str));

String welcomeToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
    UserDetails({
       required this.imagePath,
      required  this.username,
        required this.email,
       required this.mobile,
       required this.address,
      required  this.userId,
    });

    String? imagePath;
    String? username;
    String? email;
    String? mobile;
    String? address;
    String? userId;



    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        imagePath: json["imagePath"],
        username: json["username"],
        email: json["email"],
        mobile: json["mobile"],
        address: json["address"],
        userId: json["user_id"],
    );
    

    Map<String, dynamic> toJson()  => {
        "imagePath":imagePath,
                "username": username,
        "email": email,
        "mobile": mobile,
        "address": address,
        "user_id": userId,
    };
}
