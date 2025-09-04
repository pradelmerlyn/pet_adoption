import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet_owner_history_model.g.dart';

@JsonSerializable()
class PetOwnerHistoryModel extends Equatable {
  @JsonKey(name: 'has_previous_pet')
  final String? hasPreviousPet;

  @JsonKey(name: 'last_pet_experience')
  final String? lastPetExperience;

  @JsonKey(name: 'has_other_pets')
  final String? hasOtherPets;

  @JsonKey(name: 'other_pets_details')
  final String? otherPetsDetails;

  const PetOwnerHistoryModel({
    this.hasPreviousPet,
    this.lastPetExperience,
    this.hasOtherPets,
    this.otherPetsDetails,
  });

  PetOwnerHistoryModel copyWith({
    String? hasPreviousPet,
    String? lastPetExperience,
    String? hasOtherPets,
    String? otherPetsDetails,
  }) {
    return PetOwnerHistoryModel(
        hasPreviousPet: hasPreviousPet ?? this.hasPreviousPet,
        lastPetExperience: lastPetExperience ?? this.lastPetExperience,
        hasOtherPets: hasOtherPets ?? this.hasOtherPets,
        otherPetsDetails: otherPetsDetails ?? this.otherPetsDetails);
  }

  @override
  List<Object?> get props =>
    [ 
      hasPreviousPet, 
      lastPetExperience, 
      hasOtherPets, 
      otherPetsDetails
    ];

  factory PetOwnerHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$PetOwnerHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$PetOwnerHistoryModelToJson(this);
}
