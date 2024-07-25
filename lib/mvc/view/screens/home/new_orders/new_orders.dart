import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mediezy_medical/mvc/controller/controller/checkbox_controller/checkbox_controller.dart';
import 'package:mediezy_medical/mvc/controller/controller/completed/completed_controller.dart';
import 'package:mediezy_medical/mvc/controller/controller/new_order_controller/new_order_controller.dart';
import 'package:mediezy_medical/mvc/controller/controller/profile/get_profile_controller.dart';
import 'package:mediezy_medical/mvc/view/screens/home/new_orders/completed_other.dart';
import 'package:mediezy_medical/mvc/view/screens/home/new_orders/date_get_widget.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/custom_tabbar_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';
import 'package:mediezy_medical/mvc/view/screens/home/widgets/custom_drawer.dart';

import '../../../services/get_local_storage.dart';

class NewOrderScreen extends StatefulWidget {
  NewOrderScreen({Key? key}) : super(key: key);

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen>
    with TickerProviderStateMixin {
  TabController? tabController;

  final MedicineController medicineController = Get.put(MedicineController());
  final CheckboxController checkboxController = Get.put(CheckboxController());
  final GetProfileController getProfileController =
      Get.put(GetProfileController());

  final UpcomingDateController upcomingDateController =
      Get.put(UpcomingDateController());
  final CompletedController completedController =
      Get.put(CompletedController());
  //var date =DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    upcomingDateController.getUpcomingDate().then((_) {
      setState(() {
        tabController = TabController(length: 2, vsync: this);
      });
      medicineController
          .getMedicine(upcomingDateController.nestedTabIndex.value);
    });
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  final String? userName = GetLocalStorage.getUserIdAndToken('firstname');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: kMainColor,
        title: Obx(() {
          return Text(
            getProfileController.getProfileModel.value.medicalShopName
                .toString(),
            style: TextStyle(color: Colors.white),
          );
        }),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Obx(() {
        if (upcomingDateController.loading.value || tabController == null) {
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            VerticalSpacingWidget(height: 10),
            CustomTabbarWidget(
              height: size.width > 450 ? size.height * .07 : size.height * .055,
              marginHorizontal: 8,
              controller: tabController!,
              unselectedLebelSize: size.width > 450 ? 10.sp : 13.sp,
              selectedLebelSize: size.width > 450 ? 11.sp : 15.sp,
              tabText1: "Upcoming",
              tabText2: "Completed",
              onTap: (value) {
                if (tabController!.index == 0) {
                  log("message");
                  checkboxController.allChecked.value = false;
                  checkboxController.checkedMedicines.clear();
                  checkboxController.checkedPrescriptions.clear();
                  upcomingDateController.getUpcomingDate();
                  medicineController.getMedicine(formattedDate);
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
                  DateGetWidget(tabController: tabController!),
                  CompletedOrdersTab(tabController: tabController!),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
