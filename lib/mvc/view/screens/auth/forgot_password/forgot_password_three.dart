import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/controller/forgot_password/forgot_password_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/common_button_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/custom_form_field_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/text_style_widget.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';
import '../../../common_widgets/vertical_spacing_widget.dart';

class ForgotPasswordThree extends StatefulWidget {
  const ForgotPasswordThree({super.key});

  @override
  State<ForgotPasswordThree> createState() => _ForgotPasswordThreeState();
}

class _ForgotPasswordThreeState extends State<ForgotPasswordThree> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newPasswordConfirmController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // bool hideNewPassword = true;
  // bool hideNewConfirmPassword = true;

  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    height: size.height * .17,
                    image: AssetImage(
                      "assets/icons/mediezy pharmacy icon.png",
                    ),
                  ),
                  const VerticalSpacingWidget(height: 20),
                  Text("Create new password", style: black15B600),
                  const VerticalSpacingWidget(height: 10),
                  Text("Please enter below your password",
                      style: size.width > 450 ? greyTab11B400 : grey13B600),
                  const VerticalSpacingWidget(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("New password",
                          style: size.width > 450 ? grey10B400 : greyMain),
                      const VerticalSpacingWidget(height: 5),
                      Obx(() {
                        return CustomeFormFieldWidget(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              forgotPasswordController.changeHideNewPassword();
                            },
                            child: Icon(
                              forgotPasswordController.hideNewPassword.value
                                  ? IconlyLight.hide
                                  : IconlyLight.show,
                              color: kMainColor,
                            ),
                          ),
                          controller: newPasswordController,
                          hintText: "Enter new password",
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is missing";
                            } else if (value.length < 6) {
                              return "Password must have 6 digits";
                            } else if (!value.contains(RegExp(r'[0-9]'))) {
                              return "Password must contain at least one number";
                            } else {
                              return null;
                            }
                          },
                          icon: IconlyLight.password,
                          obscureText:
                              forgotPasswordController.hideNewPassword.value,
                        );
                        // return TextFormField(
                        //   style: black13B500,
                        //   cursorColor: kMainColor,
                        //   controller: newPasswordController,
                        //   keyboardType: TextInputType.text,
                        //   textInputAction: TextInputAction.next,
                        // obscureText:
                        //     forgotPasswordController.hideNewPassword.value,
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return "Password is missing";
                        //     } else if (value.length < 6) {
                        //       return "Password must have 6 digits";
                        //     } else if (!value.contains(RegExp(r'[0-9]'))) {
                        //       return "Password must contain at least one number";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        //   decoration: InputDecoration(
                        //     prefixIcon:
                        //         Icon(IconlyLight.password, color: kMainColor),
                        //     suffixIcon: GestureDetector(
                        //       onTap: () {
                        //         forgotPasswordController
                        //             .changeHideNewPassword();
                        //       },
                        //       child: Icon(
                        //         forgotPasswordController.hideNewPassword.value
                        //             ? IconlyLight.hide
                        //             : IconlyLight.show,
                        //         color: kMainColor,
                        //       ),
                        //     ),
                        //     hintStyle: grey13B600,
                        //     hintText: "Enter new password",
                        //     filled: true,
                        //     fillColor: kCardColor,
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(4),
                        //       borderSide: BorderSide.none,
                        //     ),
                        //     contentPadding: const EdgeInsets.symmetric(
                        //         vertical: 10.0, horizontal: 10.0),
                        //   ),
                        // );
                      }),
                      const VerticalSpacingWidget(height: 10),
                      Text("Confirm password",
                          style: size.width > 450 ? grey10B400 : greyMain),
                      const VerticalSpacingWidget(height: 5),
                      Obx(() {
                        return CustomeFormFieldWidget(
                          obscureText: forgotPasswordController
                              .hideNewConfirmPassword.value,
                          controller: newPasswordConfirmController,
                          hintText: "Re enter password",
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is missing";
                            } else if (value.length < 6) {
                              return "Password must have 6 digits";
                            } else if (!value.contains(RegExp(r'[0-9]'))) {
                              return "Password must contain at least one number";
                            } else {
                              return null;
                            }
                          },
                          suffixIcon: GestureDetector(
                            onTap: () {
                              forgotPasswordController
                                  .changeHideNewConfirmPassword();
                            },
                            child: Icon(
                              forgotPasswordController
                                      .hideNewConfirmPassword.value
                                  ? IconlyLight.hide
                                  : IconlyLight.show,
                              color: kMainColor,
                            ),
                          ),
                          icon: IconlyLight.password,
                        );
                      }),
                      // Obx(() {
                      //   return TextFormField(
                      //     style: black13B500,
                      //     cursorColor: kMainColor,
                      //     controller: newPasswordConfirmController,
                      //     keyboardType: TextInputType.text,
                      //     textInputAction: TextInputAction.next,
                      //     obscureText: forgotPasswordController
                      //         .hideNewConfirmPassword.value,
                      //     validator: (value) {
                      //       if (value!.isEmpty) {
                      //         return "Password is missing";
                      //       } else if (value.length < 7) {
                      //         return "Password must have 7 digits";
                      //       } else if (!value.contains(RegExp(r'[0-9]'))) {
                      //         return "Password must contain at least one number";
                      //       } else {
                      //         return null;
                      //       }
                      //     },
                      //     decoration: InputDecoration(
                      //       prefixIcon:
                      //           Icon(IconlyLight.password, color: kMainColor),
                      //       suffixIcon: GestureDetector(
                      //         onTap: () {
                      //           forgotPasswordController
                      //               .changeHideNewConfirmPassword();
                      //         },
                      //         child: Icon(
                      //           forgotPasswordController
                      //                   .hideNewConfirmPassword.value
                      //               ? IconlyLight.hide
                      //               : IconlyLight.show,
                      //           color: kMainColor,
                      //         ),
                      //       ),
                      //       hintStyle: grey13B600,
                      //       hintText: "Re enter password",
                      //       filled: true,
                      //       fillColor: kCardColor,
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10.r),
                      //         borderSide: BorderSide.none,
                      //       ),
                      //       contentPadding: const EdgeInsets.symmetric(
                      //           vertical: 10.0, horizontal: 10.0),
                      //     ),
                      //   );
                      // }),
                      const VerticalSpacingWidget(height: 30),
                    ],
                  ),
                  Obx(() {
                    return CommonButtonWidget(
                      isLoading: forgotPasswordController.loading.value,
                      title: 'Reset password',
                      onTapFunction: () {
                        forgotPasswordController.addForgotPasswordThree(
                            password: newPasswordController.text);
                      },
                    );
                  })
                ],
              ),
            ),
          ),
        ));
  }
}
