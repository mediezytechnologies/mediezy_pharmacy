import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/controller/forgot_password/forgot_password_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/common_button_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/custom_form_field_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/text_style_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';

class ForgotPasswordOne extends StatefulWidget {
  const ForgotPasswordOne({super.key});

  @override
  State<ForgotPasswordOne> createState() => _ForgotPasswordOneState();
}

class _ForgotPasswordOneState extends State<ForgotPasswordOne> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const VerticalSpacingWidget(height: 50),
                Image(
                    image: const AssetImage(
                      "assets/images/forgot_password_one.png",
                    ),
                    height: size.height * .17),
                const VerticalSpacingWidget(height: 30),
                Text("Forgot password", style: black15B600),
                const VerticalSpacingWidget(height: 15),
                Text("Please enter your Email ID and get code",
                    style: size.width > 450 ? greyTab11B400 : grey13B600),
                const VerticalSpacingWidget(height: 20),
                CustomeFormFieldWidget(
                  controller: emailController,
                  hintText: "Enter email",
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !value.contains("@") ||
                        !value.contains(".")) {
                      return "Please enter the valid email address";
                    } else {
                      return null;
                    }
                  },
                  icon: Icons.email_outlined,
                ),
                const VerticalSpacingWidget(height: 30),
                Obx(() {
                  return CommonButtonWidget(
                    isLoading: forgotPasswordController.loading.value,
                    title: 'Submit',
                    onTapFunction: () {
                      forgotPasswordController.addForgotPasswordOne(
                          email: emailController.text);
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
