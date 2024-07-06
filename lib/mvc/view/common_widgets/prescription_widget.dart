import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/controller/order_details_controller.dart/order_details_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/text_style_widget.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/horizontal_spacing_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/view_image_widget.dart';

class PrescriptionWidget extends StatelessWidget {
  const PrescriptionWidget({
    super.key,
    required this.prescriptionImages,
    this.checkBoxId,
  });

  final List<String> prescriptionImages;
  final int? checkBoxId;

  @override
  Widget build(BuildContext context) {
    final CheckboxController checkboxController = Get.put(CheckboxController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Prescription images : ", style: greyMain),
              const VerticalSpacingWidget(height: 2),
              ListView.builder(
                itemCount: prescriptionImages.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewImageWidget(
                            viewFile: prescriptionImages[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        color: kScaffoldColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("${index + 1}.", style: grey12B500),
                              const HorizontalSpacingWidget(width: 5),
                              Text("Image ${index + 1}", style: black13B500),
                            ],
                          ),
                          Icon(
                            IconlyLight.image,
                            color: kMainColor,
                          ),
                          checkBoxId == 1
                              ? Container()
                              : Obx(() {
                                  return Checkbox(
                                    activeColor: kMainColor,
                                    value: checkboxController
                                        .checkedPrescriptions
                                        .contains(prescriptionImages[index]),
                                    onChanged: (newValue) {
                                      checkboxController.toggleItem(
                                        prescriptionImages[
                                            index], // Pass the item to toggle
                                        prescriptionImages
                                            .length, // Pass the total count of items
                                      );
                                    },
                                  );
                                }),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
