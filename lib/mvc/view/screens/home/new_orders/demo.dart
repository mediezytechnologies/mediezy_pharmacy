import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/builder_card_widget.dart';
import 'package:mediezy_medical/mvc/view/screens/home/new_orders/order_details_screen.dart';

import '../../../../controller/controller/new_order_controller/new_order_controller.dart';

// class NestedTabBar extends StatefulWidget {
//   NestedTabBar({super.key, required this.tabController});

//   final TabController tabController;
//   @override
//   _NestedTabBarState createState() => _NestedTabBarState();
// }

// class _NestedTabBarState extends State<NestedTabBar>
//     with TickerProviderStateMixin {
//   TabController? _nestedTabController;

//   final UpcomingDateController upcomingDateController =
//       Get.put(UpcomingDateController());
//   final MedicineController medicineController = Get.put(MedicineController());

//   @override
//   void initState() {
//     super.initState();
//     upcomingDateController.getUpcomingDate().then((_) {
//       initializeTabController();
//     });
//     medicineController.getMedicine();

//     // if (upcomingDateController.date!.isNotEmpty) {
//     //   String formattedDate = _formatDate(upcomingDateController.date![0].date!);
//     //   log("message          :$formattedDate");
//     //   medicineController.getMedicine(date: formattedDate);
//     //   // log(formattedDate.toString());
//     // }

//     // _nestedTabController.addListener(() {
//     //   if (_nestedTabController.indexIsChanging) {
//     //     final selectedDate =
//     //         upcomingDateController.date![_nestedTabController.index].date;
//     //     String formattedDate = _formatDate(selectedDate!);
//     //     medicineController.getMedicine(date: formattedDate);
//     //   }
//     // });
//   }
//   void initializeTabController() {
//     if (upcomingDateController.tabLength.value > 0) {
//       log("tab lenth ====${upcomingDateController.tabLength.value}");
//       _nestedTabController = TabController(
//         length: upcomingDateController.tabLength.value,
//         vsync: this,
//       );
//       // setState(() {}); // Trigger a rebuild
//     }
//   }

//   // String _formatDate(String date) {
//   //   try {
//   //     DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(date);
//   //     log("?????????????????????${parsedDate.toString()}");
//   //     return DateFormat('yyyy-MM-dd').format(parsedDate);
//   //   } catch (e) {
//   //     print("Invalid date format: $date");
//   //     return date;
//   //   }
//   // }

//   @override
//   void dispose() {
//     _nestedTabController!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: <Widget>[
//         Obx(
//          () {
//           if (upcomingDateController.loading.value) {
//             Center(child: Text("jfklsdjfklsjdfkladsjfkladsjfkldfsa"),);
//           }
//             return TabBar(
//               onTap: (index) {

//                 medicineController.getMedicine();
//                // log("<<<<<<<<<<<<<<<<<<<<<<<<<<<$formattedDate");
//               },
//               controller: _nestedTabController,
//               indicatorColor: Colors.orange,
//               labelColor: Colors.orange,
//               unselectedLabelColor: Colors.black54,
//               isScrollable: true,
//               tabs:
//               List.generate(
//                     upcomingDateController.date.length,
//                       (index) {

//                    log("fjsdfjdksa  =======  ${upcomingDateController.date.length}"    );
//                         return Obx(() {

//                           if (upcomingDateController.loading.value) {
//                             CircularProgressIndicator();
//                           }
//                           return Tab(
//                               text: upcomingDateController.date[index].formatDate);
//                         });
//                       },
//                     ),

//              // List.generate( upcomingDateController.date!.length, Text(upcomingDateController.date![index].formatDate))

