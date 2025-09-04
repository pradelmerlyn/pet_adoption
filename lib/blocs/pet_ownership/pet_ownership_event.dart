part of 'pet_ownership_bloc.dart';

abstract class PetOwnershipEvent extends Equatable {
  const PetOwnershipEvent();

  @override
  List<Object> get props => [];
}

final class SavePetOwnershipInfo extends PetOwnershipEvent {
  final PetOwnerHistoryModel petOwnershipInfo;

  const SavePetOwnershipInfo(this.petOwnershipInfo);

  @override
  List<Object> get props => [petOwnershipInfo];
}
