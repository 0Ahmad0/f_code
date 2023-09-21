
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_futurecode/core/common/helper_widgets/dialog.dart';
import 'package:test_futurecode/core/config/storage/app_storage.dart';
import 'package:test_futurecode/core/utils/color_manager.dart';
import 'package:test_futurecode/core/utils/theme_manager.dart';

import '../../../../data/models/models.dart';
import '../../../../domain/error_handler/network_exceptions.dart';
import '../../../../domain/repositories/repository.dart';
import '../../my_vehicles/my_vehicles_screen.dart';

class AddVehicleController extends GetxController {
  AddVehicleController(this._repository);
  final Repository _repository;
  var vehicleTypes = VehicleTypes(listVehicleType: []).obs;
  var isLoading = false.obs;
  String? colorSelect;

  int? vehicleTypeId;
  int? userId;
  final modelController = TextEditingController();
  final numberController = TextEditingController();
  List<File> files = [];
  List<String> colors=['أزرق','أخضر','أصفر','أحمر','أبيض','أسود'];
  ///Method
  @override
  void dispose() {

    super.dispose();
  }
  Future<void> getVehicleTypes() async {
    isLoading.value=true;
    final response = await _repository.getVehicleTypes();

    response.when(
      success: (data) async {
        vehicleTypes.value = data.data;
        isLoading.value=false;
      },
      failure: ( networkException) {
        isLoading.value=false;
        Get.snackbar( 'حدث خطأ!',NetworkExceptions.getErrorMessage(networkException));

      },
    );
  }

  Future<void> addVehicle() async {
    AppDialogs.showLoading();
    await AppStorage.getAdvance().then((value) =>userId= value?.userId);
    final response = await _repository.addVehicle(vehicle:
    Vehicle(vehicleTypeId: vehicleTypeId??0, userId:userId??0, model: modelController.text, color: colorSelect??'', boardNumber:int.parse(numberController.text) , vehicleImage: files[1].path, mechanicImage: files[0].path, boardImage: files[2].path, idImage: files[3].path, delegateImage: files[4].path));

    response.when(
      success: (data) async {

        Get.back();
          Get.offAll(() => MyVehiclesScreen());
        Get.snackbar( 'تمت العملية بنجاح','تمت إضافة المركبة',colorText: ColorManager.primaryColor);
      },
      failure: ( networkException) {
        Get.back();
        Get.snackbar( 'حدث خطأ!',NetworkExceptions.getErrorMessage(networkException));

      },
    );
  }



}

