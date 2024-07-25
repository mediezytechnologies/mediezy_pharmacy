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
  final int? id;
  final String? medicalShopName;
  final String? mediezyMedicalshopId;
  final String? medicalshopImage;
  final String? mobileNumber;
  final String? location;
  final String? email;
  final String? address;
  final int? pincode;
  final int? mecialShopId;

  Medicalshop({
    this.id,
    this.medicalShopName,
    this.mediezyMedicalshopId,
    this.medicalshopImage,
    this.mobileNumber,
    this.location,
    this.email,
    this.address,
    this.pincode,
    this.mecialShopId,
  });

  factory Medicalshop.fromJson(Map<String, dynamic> json) => Medicalshop(
        id: json["id"],
        medicalShopName: json["medical_shop_name"],
        mediezyMedicalshopId: json["mediezy_medicalshop_id"],
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
        "mediezy_medicalshop_id": mediezyMedicalshopId,
        "medicalshop_image": medicalshopImage,
        "mobile_number": mobileNumber,
        "location": location,
        "email": email,
        "address": address,
        "pincode": pincode,
        "mecial_shop_id": mecialShopId,
      };
}
