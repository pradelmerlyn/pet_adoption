// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_owner_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetOwnerHistoryModel _$PetOwnerHistoryModelFromJson(
        Map<String, dynamic> json) =>
    PetOwnerHistoryModel(
      hasPreviousPet: json['has_previous_pet'] as String?,
      lastPetExperience: json['last_pet_experience'] as String?,
      hasOtherPets: json['has_other_pets'] as String?,
      otherPetsDetails: json['other_pets_details'] as String?,
    );

Map<String, dynamic> _$PetOwnerHistoryModelToJson(
        PetOwnerHistoryModel instance) =>
    <String, dynamic>{
      'has_previous_pet': instance.hasPreviousPet,
      'last_pet_experience': instance.lastPetExperience,
      'has_other_pets': instance.hasOtherPets,
      'other_pets_details': instance.otherPetsDetails,
    };
