import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_futurecode/core/common/helper_widgets/dialog.dart';
import 'package:test_futurecode/core/config/storage/app_storage.dart';
import 'package:test_futurecode/screens/my_vehicles/my_vehicles_screen.dart';

import '../../../../data/models/models.dart';
import '../../../../domain/error_handler/network_exceptions.dart';
import '../../../../domain/repositories/repository.dart';
import '../../intro/intro_screen.dart';

class SplashController extends GetxController {
  SplashController();

  ///Method
  Future<void> checkLogin() async {
    Advance? advance = await AppStorage.getAdvance();

    if(advance == null){
      Get.off(()=>const IntroScreen());

    }
    else{
      Get.off(()=>const MyVehiclesScreen());
    }
  }
  Future<void> initSplash() async {
    await AppStorage.init();
    await checkLogin();

  }



}

