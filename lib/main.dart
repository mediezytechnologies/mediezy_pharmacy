import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mediezy_medical/ddd/application/auth_bloc/auth_bloc.dart';
import 'package:mediezy_medical/ddd/domain/core/dependency/injectable.dart';
import 'package:mediezy_medical/ddd/core/app_theme_style.dart';
import 'package:mediezy_medical/mvc/view/auth/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  await GetStorage.init();
  // jhhgsfhgvksdgkshg
  runApp(const MediezyMedical());
}

class MediezyMedical extends StatelessWidget {
  const MediezyMedical({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<AuthBloc>(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Mediezy',
            theme: appThemeStyle(),
            home: const LoginScreen(),
          ),
        );
      },
    );
  }
}
