import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_futurecode/core/common/helper_widgets/dialog.dart';
import 'package:test_futurecode/core/config/storage/app_storage.dart';

import '../../../../data/models/models.dart';
import '../../../../domain/error_handler/network_exceptions.dart';
import '../../../../domain/repositories/repository.dart';
import '../../../my_vehicles/my_vehicles_screen.dart';

class SignUpController extends GetxController {
  SignUpController(this._repository);
  final Repository _repository;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final ImagePicker picker = ImagePicker();
// Pick an image.
  XFile? image;
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  ///Method
  @override
  void dispose() {
    nameController.clear();
    phoneController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    super.dispose();
  }

  Future<void> singUp() async {

    AppDialogs.showLoading();
    User user=User(fullName: nameController.text, image: image?.path, phoneNumber: phoneController.text,password: passwordController.text,passwordConfirmation: confirmPasswordController.text);

    final response = await _repository.register(user);

    response.when(
      success: (data) async {
         user = data.data;
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

