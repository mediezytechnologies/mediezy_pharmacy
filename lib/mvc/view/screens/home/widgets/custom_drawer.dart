import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_medical/mvc/view/screens/drawer_section/edit_profile/edit_profile_screen.dart';
import 'package:mediezy_medical/mvc/view/screens/drawer_section/previous_history/previous_history.dart';
import 'package:mediezy_medical/mvc/view/screens/home/widgets/patient_image_widget.dart';
import 'package:mediezy_medical/mvc/view/services/app_colors.dart';
import 'package:mediezy_medical/mvc/view/services/general_services.dart';
import 'package:mediezy_medical/mvc/view/screens/auth/login_screen.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/text_style_widget.dart';
import 'package:mediezy_medical/mvc/view/common_widgets/vertical_spacing_widget.dart';
import 'package:mediezy_medical/mvc/view/screens/drawer_section/about_us_screen/about_us_screen.dart';
import 'package:mediezy_medical/mvc/view/screens/drawer_section/contact_us_screen/contact_us_screen.dart';
import 'package:mediezy_medical/mvc/view/screens/drawer_section/t&c_screen/t&c_screen.dart';
import 'package:mediezy_medical/mvc/view/screens/drawer_section/privacy_policy/privacy_policy.dart';
import 'package:mediezy_medical/mvc/view/services/get_local_storage.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final String? userName = GetLocalStorage.getUserIdAndToken('firstname');
  final String? mobileNo = GetLocalStorage.getUserIdAndToken('mobileNo');
  final String? image = GetLocalStorage.getUserIdAndToken('image');
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      width: size.width > 450 ? 170.w : 250.w,
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: size.width > 450 ? 160.h : 200.h,
            child: DrawerHeader(
              decoration: BoxDecoration(color: kMainColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FadedScaleAnimation(
                    scaleDuration: const Duration(milliseconds: 400),
                    fadeDuration: const Duration(milliseconds: 400),
                    child:
                        PatientImageWidget(patientImage: image, radius: 30.r),
                  ),
                  Text(
                    userName.toString(),
                    style: size.width > 450
                        ? TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)
                        : TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                  ),
                  Text(
                    mobileNo == "null" || mobileNo == null
                        ? "+91 XXX XXX XXXX"
                        : "+91 $mobileNo",
                    style: size.width > 450
                        ? TextStyle(fontSize: 9.sp, color: Colors.white)
                        : TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text('Profile',
                style: size.width > 450 ? blackTab9B400 : black14B400),
            trailing: Icon(
              Icons.edit,
              size: size.width > 450 ? 13.sp : 20.sp,
            ),
            onTap: () {
              Get.to(EditProfileScreen());
            },
          ),
          ListTile(
            title: Text('Previous history',
                style: size.width > 450 ? blackTab9B400 : black14B400),
            trailing: Icon(
              Icons.book_online_outlined,
              size: size.width > 450 ? 13.sp : 20.sp,
            ),
            onTap: () {
              Get.to(PreviousHistoryScreen());
            },
          ),
          ListTile(
            title: Text('Terms & Conditions',
                style: size.width > 450 ? blackTab9B400 : black14B400),
            trailing: Icon(
              Icons.assignment_outlined,
              size: size.width > 450 ? 13.sp : 20.sp,
            ),
            onTap: () {
              // Handle item 2 tap
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TermsandConditionsScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Privacy policy',
                style: size.width > 450 ? blackTab9B400 : black14B400),
            trailing: Icon(Icons.assignment_returned_outlined,
                size: size.width > 450 ? 13.sp : 20.sp),
            onTap: () {
              // Handle item 2 tap
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyPolicyScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('About Us',
                style: size.width > 450 ? blackTab9B400 : black14B400),
            trailing: Icon(Icons.assignment_turned_in_outlined,
                size: size.width > 450 ? 13.sp : 20.sp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUsScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Contact Us',
                style: size.width > 450 ? blackTab9B400 : black14B400),
            trailing: Icon(
              Icons.mail_outline_outlined,
              size: size.width > 450 ? 13.sp : 20.sp,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactUsScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Log out',
                style: size.width > 450 ? blackTab9B400 : black14B400),
            trailing: Icon(
              Icons.logout,
              size: size.width > 450 ? 13.sp : 20.sp,
            ),
            onTap: () async {
              GeneralServices.instance.appCloseDialogue(
                  context, "Are you sure to log out", () async {
                await GetLocalStorage.removeUserTokenAndUid();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false);
              });
            },
          ),
          const VerticalSpacingWidget(height: 8),
        ],
      ),
    );
  }
}
