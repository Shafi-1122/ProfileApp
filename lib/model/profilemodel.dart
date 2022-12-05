import 'dart:convert';

ProfileDetails profiletojsonFromJson(String str) => ProfileDetails.fromJson(json.decode(str));

String profileToJson(ProfileDetails data) => json.encode(data.toJson());

class ProfileDetails {
    ProfileDetails({
        this.data,
        this.itemCount,
    });

    List<Datum>? data;
    int? itemCount;

    factory ProfileDetails.fromJson(Map<String, dynamic> json) => ProfileDetails(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        itemCount: json["itemCount"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "itemCount": itemCount,
    };
}

class Datum {
    Datum({
        this.userId,
        this.imageBinary,
        this.username,
        this.email,
        this.mobile,
        this.address,
    });

    String? userId;
    String? imageBinary;
    String ?username;
    String? email;
    String? mobile;
    String ?address;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["user_id"],
        imageBinary: json["imageBinary"],
        username: json["username"],
        email: json["email"],
        mobile: json["mobile"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "imageBinary": imageBinary,
        "username": username,
        "email": email,
        "mobile": mobile,
        "address": address,
    };
}
