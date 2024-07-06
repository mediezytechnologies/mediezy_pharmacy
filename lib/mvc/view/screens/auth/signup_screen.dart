// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediezy_medical/mvc/controller/controller/auth/signup/signup_controller.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';
import 'package:mediezy_medical/mvc/view/screens/auth/login_screen.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/common_button_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/custom_form_field_widget.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController labNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ImagePicker imagePicker = ImagePicker();
  String? imagePath;

  final SignupController signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .02),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: height * .07),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: height * .170,
                        width: width * .350,
                        decoration: const BoxDecoration(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.r),
                          child: imagePath == null
                              ? Image.asset(
                                  "assets/images/person.jpg",
                                  height: height * .080,
                                  width: width * .080,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  File(imagePath!),
                                  height: height * .080,
                                  width: width * .080,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * .110,
                      right: width * .190,
                      child: IconButton(
                        onPressed: () async {
                          await placePicImage();
                          log(">>>>>>>>>>>>>>>${imagePath.toString()}");
                        },
                        icon: Icon(
                          Icons.add_a_photo,
                          size: 26.sp,
                          weight: 5,
                          color: kMainColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .03),
                CustomeFormFieldWidget(
                  hideText: false,
                  controller: labNameController,
                  hintText: "Enter medical store name",
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter lab name";
                    } else {
                      return null;
                    }
                  },
                  icon: Icons.home_outlined,
                ),
                SizedBox(height: height * .01),
                CustomeFormFieldWidget(
                    controller: emailController,
                    hintText: "Enter email address",
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
                    icon: Icons.email_outlined),
                SizedBox(height: height * .01),
                CustomeFormFieldWidget(
                    controller: mobileNumberController,
                    hintText: "Enter mobile number",
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    maxLength: 10,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 10) {
                        return "Please enter the valid phone number";
                      } else {
                        return null;
                      }
                    },
                    icon: Iconsax.mobile),
                SizedBox(height: height * .01),
                CustomeFormFieldWidget(
                  hideText: true,
                  controller: passwordController,
                  hintText: "Enter password",
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return "Please enter valid password";
                    } else {
                      return null;
                    }
                  },
                  icon: Icons.password,
                  obscureText: false,
                  onPressed: () {},
                ),
                SizedBox(height: height * .01),
                CustomeFormFieldWidget(
                  hideText: false,
                  controller: addressController,
                  hintText: "Enter address",
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter valid address";
                    } else {
                      return null;
                    }
                  },
                  icon: Iconsax.map,
                ),
                SizedBox(height: height * .01),
                CustomeFormFieldWidget(
                  hideText: false,
                  controller: locationController,
                  hintText: "Enter location",
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter valid location";
                    } else {
                      return null;
                    }
                  },
                  icon: Iconsax.location,
                ),
                SizedBox(height: height * .01),
                CustomeFormFieldWidget(
                  maxLength: 6,
                  hideText: false,
                  controller: pinCodeController,
                  hintText: "Enter pin code",
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter valid location";
                    } else {
                      return null;
                    }
                  },
                  icon: Iconsax.location,
                ),
                SizedBox(height: height * .01),
                CommonButtonWidget(
                  title: 'Sign up',
                  onTapFunction: () {
                    log("image : ${imagePath.toString()}");
                    signupController.addSignup(
                        name: labNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        mobileNo: mobileNumberController.text,
                        address: addressController.text,
                        location: locationController.text,
                        pincode: pinCodeController.text,
                        medicalshopImage: imagePath.toString());
                  },
                ),
                SizedBox(height: height * .01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const LoginScreen()));
                      },
                      child: Text(
                        " Login",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .01),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future placePicImage() async {
    var image = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 30,
    );
    if (image == null) return;
    final imageTemporary = image.path;
    setState(() {
      imagePath = imageTemporary;
      log("$imageTemporary======= image");
    });
  }

  @override
  void dispose() {
    labNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    mobileNumberController.dispose();
    addressController.dispose();
    locationController.dispose();
    super.dispose();
  }
}
