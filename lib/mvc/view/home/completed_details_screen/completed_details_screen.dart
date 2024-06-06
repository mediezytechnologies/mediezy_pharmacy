import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/horizontal_spacing_widget.dart';

class CompletedDetailsScreen extends StatefulWidget {
  const CompletedDetailsScreen({super.key, this.name, this.date});
  final String? name;
  final String? date;
  @override
  State<CompletedDetailsScreen> createState() => _CompletedDetailsScreenState();
}

class _CompletedDetailsScreenState extends State<CompletedDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order num 2133"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/no image.jpg",
                        height: 50.h,
                        width: 60.w,
                        fit: BoxFit.fill,
                      ),
                      const HorizontalSpacingWidget(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "samantha",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.sp),
                          ),
                          const Text(
                            "23-03-2024 ,10:00 AM",
                          ),
                          Row(
                            children: [
                              const Text(
                                "Prescribed by : ",
                              ),
                              Text(
                                "Dr.Susan kurian",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (ctx) =>
                              //             const CompletedDetailsScreen()));
                            },
                            child: const Text("ddggs"));
                        // child: const BuilderCardWidget());
                      }),
                ),
              ),
              Card(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/rx logo.png",
                            height: 25.h,
                            width: 25.w,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            "Prescription uploaded",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.sp),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.remove_red_eye,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
