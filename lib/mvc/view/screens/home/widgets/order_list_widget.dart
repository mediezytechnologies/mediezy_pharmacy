import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_medical/mvc/model/new_order/new_order_model.dart';
import 'package:mediezy_medical/mvc/view/screens/home/widgets/builder_card_widget.dart';
import 'package:mediezy_medical/mvc/view/screens/home/new_orders/order_details_screen.dart';

class OrderListWidget extends StatelessWidget {
  const OrderListWidget(
      {super.key,
      required this.medicineOrder,
      this.type,
      required this.checkBoxVisibleId});
  final List<MedicineOrder> medicineOrder;
  final int? type;
  final int checkBoxVisibleId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: medicineOrder.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => OrderDetailsScreen(
                    name: medicineOrder[index].patientName.toString(),
                    date: medicineOrder[index].date.toString(),
                    itemCount: medicineOrder[index].medicines!.length,
                    medicines: medicineOrder[index].medicines,
                    drName: medicineOrder[index].doctorName.toString(),
                    patientImage: medicineOrder[index].userImage,
                    drId: medicineOrder[index].doctorId.toString(),
                    patientId: medicineOrder[index].patientId.toString(),
                    tokenId: medicineOrder[index].tokenId.toString(),
                    type: type,
                    checkBoxVisibleId: checkBoxVisibleId,
                    prescriptionImages: medicineOrder[index].prescriptionImage!,
                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h),
              child: BuilderCardWidget(
                patientImage: medicineOrder[index].userImage,
                name: medicineOrder[index].patientName.toString(),
                date: medicineOrder[index].date.toString(),
                drName: medicineOrder[index].doctorName.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
