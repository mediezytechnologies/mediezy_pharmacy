import 'package:json_annotation/json_annotation.dart';

import 'medicine.dart';

part 'medicine_order.g.dart';

@JsonSerializable()
class MedicineOrder {
	@JsonKey(name: 'PatientName') 
	String? patientName;
	@JsonKey(name: 'mediezy_patient_id') 
	String? mediezyPatientId;
	@JsonKey(name: 'patient_id') 
	int? patientId;
	@JsonKey(name: 'User_id') 
	int? userId;
	String? gender;
	int? age;
	@JsonKey(name: 'MobileNo') 
	String? mobileNo;
	@JsonKey(name: 'Appoinmentfor_id') 
	String? appoinmentforId;
	String? date;
	@JsonKey(name: 'TokenNumber') 
	String? tokenNumber;
	@JsonKey(name: 'TokenTime') 
	String? tokenTime;
	@JsonKey(name: 'medicalshop_userId') 
	int? medicalshopUserId;
	List<Medicine>? medicines;

	MedicineOrder({
		this.patientName, 
		this.mediezyPatientId, 
		this.patientId, 
		this.userId, 
		this.gender, 
		this.age, 
		this.mobileNo, 
		this.appoinmentforId, 
		this.date, 
		this.tokenNumber, 
		this.tokenTime, 
		this.medicalshopUserId, 
		this.medicines, 
	});

	factory MedicineOrder.fromJson(Map<String, dynamic> json) {
		return _$MedicineOrderFromJson(json);
	}

	Map<String, dynamic> toJson() => _$MedicineOrderToJson(this);
}
