import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_environment_model.g.dart';

@JsonSerializable()
class HomeEnvironmentModel extends Equatable {
  @JsonKey(name: 'house_building')
  final String? houseBuilding;

  @JsonKey(name: 'is_renting')
  final String? isRenting;

  @JsonKey(name: 'with_landlord_permission')
  final String? withLandlordPermission;

  @JsonKey(name: 'pet_relocation_plan')
  final String? petRelocationPlan;

  const HomeEnvironmentModel({
    this.houseBuilding,
    this.isRenting,
    this.withLandlordPermission,
    this.petRelocationPlan,
  });

  HomeEnvironmentModel copyWith({
    String? houseBuilding,
    String? isRenting,
    String? withLandlordPermission,
    String? petRelocationPlan,
  }) {
    return HomeEnvironmentModel(
        houseBuilding: houseBuilding ?? this.houseBuilding,
        isRenting: isRenting ?? this.isRenting,
        withLandlordPermission: withLandlordPermission ?? this.withLandlordPermission,
        petRelocationPlan: petRelocationPlan ?? this.petRelocationPlan
      );
  }

  @override
  List<Object?> get props => [
    houseBuilding, 
    isRenting, 
    withLandlordPermission,
    petRelocationPlan
  ];

  factory HomeEnvironmentModel.fromJson(Map<String, dynamic> json) =>
      _$HomeEnvironmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeEnvironmentModelToJson(this);
}
