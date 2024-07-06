import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:mediezy_medical/mvc/view/screens/auth/login_screen.dart';
import 'package:mediezy_medical/mvc/view/screens/home/new_orders/new_orders.dart';
import 'package:mediezy_medical/mvc/view/services/get_local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> checkuserlogin() async {
    String? token = GetLocalStorage.getUserIdAndToken('token');

    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (token == null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false);
        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => NewOrderScreen()),
              (route) => false);
        }
      },
    );
  }

  @override
  void initState() {
    checkuserlogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadedSlideAnimation(
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/splash screen.jpg",
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}
