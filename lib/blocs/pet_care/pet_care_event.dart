part of 'pet_care_bloc.dart';

final class PetCareEvent extends Equatable {
  const PetCareEvent();

  @override
  List<Object> get props => [];
}

final class SavePetCareInfo extends PetCareEvent {
  final PetCareModel petCareInfo;

  const SavePetCareInfo(this.petCareInfo);

  @override
  List<Object> get props => [petCareInfo];
}
