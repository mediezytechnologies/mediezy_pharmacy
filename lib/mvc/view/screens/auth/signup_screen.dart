import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediezy_medical/mvc/controller/controller/auth/signup/signup_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/text_style_widget.dart';
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
                        child: ClipOval(
                          child: imagePath == null
                              ? Image.asset(
                                  "assets/images/person.jpg",
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
                      top: width > 450 ? height * .115 : height * .110,
                      right: width > 450 ? width * .350 : width * .280,
                      child: IconButton(
                        onPressed: () async {
                          await placePicImage();
                          log(">>>>>>>>>>>>>>>${imagePath.toString()}");
                        },
                        icon: Icon(
                          Icons.add_a_photo,
                          size: width > 450 ? 20.sp : 26.sp,
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
                      return "Please enter medical store name";
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
                Obx(() {
                  return CustomeFormFieldWidget(
                    suffixIcon: IconButton(
                        onPressed: () {
                          signupController.changeHidePassword();
                        },
                        icon: Icon(
                          signupController.hidePassword.value
                              ? IconlyLight.hide
                              : IconlyLight.show,
                          color: kMainColor,
                          size: width > 450 ? 16.sp : 22.sp,
                        )),
                    hideText: true,
                    controller: passwordController,
                    hintText: "Enter password",
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
                    icon: IconlyLight.password,
                    obscureText: signupController.hidePassword.value,
                  );
                }),
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
                      return "Please enter valid pincode";
                    } else {
                      return null;
                    }
                  },
                  icon: Iconsax.location,
                ),
                SizedBox(height: height * .01),
                Obx(() {
                  return CommonButtonWidget(
                    isLoading: signupController.loading.value,
                    title: 'Sign up',
                    onTapFunction: () {
                      final isValidate = _formKey.currentState!.validate();
                      if (isValidate) {
                        signupController.addSignup(
                            name: labNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            mobileNo: mobileNumberController.text,
                            address: addressController.text,
                            location: locationController.text,
                            pincode: pinCodeController.text,
                            medicalshopImage: imagePath.toString());
                      }
                    },
                  );
                }),
                SizedBox(height: height * .01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: width > 450 ? blackTab9B400 : black12B500,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const LoginScreen()));
                      },
                      child: Text(
                        " Login",
                        style: width > 450 ? blackTabMainText : blackMainText,
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
