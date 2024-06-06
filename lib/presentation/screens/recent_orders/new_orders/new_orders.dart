// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mediezy_medical/application/new_order/new_bloc_bloc.dart';
// import 'package:mediezy_medical/presentation/screens/completed_details_screen/completed_details_screen.dart';
// import 'package:mediezy_medical/presentation/screens/patient_details_screen/patient_details_screen.dart';
// import 'package:mediezy_medical/presentation/screens/widgets/builder_card_widget.dart';
// import 'package:mediezy_medical/presentation/core/app_colors.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
//   late TabController tabController;

//   @override
//   void initState() {
//     BlocProvider.of<NewBlocBloc>(context).add(NewBlocEvent.started());
//     super.initState();
//     tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Recent Orders"),
//         centerTitle: true,
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         BlocProvider.of<NewBlocBloc>(context).add(NewBlocEvent.started());
//       }),
//       body: Column(
//         children: [
//           Container(
//             height: 55.h,
//             color: kScaffoldColor,
//             child: TabBar(
//               controller: tabController,
//               physics: const ClampingScrollPhysics(),
//               padding: EdgeInsets.only(
//                   top: 10.h, left: 10.w, right: 10.w, bottom: 10.h),
//               unselectedLabelColor: kTextColor,
//               unselectedLabelStyle: TextStyle(
//                 fontSize: 12.sp,
//               ),
//               labelStyle: TextStyle(
//                   color: Colors.white,
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w600),
//               indicatorSize: TabBarIndicatorSize.tab,
//               indicator: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10), color: kMainColor),
//               tabs: [
//                 Tab(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: const Align(
//                       alignment: Alignment.center,
//                       child: Text(
//                         "New orders",
//                       ),
//                     ),
//                   ),
//                 ),
//                 Tab(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: const Align(
//                       alignment: Alignment.center,
//                       child: Text("Past orders"),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: tabController,
//               children: [
//                 BlocBuilder<NewBlocBloc, NewBlocState>(
//                   builder: (context, state) {
//                     if (state.isError) {
//                       return Center(child: Text("Something went wrong"));
//                     }
//                     if (state.isLoading) {
//                       return Center(child: CircularProgressIndicator());
//                     }
//                     if (state.newOrdersModel.isEmpty) {
//                       return Center(
//                         child: Image(
//                           height: 200.h,
//                           width: 200.w,
//                           image: const AssetImage("assets/images/no image.jpg"),
//                           color: kMainColor,
//                         ),
//                       );
//                     }
//                     // else {
//                     return ListView.builder(
//                       padding: EdgeInsets.zero,
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: state.newOrdersModel.length,
//                       itemBuilder: (context, index) {
//                         return InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (ctx) => const PatientDetailsScreen(),
//                               ),
//                             );
//                           },
//                           child: BuilderCardWidget(
//                             name: state.newOrdersModel[index].patientName
//                                 .toString(),
//                             date: state.newOrdersModel[index].date.toString(),
//                           ),
//                         );
//                       },
//                     );
//                     // }
//                   },
//                 ),
//                 ListView.builder(
//                   padding: EdgeInsets.zero,
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: 4,
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (ctx) => const CompletedDetailsScreen(),
//                           ),
//                         );
//                       },
//                       child: const Text("frghdf"),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
