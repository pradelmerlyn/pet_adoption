// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_care_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetCareModel _$PetCareModelFromJson(Map<String, dynamic> json) => PetCareModel(
      primaryPetCaretaker: json['primary_pet_caretaker'] as String?,
      hoursPetAlone: json['hours_pet_alone'] as String?,
      vacationPlan: json['vacation_plan'] as String?,
      petIntroPlan: json['pet_intro_plan'] as String?,
    );

Map<String, dynamic> _$PetCareModelToJson(PetCareModel instance) =>
    <String, dynamic>{
      'primary_pet_caretaker': instance.primaryPetCaretaker,
      'hours_pet_alone': instance.hoursPetAlone,
      'vacation_plan': instance.vacationPlan,
      'pet_intro_plan': instance.petIntroPlan,
    };
