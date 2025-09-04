// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_environment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeEnvironmentModel _$HomeEnvironmentModelFromJson(
        Map<String, dynamic> json) =>
    HomeEnvironmentModel(
      houseBuilding: json['house_building'] as String?,
      isRenting: json['is_renting'] as String?,
      withLandlordPermission: json['with_landlord_permission'] as String?,
      petRelocationPlan: json['pet_relocation_plan'] as String?,
    );

Map<String, dynamic> _$HomeEnvironmentModelToJson(
        HomeEnvironmentModel instance) =>
    <String, dynamic>{
      'house_building': instance.houseBuilding,
      'is_renting': instance.isRenting,
      'with_landlord_permission': instance.withLandlordPermission,
      'pet_relocation_plan': instance.petRelocationPlan,
    };
