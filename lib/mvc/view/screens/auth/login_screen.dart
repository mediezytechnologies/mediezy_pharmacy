import 'dart:developer';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/controller/auth/login/login_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/custom_form_field_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/text_style_widget.dart';
import 'package:mediezy_medical/mvc/view/screens/auth/forgot_password/forgot_password_one.dart';
import 'package:mediezy_medical/mvc/view/screens/auth/signup_screen.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/common_button_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> fomkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusController = FocusNode();

  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: FadedSlideAnimation(
      beginOffset: const Offset(0, 0.3),
      endOffset: const Offset(0, 0),
      slideCurve: Curves.linearToEaseOut,
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 430.h,
                color: kMainColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/minimalistic-science-banner-with-pills.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Form(
                  key: fomkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const VerticalSpacingWidget(height: 400),
                      //! email
                      CustomeFormFieldWidget(
                        hideText: false,
                        controller: emailController,
                        hintText: "Enter your email",
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter valid email";
                          } else {
                            return null;
                          }
                        },
                        icon: Icons.email_outlined,
                      ),

                      const VerticalSpacingWidget(height: 10),
                      //! password
                      Obx(() {
                        return CustomeFormFieldWidget(
                          suffixIcon: IconButton(
                            onPressed: () {
                              loginController.changeHidePassword();
                            },
                            icon: Icon(
                              loginController.hidePassword.value
                                  ? IconlyLight.hide
                                  : IconlyLight.show,
                              color: kMainColor,
                            ),
                          ),
                          obscureText: loginController.hidePassword.value,
                          hideText: false,
                          controller: passwordController,
                          hintText: "Enter your password",
                          textInputType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter valid password";
                            } else {
                              return null;
                            }
                          },
                          icon: IconlyLight.password,
                        );
                      }),

                      const VerticalSpacingWidget(height: 10),
                      InkWell(
                        onTap: () {
                          Get.to(() => ForgotPasswordOne());
                        },
                        child: Text(
                          "Forgot password ?",
                          style: width > 450 ? blackTabMainText : blackMainText,
                        ),
                      ),
                      const VerticalSpacingWidget(height: 10),
                      //! login
                      Obx(() {
                        return CommonButtonWidget(
                          isLoading: loginController.loading.value,
                          title: "Login",
                          onTapFunction: () {
                            log(emailController.text);
                            log(passwordController.text);
                            loginController.addLogin(
                                email: emailController.text,
                                password: passwordController.text);
                            // bool isValid = fomkey.currentState!.validate();
                            // if (isValid) {

                            // }
                          },
                        );
                      }),
                      const VerticalSpacingWidget(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("You don't have an account?",
                              style: width > 450 ? blackTab9B400 : black12B500),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => RegistrationPage()));
                            },
                            child: Text(" Sign up",
                                style: width > 450
                                    ? blackTabMainText
                                    : blackMainText),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordFocusController.dispose();
    super.dispose();
  }
}
