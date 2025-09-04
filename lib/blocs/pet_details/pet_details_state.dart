part of 'pet_details_bloc.dart';

abstract class PetDetailsState extends Equatable {
  const PetDetailsState();

  @override
  List<Object?> get props => [];
}

class PetDetailsInitial extends PetDetailsState {
  const PetDetailsInitial();
}

class PetDetailsLoading extends PetDetailsState {
  const PetDetailsLoading();
}

class PetDetailsLoaded extends PetDetailsState {
  final AnimalModel? animal;
  final String petId;
  final bool isLoading;
  final bool isFavorite;

  const PetDetailsLoaded({
    required this.animal,
    required this.petId,
    required this.isLoading,
    required this.isFavorite,
  });

  @override
  List<Object?> get props => [animal, petId, isLoading, isFavorite];
}
