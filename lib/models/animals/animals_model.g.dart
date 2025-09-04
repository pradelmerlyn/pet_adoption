// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalModel _$AnimalModelFromJson(Map<String, dynamic> json) => AnimalModel(
      id: json['id'] as num?,
      name: json['name'] as String?,
      age: json['age'] as String?,
      weight: json['weight'] as num?,
      imageUrl: json['image_url'] as String?,
      description: json['description'] as String?,
      adoptionFee: json['adoption_fee'] as num?,
      shelterId: json['shelterId'] as num?,
      species: json['species'] as String?,
      gender: json['gender'] as String?,
      shortDescription: json['short_description'] as String?,
    );

Map<String, dynamic> _$AnimalModelToJson(AnimalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'species': instance.species,
      'gender': instance.gender,
      'short_description': instance.shortDescription,
      'weight': instance.weight,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'adoption_fee': instance.adoptionFee,
      'shelterId': instance.shelterId,
    };
