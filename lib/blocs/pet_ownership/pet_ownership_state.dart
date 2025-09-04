part of 'pet_ownership_bloc.dart';

final class PetOwnershipState extends Equatable {
  final PetOwnerHistoryModel? petOwnershipInfo;
  const PetOwnershipState({
    this.petOwnershipInfo,
  });
  PetOwnershipState copyWith({
    PetOwnerHistoryModel? petOwnershipInfo,
  }) {
    return PetOwnershipState(
      petOwnershipInfo: petOwnershipInfo ?? this.petOwnershipInfo,
    );
  }
  @override 
  List<Object?> get props => [petOwnershipInfo];
}

final class PetOwnershipInitial extends PetOwnershipState {}

final class PetOwnershipSaved extends PetOwnershipState {
  const PetOwnershipSaved({required PetOwnerHistoryModel petOwnershipInfo})
      : super(petOwnershipInfo: petOwnershipInfo);
}
