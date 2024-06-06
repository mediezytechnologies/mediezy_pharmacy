import 'package:json_annotation/json_annotation.dart';

part 'medical_shop.g.dart';

@JsonSerializable()
class MedicalShop {
	int? id;
	String? firstname;
	String? mobileNo;
	String? email;
	@JsonKey(name: 'user_role') 
	String? userRole;

	MedicalShop({
		this.id, 
		this.firstname, 
		this.mobileNo, 
		this.email, 
		this.userRole, 
	});

	factory MedicalShop.fromJson(Map<String, dynamic> json) {
		return _$MedicalShopFromJson(json);
	}

	Map<String, dynamic> toJson() => _$MedicalShopToJson(this);
}
