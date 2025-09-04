// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_reference_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetReferenceModel _$PetReferenceModelFromJson(Map<String, dynamic> json) =>
    PetReferenceModel(
      adoptionPreference: json['adoption_preference'] as String?,
      idealPet: json['ideal_pet'] as String?,
      preferredPetName: json['preferred_pet_name'] as String?,
      ageReference: json['age_refererence'] as String?,
      genderReference: json['gender_reference'] as String?,
      sizeReference: json['size_reference'] as String?,
    );

Map<String, dynamic> _$PetReferenceModelToJson(PetReferenceModel instance) =>
    <String, dynamic>{
      'adoption_preference': instance.adoptionPreference,
      'ideal_pet': instance.idealPet,
      'preferred_pet_name': instance.preferredPetName,
      'age_refererence': instance.ageReference,
      'gender_reference': instance.genderReference,
      'size_reference': instance.sizeReference,
    };
