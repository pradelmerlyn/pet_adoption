part of 'pet_care_bloc.dart';

final class PetCareState extends Equatable {
  final PetCareModel? petCareInfo;

  const PetCareState({
    this.petCareInfo,
  });
  PetCareState copyWith({
    PetCareModel? petCareInfo,
  }) {
    return PetCareState(
      petCareInfo: petCareInfo ?? this.petCareInfo,
    );
  }
  @override
  List<Object?> get props => [petCareInfo];
}

final class PetCareInitial extends PetCareState {}

final class PetCareSaved extends PetCareState {
  const PetCareSaved({required PetCareModel petCareInfo})
      : super(petCareInfo: petCareInfo);
}
