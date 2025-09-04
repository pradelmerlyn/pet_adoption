part of 'pet_reference_bloc.dart';

final class PetReferenceState extends Equatable {
  final PetReferenceModel? petReferenceInfo;
  const PetReferenceState({
    this.petReferenceInfo,
  });
  PetReferenceState copyWith({
    PetReferenceModel? petReferenceInfo,
  }) {
    return PetReferenceState(
      petReferenceInfo: petReferenceInfo ?? this.petReferenceInfo,
    );
  }
  
  @override
  List<Object?> get props => [petReferenceInfo];
}

final class PetReferenceInitial extends PetReferenceState {}

final class PetReferenceSaved extends PetReferenceState {
  const PetReferenceSaved({required PetReferenceModel petReferenceInfo})
      : super(petReferenceInfo: petReferenceInfo);
}
