import 'package:json_annotation/json_annotation.dart';

part 'medicine.g.dart';

@JsonSerializable()
class Medicine {
	int? id;
	@JsonKey(name: 'mediezy_doctor_id') 
	dynamic mediezyDoctorId;
	@JsonKey(name: 'user_id') 
	int? userId;
	@JsonKey(name: 'docter_id') 
	int? docterId;
	@JsonKey(name: 'patient_id') 
	int? patientId;
	@JsonKey(name: 'medical_shop_id') 
	int? medicalShopId;
	@JsonKey(name: 'medicine_id') 
	int? medicineId;
	String? medicineName;
	@JsonKey(name: 'Dosage') 
	String? dosage;
	String? interval;
	@JsonKey(name: 'time_section') 
	String? timeSection;
	@JsonKey(name: 'NoOfDays') 
	String? noOfDays;
	@JsonKey(name: 'Noon') 
	int? noon;
	int? night;
	@JsonKey(name: 'created_at') 
	DateTime? createdAt;
	@JsonKey(name: 'updated_at') 
	DateTime? updatedAt;
	@JsonKey(name: 'token_id') 
	int? tokenId;
	int? morning;
	int? type;
	dynamic notes;
	dynamic illness;
	int? evening;
	@JsonKey(name: 'token_number') 
	int? tokenNumber;
	@JsonKey(name: 'medicine_type') 
	int? medicineType;

	Medicine({
		this.id, 
		this.mediezyDoctorId, 
		this.userId, 
		this.docterId, 
		this.patientId, 
		this.medicalShopId, 
		this.medicineId, 
		this.medicineName, 
		this.dosage, 
		this.interval, 
		this.timeSection, 
		this.noOfDays, 
		this.noon, 
		this.night, 
		this.createdAt, 
		this.updatedAt, 
		this.tokenId, 
		this.morning, 
		this.type, 
		this.notes, 
		this.illness, 
		this.evening, 
		this.tokenNumber, 
		this.medicineType, 
	});

	factory Medicine.fromJson(Map<String, dynamic> json) {
		return _$MedicineFromJson(json);
	}

	Map<String, dynamic> toJson() => _$MedicineToJson(this);
}
