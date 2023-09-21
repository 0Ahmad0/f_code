
import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class BaseModel<T> {
  BaseModel({required this.data,this.message=''});
  final T? data;

  final String message;
  factory BaseModel.fromJson(Map<String, dynamic> json,T Function(dynamic json) fromJsonT) {
    return _$BaseModelFromJson(json,fromJsonT);
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$BaseModelToJson(this,toJsonT);
}
