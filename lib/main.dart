import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mediezy_medical/mvc/view/services/app_theme_style.dart';
import 'package:mediezy_medical/mvc/view/screens/auth/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MediezyMedical());
}

class MediezyMedical extends StatelessWidget {
  const MediezyMedical({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mediezy',
          theme: appThemeStyle(),
          home: const LoginScreen(),
        );
      },
    );
  }
}
