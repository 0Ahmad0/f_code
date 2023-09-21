import 'package:flutter/material.dart';

import '../../data/datasource/remote/api_response.dart';
import '../../data/datasource/remote/remote_data_source.dart';
import '../../data/models/base_model.dart';
import '../../data/models/models.dart';
import '../error_handler/network_exceptions.dart';

class Repository {
  final RemoteDataSource _remoteDataSource;

  Repository(this._remoteDataSource);

  Future<ApiResponse<BaseModel>> login(String phoneNumber, String password) async {
    try {
      final response = await _remoteDataSource.login(phoneNumber, password);

      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

  Future<ApiResponse<BaseModel>> register(User user) async {
    try {
      final response = await _remoteDataSource.register(user);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }
  Future<ApiResponse<BaseModel>> addVehicle(
      {required Vehicle vehicle})async {
    try {
      final response = await _remoteDataSource.addVehicle(vehicle:vehicle);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }
  Future<ApiResponse<BaseModel>> getVehicleTypes() async {
    try {
      final response = await _remoteDataSource.getVehicleTypes();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }
  Future<ApiResponse<BaseModel>> getMyVehicles() async {
    try {
      final response = await _remoteDataSource.getMyVehicles();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

}
