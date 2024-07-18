// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mediezy_medical/mvc/controller/controller/checkbox_controller/checkbox_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';
import 'package:mediezy_medical/mvc/view/screens/home/widgets/order_list_widget.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';
import '../../../../controller/controller/new_order_controller/new_order_controller.dart';

class DateGetWidget extends StatefulWidget {
  DateGetWidget({Key? key, required this.tabController}) : super(key: key);

  final TabController tabController;

  @override
  _DateGetWidgetState createState() => _DateGetWidgetState();
}

class _DateGetWidgetState extends State<DateGetWidget>
    with SingleTickerProviderStateMixin {
  TabController? _nestedTabController;
  final UpcomingDateController upcomingDateController =
      Get.find<UpcomingDateController>();
  final MedicineController medicineController = Get.find<MedicineController>();
  final CheckboxController checkboxController = Get.put(CheckboxController());
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  Timer? _pollingTimer;
  @override
  void initState() {
    initializeTabController();
    startPolling();
    super.initState();
  }

  void initializeTabController() {
    if (upcomingDateController.tabLength.value > 0) {
      log("date  ====  :: ${upcomingDateController.tabLength.value - 1}");
      medicineController.selectedIndex.value =
          upcomingDateController.tabLength.value - 1;
      _nestedTabController = TabController(
        length: upcomingDateController.tabLength.value,
        initialIndex: upcomingDateController.tabLength.value - 1,
        vsync: this,
      );
      _nestedTabController!.addListener(_handleTabSelection);
    }
  }

  void _handleTabSelection() {
    if (_nestedTabController!.indexIsChanging) {
      medicineController.getMedicine(upcomingDateController
          .date[_nestedTabController!.index].formatDate
          .toString());
      medicineController.selectedIndex.value = _nestedTabController!.index;
      log("fkjskdlfjsadklfjsakldfjkldsa===========${medicineController.selectedIndex.value}");
      log("fkjskdlfjsadklfjsakldfjkldsa===========${_nestedTabController!.index}");
    }
  }

  void startPolling() {
    _pollingTimer?.cancel(); // Cancel any existing timer
    _pollingTimer = Timer.periodic(const Duration(seconds: 15), (timer) {
      medicineController.getMedicine(upcomingDateController
          .date[_nestedTabController!.index].formatDate
          .toString());
    });
  }

  @override
  void dispose() {
    _nestedTabController?.removeListener(_handleTabSelection);
    _nestedTabController?.dispose();
    _pollingTimer?.cancel(); // Cancel the timer when disposing
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(() {
      if (upcomingDateController.loading.value ||
          _nestedTabController == null) {
        return Center(
          child: Image(
            height: 200.h,
            width: 200.w,
            image: const AssetImage("assets/images/no orders.png"),
          ),
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpacingWidget(height: 10),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: TabBar(
              onTap: (value) {
                checkboxController.allChecked.value = false;
                checkboxController.checkedMedicines.clear();
                checkboxController.checkedPrescriptions.clear();

                medicineController.getMedicine(upcomingDateController
                    .date[_nestedTabController!.index].formatDate
                    .toString());
                medicineController.selectedIndex.value =
                    _nestedTabController!.index;
              },
              controller: _nestedTabController,
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.transparent;
                  }
                  // ignore: duplicate_ignore
                  // ignore: deprecated_member_use
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.transparent;
                  }
                  return null;
                },
              ),
              labelStyle: TextStyle(
                fontSize: size.width > 450 ? 11.sp : 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              physics: const NeverScrollableScrollPhysics(),
              unselectedLabelColor: Colors.black54,
              unselectedLabelStyle: TextStyle(
                fontSize: size.width > 450 ? 11.sp : 13.sp,
              ),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              tabs: List.generate(upcomingDateController.date.length, (index) {
                var tab = upcomingDateController.date[index];
                log("===========================${upcomingDateController.date[index]}");
                return Container(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    height: 28.h,
                    decoration: BoxDecoration(
                        color: medicineController.selectedIndex.value == index
                            ? kMainColor
                            : kCardColor,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(6.r)),
                    child: Tab(text: tab.date));
              }),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (medicineController.loding.value ||
                  _nestedTabController == null) {
                return Center(child: CircularProgressIndicator());
              }
              return TabBarView(
                controller: _nestedTabController,
                children: upcomingDateController.date.map((tab) {
                  return Obx(() {
                    if (medicineController.loding.value) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (medicineController.medicineOrder.isEmpty) {
                      return Center(
                        child: Image(
                          height: 200.h,
                          width: 200.w,
                          image:
                              const AssetImage("assets/images/no orders.png"),
                        ),
                      );
                    }
                    return OrderListWidget(
                      medicineOrder: medicineController.medicineOrder,
                      type: 0,
                      checkBoxVisibleId: widget.tabController.index,
                    );
                  });
                }).toList(),
              );
            }),
          ),
        ],
      );
    });
  }
}
