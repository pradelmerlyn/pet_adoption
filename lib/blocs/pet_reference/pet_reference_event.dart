part of 'pet_reference_bloc.dart';

abstract class PetReferenceEvent extends Equatable {
  const PetReferenceEvent();

  @override
  List<Object> get props => [];
}

final class SavePetReferenceInfo extends PetReferenceEvent {
  final PetReferenceModel petReferenceInfo;

  const SavePetReferenceInfo(this.petReferenceInfo);

  @override
  List<Object> get props => [petReferenceInfo];
}
