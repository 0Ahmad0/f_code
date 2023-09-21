import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';


///User
@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class User extends HiveObject{
  @HiveField(0)
  final int? id;
  @HiveField(1)
  @JsonKey(name: "fullname")
  String? fullName;
  @HiveField(3)
  @JsonKey(name: "phone_number")
  String phoneNumber;
  @HiveField(4)
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "password_confirmation")
  String? passwordConfirmation;
  @HiveField(5)
  @JsonKey(name: "token")
   String? token;

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User({
    this.id,
    required this.fullName,
     this.password,
     this.passwordConfirmation,
    required this.image,
    required this.phoneNumber,
  });
}


///Vehicle
@JsonSerializable(explicitToJson: true)
class Vehicle {
  final int? id;
  @JsonKey(name: "vehicle_type_id")
  int vehicleTypeId;
  @JsonKey(name: "user_id")
  int userId;
  @JsonKey(name: "model")
  String model;
  @JsonKey(name: "color")
  String color;
  @JsonKey(name: "board_number")
  int boardNumber;
  @JsonKey(name: "vehicle_image")
  String vehicleImage;
   @JsonKey(name: "mechanic_image")
  String mechanicImage;
   @JsonKey(name: "board_image")
  String boardImage;
   @JsonKey(name: "id_image")
  String idImage;
   @JsonKey(name: "delegate_image")
  String delegateImage;
  @JsonKey(name: "type")
   VehicleType? vehicleType;

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return _$VehicleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VehicleToJson(this);

  Vehicle({
    this.id,
    required this.vehicleTypeId,
    required this.userId,
    required this.model,
    required this.color,
    required this.boardNumber,
    required this.vehicleImage,
    required this.mechanicImage,
    required this.boardImage,
    required this.idImage,
    required this.delegateImage,
    this.vehicleType,

  });
}


class Vehicles {
  List<Vehicle> listVehicle;

  factory Vehicles.fromJson(Map<String, dynamic> json) {
    return _$VehiclesFromJson(json);
  }
  Map<String, dynamic> toJson() => _$VehiclesToJson(this);

  Vehicles({required this.listVehicle});
}

Vehicles _$VehiclesFromJson(json) => Vehicles(
  listVehicle: (json as List<dynamic>)
      .map((e) => Vehicle.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$VehiclesToJson(Vehicles instance) => <String, dynamic>{
  'listVehicle': instance.listVehicle.map((e) => e.toJson()).toList(),
};



///VehicleType
@JsonSerializable(explicitToJson: true)
class VehicleType {
  final int? id;
  @JsonKey(name: "name")
  String name;


  factory VehicleType.fromJson(Map<String, dynamic> json) {
    return _$VehicleTypeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VehicleTypeToJson(this);

  VehicleType({
    this.id,
    required this.name
  });
}


class VehicleTypes {
  List<VehicleType> listVehicleType;

  factory VehicleTypes.fromJson(Map<String, dynamic> json) {
    return _$VehicleTypesFromJson(json);
  }
  Map<String, dynamic> toJson() => _$VehicleTypesToJson(this);

  VehicleTypes({required this.listVehicleType});
}
VehicleTypes _$VehicleTypesFromJson(json) => VehicleTypes(
  listVehicleType: (json as List<dynamic>)
      .map((e) => VehicleType.fromJson(e as Map<String, dynamic>))
      .toList(),
);
Map<String, dynamic> _$VehicleTypesToJson(VehicleTypes instance) => <String, dynamic>{
  'listVehicleType': instance.listVehicleType.map((e) => e.toJson()).toList(),
};




enum LoadState {
  //loading
  loading,
  //completed
  completed,
  //failed
  failed
}

