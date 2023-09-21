import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_futurecode/core/common/helper_widgets/dialog.dart';
import 'package:test_futurecode/core/config/storage/app_storage.dart';

import '../../../../data/models/models.dart';
import '../../../../domain/error_handler/network_exceptions.dart';
import '../../../../domain/repositories/repository.dart';

class MyVehiclesController extends GetxController {
  MyVehiclesController(this._repository);
  final Repository _repository;
  var vehicles = Vehicles(listVehicle: []).obs;
  var vehicle = Vehicle.init().obs;
  var isLoading = false.obs;
  var clickIndex= (-1).obs;
  ///Method

  @override
  void dispose() {
    super.dispose();
  }
  Future<void> getMyVehicles() async {
    isLoading.value=true;

    final response = await _repository.getMyVehicles();

    response.when(
      success: (data) async {
        vehicles.value = data.data;
        isLoading.value=false;
      },
      failure: ( networkException) {
        isLoading.value=false;
        Get.snackbar( 'حدث خطأ!',NetworkExceptions.getErrorMessage(networkException));

      },
    );
  }



}

