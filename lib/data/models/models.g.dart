// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      fullName: json['fullname'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
      image: json['image'] as String?,
      phoneNumber: json['phone_number'] as String,
    )..token = json['token'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullName,
      'phone_number': instance.phoneNumber,
      'image': instance.image,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'token': instance.token,
    };

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      id: json['id'] as int?,
      vehicleTypeId: json['vehicle_type_id'] as int,
      userId: json['user_id'] as int,
      model: json['model'] as String,
      color: json['color'] as String,
      boardNumber: json['board_number'] as int,
      vehicleImage: json['vehicle_image'] as String,
      mechanicImage: json['mechanic_image'] as String,
      boardImage: json['board_image'] as String,
      idImage: json['id_image'] as String,
      delegateImage: json['delegate_image'] as String,
      vehicleType: json['type'] == null
          ? null
          : VehicleType.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'id': instance.id,
      'vehicle_type_id': instance.vehicleTypeId,
      'user_id': instance.userId,
      'model': instance.model,
      'color': instance.color,
      'board_number': instance.boardNumber,
      'vehicle_image': instance.vehicleImage,
      'mechanic_image': instance.mechanicImage,
      'board_image': instance.boardImage,
      'id_image': instance.idImage,
      'delegate_image': instance.delegateImage,
      'type': instance.vehicleType?.toJson(),
    };

VehicleType _$VehicleTypeFromJson(Map<String, dynamic> json) => VehicleType(
      id: json['id'] as int?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$VehicleTypeToJson(VehicleType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
