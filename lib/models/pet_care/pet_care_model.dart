import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet_care_model.g.dart';

@JsonSerializable()
class PetCareModel extends Equatable {
  @JsonKey(name: 'primary_pet_caretaker')
  final String? primaryPetCaretaker;

  @JsonKey(name: 'hours_pet_alone')
  final String? hoursPetAlone;

  @JsonKey(name: 'vacation_plan')
  final String? vacationPlan;

  @JsonKey(name: 'pet_intro_plan')
  final String? petIntroPlan;

  const PetCareModel({
    this.primaryPetCaretaker,
    this.hoursPetAlone,
    this.vacationPlan,
    this.petIntroPlan,
  });

  PetCareModel copyWith({
    String? primaryPetCaretaker,
    String? hoursPetAlone,
    String? vacationPlan,
    String? petIntroPlan,
  }) {
    return PetCareModel(
        primaryPetCaretaker: primaryPetCaretaker ?? this.primaryPetCaretaker,
        hoursPetAlone: hoursPetAlone ?? this.hoursPetAlone,
        vacationPlan: vacationPlan ?? this.vacationPlan,
        petIntroPlan: petIntroPlan ?? this.petIntroPlan
      );
  }

  @override
  List<Object?> get props => [
    primaryPetCaretaker, 
    hoursPetAlone, 
    vacationPlan,
    petIntroPlan
  ];

  factory PetCareModel.fromJson(Map<String, dynamic> json) =>
      _$PetCareModelFromJson(json);

  Map<String, dynamic> toJson() => _$PetCareModelToJson(this);
}
