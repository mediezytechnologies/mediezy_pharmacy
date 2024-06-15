import 'dart:developer';

import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/controller/controller/auth/login/login_controller.dart';
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
  bool hidePassword = true;

  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {

    emailController.text  ='Wellness@gmail.com';
    passwordController.text="Wellness";
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
                    children: [
                      const VerticalSpacingWidget(height: 400),
                      //! email
                      TextFormField(
                        cursorColor: kMainColor,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: kMainColor,
                          ),
                          hintStyle:
                              TextStyle(fontSize: 15.sp, color: kSubTextColor),
                          hintText: "Enter your email",
                          filled: true,
                          fillColor: kCardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const VerticalSpacingWidget(height: 10),
                      //! password
                      TextFormField(
                        cursorColor: kMainColor,
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        focusNode: passwordFocusController,
                        textInputAction: TextInputAction.done,
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(IconlyLight.password, color: kMainColor),
                          suffixIcon: hidePassword
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  icon: Icon(
                                    IconlyLight.hide,
                                    color: kMainColor,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  icon: Icon(
                                    IconlyLight.show,
                                    color: kMainColor,
                                  ),
                                ),
                          hintStyle:
                              TextStyle(fontSize: 15.sp, color: kSubTextColor),
                          hintText: "Enter your password",
                          filled: true,
                          fillColor: kCardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const VerticalSpacingWidget(height: 30),
                      //! login
                      CommonButtonWidget(
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
                          }),
                      const VerticalSpacingWidget(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("You don't have an account?"),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => RegistrationPage()));
                            },
                            child: Text(
                              " Signup",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                            ),
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
