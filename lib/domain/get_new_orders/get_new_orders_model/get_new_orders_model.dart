import 'package:json_annotation/json_annotation.dart';

import 'medicine_order.dart';

part 'get_new_orders_model.g.dart';

@JsonSerializable()
class GetNewOrdersModel {
	bool? status;
	@JsonKey(name: 'Medicine Order') 
	List<MedicineOrder>? medicineOrder;
	String? message;

	GetNewOrdersModel({this.status, this.medicineOrder, this.message});

	factory GetNewOrdersModel.fromJson(Map<String, dynamic> json) {
		return _$GetNewOrdersModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GetNewOrdersModelToJson(this);
}
