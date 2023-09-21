import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_futurecode/core/utils/app_constant.dart';
import 'package:test_futurecode/screens/intro/intro_screen.dart';
import 'package:test_futurecode/screens/splash/controller/splash_controller.dart';
import '/core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController splashController = Get.put(SplashController());
  void _goNextPage(){
    Future.delayed(Duration(seconds: AppConstants.splashDelay),(){
      splashController.initSplash();
    });
  }
  @override
  void initState() {
    _goNextPage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: SvgPicture.asset(AssetsManager.splashBackIMG,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
