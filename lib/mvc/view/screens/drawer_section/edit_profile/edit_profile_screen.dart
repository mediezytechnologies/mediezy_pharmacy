// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediezy_medical/mvc/controller/controller/profile/get_profile_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';

import '../../../common_widgets/common_button_widget.dart';
import '../../../common_widgets/custom_teextform.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final FocusNode emailFocusController = FocusNode();
  final FocusNode locationFocusController = FocusNode();
  final FocusNode phoneNumberFocusController = FocusNode();
  final FocusNode addressFocusController = FocusNode();
  final FocusNode pincodeFocusController = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  String? imagePath;

  final ImagePicker imagePicker = ImagePicker();

  final GetProfileController getProfileController =
      Get.put(GetProfileController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: SizedBox(
          height: Platform.isIOS ? size.height * 0.103 : size.height * 0.08,
          child: Column(
            children: [
              CommonButtonWidget(
                  title: "Update",
                  onTapFunction: () {
                    final isValidate = _formKey.currentState!.validate();
                    if (isValidate) {}
                  }),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
      ),
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const VerticalSpacingWidget(height: 45),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: height * .120,
                          width: width * .250,
                          decoration: const BoxDecoration(),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.r),
                              child:
                                  //     imagePath == null
                                  //     ?
                                  Image.asset(
                                "assets/images/person.jpg",
                                // color: kMainColor,
                                height: height * .080,
                                width: width * .080,
                                fit: BoxFit.cover,
                              )
                              // : Image.file(
                              //     File(imagePath!),
                              //     height: height * .080,
                              //     width: width * .080,
                              //     fit: BoxFit.cover,
                              //   ),
                              ),
                        ),
                      ),
                      Positioned(
                        //  top: 69,
                        top: height * .075,
                        right: width * .285,
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
                  const VerticalSpacingWidget(height: 35),
                  CustomFomField(
                    titles: "Name",
                    textinputType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "first name is missing";
                      } else {
                        return null;
                      }
                    },
                    controller: firstNameController,
                    prefixIcon: IconlyLight.profile,
                  ),
                  const VerticalSpacingWidget(height: 10),
                  CustomFomField(
                    focusNode: emailFocusController,
                    titles: "email",
                    textinputType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "email is missing";
                      } else {
                        return null;
                      }
                    },
                    controller: emailController,
                    prefixIcon: IconlyLight.profile,
                  ),
                  const VerticalSpacingWidget(height: 10),
                  CustomFomField(
                    focusNode: addressFocusController,
                    titles: "address",
                    textinputType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "address is missing";
                      } else {
                        return null;
                      }
                    },
                    controller: addressController,
                    prefixIcon: IconlyLight.profile,
                  ),
                  const VerticalSpacingWidget(height: 10),
                  CustomFomField(
                    focusNode: pincodeFocusController,
                    titles: "pincode",
                    textinputType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "pincode is missing";
                      } else {
                        return null;
                      }
                    },
                    controller: pincodeController,
                    prefixIcon: IconlyLight.profile,
                  ),
                  const VerticalSpacingWidget(height: 10),
                  CustomFomField(
                    focusNode: locationFocusController,
                    titles: "Location",
                    textinputType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "location is missing";
                      } else {
                        return null;
                      }
                    },
                    controller: locationController,
                    prefixIcon: IconlyLight.profile,
                  ),
                  const VerticalSpacingWidget(height: 10),
                  CustomFomField(
                      titles: "Phone number",
                      focusNode: phoneNumberFocusController,
                      textinputType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 10) {
                          return "Phone number is missing";
                        } else {
                          return null;
                        }
                      },
                      controller: phoneNumberController,
                      prefixIcon: Icons.phone_iphone),
                  const VerticalSpacingWidget(height: 35),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  // Stack editImage(Size size) {
  //   return Stack(
  //     children: [
  //       Align(
  //         alignment: Alignment.center,
  //         child: Container(
  //           height: size.height * 0.16,
  //           width: size.width * 0.33,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(70.r),
  //           ),
  //           child: FadedScaleAnimation(
  //             scaleDuration: const Duration(milliseconds: 400),
  //             fadeDuration: const Duration(milliseconds: 400),
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.circular(70.r),
  //               child: imagePath != null
  //                   ? Image.file(
  //                       imagePath!,
  //                       height: 80.h,
  //                       width: 80.w,
  //                       fit: BoxFit.cover,
  //                     )
  //                   : (widget.patientImage == ""
  //                       ? Image.asset(
  //                           "assets/icons/profile pic.png",
  //                           height: 80.h,
  //                           width: 80.w,
  //                           color: kMainColor,
  //                         )
  //                       : Image.network(
  //                           widget.patientImage,
  //                           height: 80.h,
  //                           width: 80.w,
  //                           fit: BoxFit.cover,
  //                           errorBuilder: (context, error, stackTrace) =>
  //                               Padding(
  //                             padding: const EdgeInsets.all(3.0),
  //                             child: Image.asset(
  //                               "assets/icons/profile pic.png",
  //                               height: 80.h,
  //                               width: 80.w,
  //                               color: kMainColor,
  //                             ),
  //                           ),
  //                           loadingBuilder: (BuildContext context, Widget child,
  //                               ImageChunkEvent? loadingProgress) {
  //                             if (loadingProgress == null) {
  //                               return child;
  //                             }
  //                             return Center(
  //                               child: Shimmer.fromColors(
  //                                 baseColor: Colors.grey.shade300,
  //                                 highlightColor: Colors.grey.shade100,
  //                                 child: Container(
  //                                   decoration: BoxDecoration(
  //                                     color: Colors.white,
  //                                     borderRadius: BorderRadius.circular(80.r),
  //                                   ),
  //                                 ),
  //                               ),
  //                             );
  //                           },
  //                         )),
  //             ),
  //           ),
  //         ),
  //       ),
  //       Positioned(
  //         bottom: 0.h,
  //         right: size.width * 0.26,
  //         child: IconButton(
  //           onPressed: () {
  //             placePicImage();
  //           },
  //           icon: Icon(
  //             Icons.add_a_photo,
  //             size: 26.sp,
  //             weight: 5,
  //             color: kMainColor,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Future<void> placePicImage() async {
    var image = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 30,
    );
    if (image == null) return;

    var imageTemporary = image.path;

    setState(() {
      imagePath = imageTemporary;
      log("$imageTemporary======= image");
    });
  }

  // Future<void> pickImageFromCamera() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.camera);
  //
  //   if (pickedFile != null) {
  //     try {
  //       File compressedImage = await compressImage(pickedFile.path);
  //       imageFromCamera = File(pickedFile.path);
  //     } catch (e) {
  //       print('Error compressing image: $e');
  //       GeneralServices.instance.showToastMessage('Error compressing image');
  //     }
  //   } else {
  //     GeneralServices.instance.showToastMessage('No image selected');
  //   }
  // }
}
