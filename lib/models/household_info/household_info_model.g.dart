// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'household_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseholdInfoModel _$HouseholdInfoModelFromJson(Map<String, dynamic> json) =>
    HouseholdInfoModel(
      livingWith: (json['living_with'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      allergicToAnimals: json['allergic_to_animals'] as String?,
    );

Map<String, dynamic> _$HouseholdInfoModelToJson(HouseholdInfoModel instance) =>
    <String, dynamic>{
      'living_with': instance.livingWith,
      'allergic_to_animals': instance.allergicToAnimals,
    };
