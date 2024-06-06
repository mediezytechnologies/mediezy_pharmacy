import 'package:json_annotation/json_annotation.dart';

import 'medical_shop.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
	@JsonKey(name: 'medical_shop') 
	MedicalShop? medicalShop;
	String? token;
	String? role;

	AuthModel({this.medicalShop, this.token, this.role});

	factory AuthModel.fromJson(Map<String, dynamic> json) {
		return _$AuthModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
