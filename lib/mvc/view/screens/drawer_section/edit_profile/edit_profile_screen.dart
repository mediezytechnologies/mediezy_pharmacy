// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediezy_medical/mvc/controller/controller/profile/get_profile_controller.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/text_style_widget.dart';
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

  bool isEdit = false;

  @override
  void initState() {
    log(getProfileController.getProfileModel.value.medicalShopName.toString());
    super.initState();
    firstNameController.text =
        getProfileController.getProfileModel.value.medicalShopName ?? '';
    emailController.text =
        getProfileController.getProfileModel.value.email ?? '';
    addressController.text =
        getProfileController.getProfileModel.value.address ?? '';
    phoneNumberController.text =
        getProfileController.getProfileModel.value.mobileNumber ?? '';
    locationController.text =
        getProfileController.getProfileModel.value.location ?? '';
    pincodeController.text =
        getProfileController.getProfileModel.value.pincode.toString();
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: SizedBox(
          height: Platform.isIOS ? size.height * 0.103 : size.height * 0.08,
          child: Column(
            children: [
              Obx(() {
                return getProfileController.isEdit.value
                    ? SizedBox()
                    : getProfileController.isUpdating.value
                        ? CupertinoActivityIndicator(
                            color: kCardColor,
                          )
                        : CommonButtonWidget(
                            isLoading: getProfileController.updateLoading.value,
                            title: "Update",
                            onTapFunction: () {
                              final isValidate =
                                  _formKey.currentState!.validate();
                              if (isValidate) {
                                getProfileController.editProfile(
                                    firstNameController.text,
                                    phoneNumberController.text,
                                    addressController.text,
                                    firstNameController.text,
                                    locationController.text,
                                    pincodeController.text,
                                    imagePath.toString());
                              }
                            },
                          );
              }),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          Obx(() {
            return IconButton(
              onPressed: getProfileController.toggleEditMode,
              icon: Icon(
                  getProfileController.isEdit.value ? Icons.edit : Icons.check),
            );
          })
        ],
        title: Obx(() {
          return Text(
              getProfileController.isEdit.value ? "Profile" : "Edit Profile");
        }),
        centerTitle: true,
      ),
      body: Obx(() {
        if (getProfileController.loading.value) {
          Center(
            child: CupertinoActivityIndicator(
              color: kCardColor,
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacingWidget(height: 15),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: width > 450 ? width * .19 : height * .14,
                          width: width > 450 ? width * .19 : width * .30,
                          decoration: const BoxDecoration(),
                          child: ClipOval(
                            child: imagePath == null
                                ? getProfileController.getProfileModel.value
                                            .medicalshopImage ==
                                        null
                                    ? Image.asset(
                                        "assets/images/person.jpg",
                                      )
                                    : Image.network(
                                        getProfileController.getProfileModel
                                            .value.medicalshopImage
                                            .toString(),
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
                        top: width > 450 ? height * .09 : height * .09,
                        right: width > 450 ? width * .36 : width * .290,
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
                  const VerticalSpacingWidget(height: 20),
                  Text("Name :",
                      style: size.width > 450 ? grey10B400 : greyMain),
                  const VerticalSpacingWidget(height: 5),
                  CustomFomField(
                    readOnly: getProfileController.isEdit.value,
                    titles: "",
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
                  const VerticalSpacingWidget(height: 5),
                  Text("email :",
                      style: size.width > 450 ? grey10B400 : greyMain),
                  const VerticalSpacingWidget(height: 3),
                  CustomFomField(
                    readOnly: true,
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
                    prefixIcon: Icons.email_outlined,
                  ),
                  const VerticalSpacingWidget(height: 5),
                  Text("Address :",
                      style: size.width > 450 ? grey10B400 : greyMain),
                  const VerticalSpacingWidget(height: 3),
                  CustomFomField(
                    readOnly: getProfileController.isEdit.value,
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
                    prefixIcon: Iconsax.map,
                  ),
                  const VerticalSpacingWidget(height: 5),
                  Text("Pincode :",
                      style: size.width > 450 ? grey10B400 : greyMain),
                  const VerticalSpacingWidget(height: 3),
                  CustomFomField(
                    readOnly: getProfileController.isEdit.value,
                    focusNode: pincodeFocusController,
                    maxLength: 6,
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
                    prefixIcon: Icons.location_city,
                  ),
                  const VerticalSpacingWidget(height: 5),
                  Text("Location :",
                      style: size.width > 450 ? grey10B400 : greyMain),
                  const VerticalSpacingWidget(height: 3),
                  CustomFomField(
                    readOnly: getProfileController.isEdit.value,
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
                    prefixIcon: Iconsax.location,
                  ),
                  const VerticalSpacingWidget(height: 5),
                  Text("Phone number :",
                      style: size.width > 450 ? grey10B400 : greyMain),
                  const VerticalSpacingWidget(height: 3),
                  CustomFomField(
                      maxLength: 10,
                      readOnly: getProfileController.isEdit.value,
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
}
