import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/controller/forgot_password/forgot_password_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/common_button_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/text_style_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgetPasswordTwo extends StatefulWidget {
  const ForgetPasswordTwo({super.key, required this.email});

  final String email;

  @override
  State<ForgetPasswordTwo> createState() => _ForgetPasswordTwoState();
}

class _ForgetPasswordTwoState extends State<ForgetPasswordTwo> {
  final TextEditingController otpController = TextEditingController();

  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const VerticalSpacingWidget(height: 60),
                Image(
                    image: const AssetImage(
                      "assets/images/forgot_password_two.png",
                    ),
                    height: size.height * .17),
                const VerticalSpacingWidget(height: 30),
                Text("Verify your code", style: black15B600),
                const VerticalSpacingWidget(height: 15),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Please enter 4 digit code sent your email ",
                    style: size.width > 450 ? greyTab11B400 : grey13B600,
                    children: [
                      TextSpan(
                        text: widget.email,
                        style: TextStyle(
                          fontSize: size.width > 450 ? 11.sp : 13.sp,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpacingWidget(height: 10),
                PinCodeTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                  cursorColor: kTextColor,
                  textStyle: black15B600,
                  controller: otpController,
                  appContext: context,
                  length: 4,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      fieldOuterPadding: EdgeInsets.symmetric(horizontal: 10.w),
                      activeBorderWidth: .5.w,
                      inactiveBorderWidth: 1.5.w,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10.r),
                      fieldHeight: size.width > 450 ? 60.h : 50.h,
                      fieldWidth: size.width > 450 ? 30.w : 42.w,
                      activeColor: kMainColor,
                      selectedColor: kMainColor,
                      selectedFillColor: kCardColor,
                      inactiveFillColor: kSubTextColor,
                      inactiveColor: kMainColor),
                ),
                const VerticalSpacingWidget(height: 30),
                Obx(() {
                  return CommonButtonWidget(
                    isLoading: forgotPasswordController.loading.value,
                    onTapFunction: () {
                      forgotPasswordController.addForgotPasswordTwo(
                          otp: otpController.text);
                    },
                    title: "Verify",
                  );
                }),
                const VerticalSpacingWidget(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      forgotPasswordController.addForgotPasswordOne(
                          email: widget.email);
                    },
                    child: Text("Resend OTP",
                        style:
                            size.width > 450 ? blackTabMainText : black15B600),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
