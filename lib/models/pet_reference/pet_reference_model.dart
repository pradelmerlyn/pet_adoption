import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet_reference_model.g.dart';

@JsonSerializable()
class PetReferenceModel extends Equatable {
  @JsonKey(name: 'adoption_preference')
  final String? adoptionPreference;

  @JsonKey(name: 'ideal_pet')
  final String? idealPet;

  @JsonKey(name: 'preferred_pet_name')
  final String? preferredPetName;

  @JsonKey(name: 'age_refererence')
  final String? ageReference;

  @JsonKey(name: 'gender_reference')
  final String? genderReference;

  @JsonKey(name: 'size_reference')
  final String? sizeReference;

  const PetReferenceModel({
    this.adoptionPreference,
    this.idealPet,
    this.preferredPetName,
    this.ageReference,
    this.genderReference,
    this.sizeReference,
  });

  PetReferenceModel copyWith({
    String? adoptionPreference,
    String? idealPet,
    String? preferredPetName,
    String? ageReference,
    String? genderReference,
    String? sizeReference,
  }) {
    return PetReferenceModel(
        adoptionPreference: adoptionPreference ?? this.adoptionPreference,
        idealPet: idealPet ?? this.idealPet,
        preferredPetName: preferredPetName ?? this.preferredPetName,
        ageReference: ageReference ?? this.ageReference,
        genderReference: genderReference ?? this.genderReference,
        sizeReference: sizeReference ?? this.sizeReference
      );
  }

  @override
  List<Object?> get props => [
    adoptionPreference, 
    idealPet, 
    preferredPetName,
    ageReference,
    genderReference,
    sizeReference
  ];

  factory PetReferenceModel.fromJson(Map<String, dynamic> json) =>
      _$PetReferenceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PetReferenceModelToJson(this);
}
