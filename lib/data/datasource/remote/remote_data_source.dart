import 'dart:io' as io;
import 'dart:io';
import 'dart:typed_data';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';



import '../../../core/utils/app_url.dart';
import '../../../domain/services/api_service.dart';
import '../../models/base_model.dart';
import '../../models/models.dart';

class RemoteDataSource {
  final ApiServices _apiServices;

  RemoteDataSource(this._apiServices);

  Future<BaseModel> login(String phoneNumber, String password) async {
    final response = await _apiServices.post(AppUrl.login,
        body: {
          "phone_number": phoneNumber,
          "password": password,
        },
        hasToken: false);
    if(response['data']!=null){
      response['data']['user']['token'] = response['data']['token'];
      response['data']['user']['image'] = '';
      response['data']=response['data']['user'];
    }

      User.fromJson(response['data']);

      return BaseModel.fromJson(
        response,
            (json) => User.fromJson(json),
      );
  }

  Future<BaseModel> register(User user) async {
    FormData formData = FormData.fromMap({
      "fullname": user.fullName,
      'phone_number': user.phoneNumber,
      "password": user.password,
      "password_confirmation": user.passwordConfirmation,
      "image": user.image,
    });
      formData.files.add(MapEntry(
          'image', await MultipartFile.fromFile(user.image!)));

    final response = await _apiServices.post(AppUrl.register,
        formData: formData, hasToken: false);
    if(response['data']!=null) {
      response['data']['user']['token'] = response['data']['token'];
      response['data'] = response['data']['user'];
    }
      return BaseModel.fromJson(
        response,
            (json) => User.fromJson(json),
      );
  }

  ///Vehicle
  Future<BaseModel> addVehicle(
      {required Vehicle vehicle}) async {
    FormData formData  = FormData.fromMap(vehicle.toJson());
    formData.files.add(MapEntry(
        'vehicle_image', await MultipartFile.fromFile(vehicle.vehicleImage!)));
    formData.files.add(MapEntry(
        'board_image', await MultipartFile.fromFile(vehicle.boardImage!)));
    formData.files.add(MapEntry(
        'id_image', await MultipartFile.fromFile(vehicle.idImage!)));
    formData.files.add(MapEntry(
        'mechanic_image', await MultipartFile.fromFile(vehicle.mechanicImage!)));
    formData.files.add(MapEntry(
        'delegate_image', await MultipartFile.fromFile(vehicle.delegateImage!)));

    final response = await _apiServices.post(AppUrl.vehicle,
        formData: formData, hasToken: true);
    return BaseModel.fromJson(
      response,
      (json) => Vehicle.fromJson(json),
    );
  }
  Future<BaseModel> getMyVehicles() async {
    final response =
    await _apiServices.get(AppUrl.vehicle, hasToken: true);
    return BaseModel.fromJson(
      response,
          (json) => Vehicles.fromJson(json),
    );
  }
  Future<BaseModel> getVehicleTypes() async {
    final response =
    await _apiServices.get(AppUrl.vehicleType, hasToken: true);

    return BaseModel.fromJson(
      response,
          (json) => VehicleTypes.fromJson(json),
    );
  }
}
