import 'dart:convert';

GetProfileModel GetProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String GetProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  final bool? success;
  final Medicalshop? medicalshop;
  final String? code;
  final String? message;

  GetProfileModel({
    this.success,
    this.medicalshop,
    this.code,
    this.message,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        success: json["success"],
        medicalshop: Medicalshop.fromJson(json["medicalshop"]),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "medicalshop": medicalshop!.toJson(),
        "code": code,
        "message": message,
      };
}

class Medicalshop {
  final int id;
  final String medicalShopName;
  final dynamic medicalshopImage;
  final String mobileNumber;
  final String location;
  final String email;
  final String address;
  final int pincode;
  final int mecialShopId;

  Medicalshop({
    required this.id,
    required this.medicalShopName,
    required this.medicalshopImage,
    required this.mobileNumber,
    required this.location,
    required this.email,
    required this.address,
    required this.pincode,
    required this.mecialShopId,
  });

  factory Medicalshop.fromJson(Map<String, dynamic> json) => Medicalshop(
        id: json["id"],
        medicalShopName: json["medical_shop_name"],
        medicalshopImage: json["medicalshop_image"],
        mobileNumber: json["mobile_number"],
        location: json["location"],
        email: json["email"],
        address: json["address"],
        pincode: json["pincode"],
        mecialShopId: json["mecial_shop_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "medical_shop_name": medicalShopName,
        "medicalshop_image": medicalshopImage,
        "mobile_number": mobileNumber,
        "location": location,
        "email": email,
        "address": address,
        "pincode": pincode,
        "mecial_shop_id": mecialShopId,
      };
}
