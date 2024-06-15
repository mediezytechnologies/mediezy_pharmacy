import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/controller/completed/completed_controller.dart';
import 'package:mediezy_medical/mvc/controller/controller/new_order_controller/new_order_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/builder_card_widget.dart';
import 'package:mediezy_medical/mvc/view/screens/home/new_orders/demo.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/custom_tabbar_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';
import 'package:mediezy_medical/mvc/view/screens/home/new_orders/order_details_screen.dart';
import 'package:mediezy_medical/mvc/view/screens/home/widgets/custom_drawer.dart';

import '../../../services/get_local_storage.dart';

// ignore: must_be_immutable
class NewOrderScreen extends StatefulWidget {
  NewOrderScreen({super.key});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  final MedicineController medicineController = Get.put(MedicineController());
  final UpcomingDateController upcomingDateController =
      Get.put(UpcomingDateController());
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    upcomingDateController.getUpcomingDate();
    medicineController.getMedicine();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final CompletedController completedController =
      Get.put(CompletedController());

  final String? userName = GetLocalStorage.getUserIdAndToken('firstname');
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
          upcomingDateController.getUpcomingDate();
      },),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: kMainColor,
        title: Text(
          userName.toString(),
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          VerticalSpacingWidget(height: 10),
          CustomTabbarWidget(
            height: size.width > 450 ? 60.h : 35.h,
            marginHorizontal: 8,
            controller: tabController,
            unselectedLebelSize: size.width > 450 ? 10.sp : 13.sp,
            selectedLebelSize: size.width > 450 ? 11.sp : 15.sp,
            tabText1: "Upcoming",
            tabText2: "Completed",
            onTap: (value) {
              if (tabController.index == 0) {
                medicineController.getMedicine();
              } else {
                completedController.getCompletedOrders();
              }
            },
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                NestedTabBar(
                  tabController: tabController,
                ),
                Obx(() {
                  if (completedController.loading.value) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (completedController.medicineOrder!.isEmpty) {
                    return Center(
                      child: Image(
                        height: 200.h,
                        width: 200.w,
                        image: const AssetImage("assets/images/no orders.png"),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: completedController.medicineOrder!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => OrderDetailsScreen(
                                name: completedController
                                    .medicineOrder![index].patientName
                                    .toString(),
                                date: completedController
                                    .medicineOrder![index].date
                                    .toString(),
                                itemCount: completedController
                                    .medicineOrder![index].medicines!.length,
                                medicines: completedController
                                    .medicineOrder![index].medicines,
                                drName: completedController
                                    .medicineOrder![index].doctorName
                                    .toString(),
                                patientImage: completedController
                                    .medicineOrder![index].userImage,
                                drId: completedController
                                    .medicineOrder![index].doctorId
                                    .toString(),
                                patientId: completedController
                                    .medicineOrder![index].patientId
                                    .toString(),
                                tokenId: completedController
                                    .medicineOrder![index].tokenId
                                    .toString(),
                                type: 1,
                                checkBoxVisibleId: tabController.index,
                                prescriptionImage: completedController
                                    .medicineOrder![index].prescriptionImage,
                              ),
                            ),
                          );
                        },
                        child: BuilderCardWidget(
                          patientImage: completedController
                              .medicineOrder![index].userImage,
                          name: completedController
                              .medicineOrder![index].patientName
                              .toString(),
                          date: completedController.medicineOrder![index].date
                              .toString(),
                          drName: completedController
                              .medicineOrder![index].doctorName
                              .toString(),
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
