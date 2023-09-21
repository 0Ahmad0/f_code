import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_futurecode/core/common/helper_widgets/dialog.dart';
import 'package:test_futurecode/core/config/storage/app_storage.dart';

import '../../../../data/models/models.dart';
import '../../../../domain/error_handler/network_exceptions.dart';
import '../../../../domain/repositories/repository.dart';
import '../../../my_vehicles/my_vehicles_screen.dart';

class LoginController extends GetxController {
  LoginController(this._repository);
  final Repository _repository;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  @override
  void dispose() {
    phoneController.clear();
    passwordController.clear();
    super.dispose();
  }
  ///Method


  Future<void> login() async {

    AppDialogs.showLoading();
    final response = await _repository.login(phoneController.text, passwordController.text);

    response.when(
      success: (data) async {
        User user = data.data;
        Advance advance=Advance(token: user.token);
        await  AppStorage.setAdvance(advance);

        Get.back();
          Get.offAll(() => MyVehiclesScreen());
      },
      failure: ( networkException) {
        Get.back();
        Get.snackbar( 'حدث خطأ!',NetworkExceptions.getErrorMessage(networkException));

      },
    );
  }



}

