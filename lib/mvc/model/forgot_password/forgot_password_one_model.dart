import 'dart:convert';

ForgotPasswordOneModel forgotPasswordOneModelFromJson(String str) =>
    ForgotPasswordOneModel.fromJson(json.decode(str));

String forgotPasswordOneModelToJson(ForgotPasswordOneModel data) =>
    json.encode(data.toJson());

class ForgotPasswordOneModel {
  final bool? status;
  final String? message;
  final int? userId;

  ForgotPasswordOneModel({
    this.status,
    this.message,
    this.userId,
  });

  factory ForgotPasswordOneModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordOneModel(
        status: json["status"],
        message: json["message"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user_id": userId,
      };
}
