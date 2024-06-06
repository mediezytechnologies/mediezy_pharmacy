import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/demo/demo.dart';
import 'package:mediezy_medical/presentation/screens/common_widgets/builder_card_widget.dart';
import 'package:mediezy_medical/presentation/screens/recent_orders/completed_details_screen/completed_details_screen.dart';
import 'package:mediezy_medical/presentation/screens/recent_orders/new_orders/order_details_screen.dart';
import 'package:mediezy_medical/presentation/core/app_colors.dart';

// ignore: must_be_immutable
class DemoScreen extends StatefulWidget {
  DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  final MedicineController controller = Get.put(MedicineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recent Orders"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 55.h,
            color: kScaffoldColor,
            child: TabBar(
              controller: tabController,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.only(
                  top: 10.h, left: 10.w, right: 10.w, bottom: 10.h),
              unselectedLabelColor: kTextColor,
              unselectedLabelStyle: TextStyle(
                fontSize: 12.sp,
              ),
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: kMainColor),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "New orders",
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("Past orders"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Obx(() {
                  if (controller.loding.value) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (controller.medicineOrder!.isEmpty) {
                    return Center(
                      child: Image(
                        height: 200.h,
                        width: 200.w,
                        image: const AssetImage("assets/images/no_data.jpg"),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.medicineOrder!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => OrderDetailsScreen(
                                name: controller
                                    .medicineOrder![index].patientName
                                    .toString(),
                                date: controller.medicineOrder![index].date
                                    .toString(),
                                itemCount: controller
                                    .medicineOrder![index].medicines!.length,
                                medicines:
                                    controller.medicineOrder![index].medicines,
                                drName: controller
                                    .medicineOrder![index].doctorName
                                    .toString(),
                                patientImage:
                                    controller.medicineOrder![index].userImage,
                              ),
                            ),
                          );
                        },
                        child: BuilderCardWidget(
                          patientImage:
                              controller.medicineOrder![index].userImage,
                          name: controller.medicineOrder![index].patientName
                              .toString(),
                          date:
                              controller.medicineOrder![index].date.toString(),
                          drName: controller.medicineOrder![index].doctorName
                              .toString(),
                        ),
                      );
                    },
                  );
                }),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const CompletedDetailsScreen(),
                          ),
                        );
                      },
                      child: const Text("frghdf"),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
