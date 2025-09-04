import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'household_info_model.g.dart';

@JsonSerializable()
class HouseholdInfoModel extends Equatable {
  @JsonKey(name: 'living_with')
  final List<String>? livingWith;

  @JsonKey(name: 'allergic_to_animals')
  final String? allergicToAnimals;

  const HouseholdInfoModel({
    this.livingWith,
    this.allergicToAnimals,
  });

  HouseholdInfoModel copyWith({
    List<String>? livingWith,
    String? allergicToAnimals,
  }) {
    return HouseholdInfoModel(
      livingWith: livingWith ?? this.livingWith,
      allergicToAnimals: allergicToAnimals ?? this.allergicToAnimals,
    );
  }

  @override
  List<Object?> get props => [livingWith, allergicToAnimals];

  factory HouseholdInfoModel.fromJson(Map<String, dynamic> json) =>
      _$HouseholdInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$HouseholdInfoModelToJson(this);
}
