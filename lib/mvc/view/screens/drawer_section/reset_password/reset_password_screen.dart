import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/controller/reset_password/reset_password_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/common_button_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/custom_form_field_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/text_style_widget.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ResetPasswordController resetPasswordController =
      Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset password"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * .020),
              Text("Change password",
                  style: size.width > 450 ? black14B600 : black15B600),
              SizedBox(height: size.height * .007),
              Text(
                "Enter a new password for your account. Make sure it is at least 6 characters long and includes a mix of letters, numbers.",
                style: size.width > 450 ? greyTab10B400 : grey12B500,
              ),
              SizedBox(height: size.height * .020),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Current password",
                        style: size.width > 450 ? grey10B400 : greyMain),
                    SizedBox(height: size.height * .01),
                    CustomeFormFieldWidget(
                      controller: oldPasswordController,
                      hintText: "Old password",
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is missing";
                        } else {
                          return null;
                        }
                      },
                      icon: Icons.password,
                    ),
                    SizedBox(height: size.height * .02),
                    Text("New password",
                        style: size.width > 450 ? grey10B400 : greyMain),
                    SizedBox(height: size.height * .01),
                    Obx(() {
                      return CustomeFormFieldWidget(
                        obscureText:
                            resetPasswordController.hideNewPassword.value,
                        hideText: true,
                        controller: newPasswordController,
                        hintText: "New Password",
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is missing";
                          } else if (value.length < 6) {
                            return "Password must have 6 digits";
                          } else {
                            return null;
                          }
                        },
                        icon: Icons.password,
                        suffixIcon: IconButton(
                          onPressed: () {
                            resetPasswordController.changeHideNewPassword();
                          },
                          icon: Icon(
                            resetPasswordController.hideNewPassword.value
                                ? IconlyLight.hide
                                : IconlyLight.show,
                            color: kMainColor,
                            size: size.width > 450 ? 15.sp : 22.sp,
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: size.height * .02),
                    Text("Confirm new password",
                        style: size.width > 450 ? grey10B400 : greyMain),
                    SizedBox(height: size.height * .01),
                    Obx(() {
                      return CustomeFormFieldWidget(
                        hideText: true,
                        controller: confirmNewPasswordController,
                        hintText: "Confirm new password",
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is missing";
                          } else if (value.length < 6) {
                            return "Password must have 6 digits";
                          } else {
                            return null;
                          }
                        },
                        icon: Icons.password,
                        obscureText:
                            resetPasswordController.hideConfirmPassword.value,
                        suffixIcon: IconButton(
                          onPressed: () {
                            resetPasswordController.changeHideConfirmPassword();
                          },
                          icon: Icon(
                            resetPasswordController.hideConfirmPassword.value
                                ? IconlyLight.hide
                                : IconlyLight.show,
                            color: kMainColor,
                            size: size.width > 450 ? 15.sp : 22.sp,
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: size.height * .040),
                    Obx(() {
                      return CommonButtonWidget(
                        title: "Submit",
                        onTapFunction: () {
                          if (_formKey.currentState!.validate()) {
                            resetPasswordController.addResetPassword(
                              oldPassword: oldPasswordController.text,
                              newPassword: newPasswordController.text,
                            );
                          }
                        },
                        isLoading: resetPasswordController.loading.value,
                      );
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