//               // upcomingDateController.date!
//               //     .map((tab) => Tab(text: tab.date))
//               //     .toList(),
//             );
//           }
//         ),
//         Container(
//           color: Colors.amber,
//           height: screenHeight * 0.60,
//           margin: EdgeInsets.only(left: 16.0, right: 16.0),
//           child: TabBarView(
//             controller: _nestedTabController,
//             children: upcomingDateController.date
//                 .map((tab) => Obx(() {
//                       if (medicineController.loding.value) {
//                         // return Center(child: CircularProgressIndicator());
//                       }
//                       if (medicineController.medicineOrder!.isEmpty ||
//                           upcomingDateController.date.isEmpty) {
//                         return Center(
//                           child: Image(
//                             height: 200.h,
//                             width: 200.w,
//                             image:
//                                 const AssetImage("assets/images/no orders.png"),
//                           ),
//                         );
//                       }
//                       return ListView.builder(
//                         padding: EdgeInsets.zero,
//                         shrinkWrap: true,
//                         itemCount: medicineController.medicineOrder!.length,
//                         itemBuilder: (context, index) {
//                           return InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (ctx) => OrderDetailsScreen(
//                                     name: medicineController
//                                         .medicineOrder![index].patientName
//                                         .toString(),
//                                     date: medicineController
//                                         .medicineOrder![index].date
//                                         .toString(),
//                                     itemCount: medicineController
//                                         .medicineOrder![index]
//                                         .medicines!
//                                         .length,
//                                     medicines: medicineController
//                                         .medicineOrder![index].medicines,
//                                     drName: medicineController
//                                         .medicineOrder![index].doctorName
//                                         .toString(),
//                                     patientImage: medicineController
//                                         .medicineOrder![index].userImage,
//                                     drId: medicineController
//                                         .medicineOrder![index].doctorId
//                                         .toString(),
//                                     patientId: medicineController
//                                         .medicineOrder![index].patientId
//                                         .toString(),
//                                     tokenId: medicineController
//                                         .medicineOrder![index].tokenId
//                                         .toString(),
//                                     type: 0,
//                                     checkBoxVisibleId:
//                                         widget.tabController.index,
//                                     prescriptionImage: medicineController
//                                         .medicineOrder![index]
//                                         .prescriptionImage,
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: BuilderCardWidget(
//                               patientImage: medicineController
//                                   .medicineOrder![index].userImage,
//                               name: medicineController
//                                   .medicineOrder![index].patientName
//                                   .toString(),
//                               date: medicineController
//                                   .medicineOrder![index].date
//                                   .toString(),
//                               drName: medicineController
//                                   .medicineOrder![index].doctorName
//                                   .toString(),
//                             ),
//                           );
//                         },
//                       );
//                     }))
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }

class NestedTabBar extends StatefulWidget {
  NestedTabBar({Key? key, required this.tabController}) : super(key: key);

  final TabController tabController;

  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  TabController? _nestedTabController;
  final UpcomingDateController upcomingDateController =
      Get.find<UpcomingDateController>();
  final MedicineController medicineController = Get.find<MedicineController>();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    initializeTabController();
  }

  void initializeTabController() {
    if (upcomingDateController.tabLength.value > 0) {
      log("date  ====  :: ${upcomingDateController.tabLength.value - 1}");
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
    }
  }

  @override
  void dispose() {
    _nestedTabController?.removeListener(_handleTabSelection);
    _nestedTabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (upcomingDateController.loading.value ||
          _nestedTabController == null) {
        return Center(child: CircularProgressIndicator());
      }
      return Column(
        children: [
          TabBar(
            onTap: (value) {
              medicineController.getMedicine(upcomingDateController
                  .date[_nestedTabController!.index].formatDate
                  .toString());
            },
            controller: _nestedTabController,
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.black54,
            isScrollable: true,
            tabs: upcomingDateController.date
                .map((tab) => Tab(text: tab.formatDate))
                .toList(),
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
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: medicineController.medicineOrder.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => OrderDetailsScreen(
                                  name: medicineController
                                      .medicineOrder[index].patientName
                                      .toString(),
                                  date: medicineController
                                      .medicineOrder[index].date
                                      .toString(),
                                  itemCount: medicineController
                                      .medicineOrder[index].medicines!.length,
                                  medicines: medicineController
                                      .medicineOrder[index].medicines,
                                  drName: medicineController
                                      .medicineOrder[index].doctorName
                                      .toString(),
                                  patientImage: medicineController
                                      .medicineOrder[index].userImage,
                                  drId: medicineController
                                      .medicineOrder[index].doctorId
                                      .toString(),
                                  patientId: medicineController
                                      .medicineOrder[index].patientId
                                      .toString(),
                                  tokenId: medicineController
                                      .medicineOrder[index].tokenId
                                      .toString(),
                                  type: 0,
                                  checkBoxVisibleId: widget.tabController.index,
                                  prescriptionImage: medicineController
                                      .medicineOrder[index].prescriptionImage,
                                ),
                              ),
                            );
                          },
                          child: BuilderCardWidget(
                            patientImage: medicineController
                                .medicineOrder[index].userImage,
                            name: medicineController
                                .medicineOrder[index].patientName
                                .toString(),
                            date: medicineController.medicineOrder[index].date
                                .toString(),
                            drName: medicineController
                                .medicineOrder[index].doctorName
                                .toString(),
                          ),
                        );
                      },
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
