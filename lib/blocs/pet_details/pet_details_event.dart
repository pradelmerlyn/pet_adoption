part of 'pet_details_bloc.dart';

abstract class PetDetailsEvent extends Equatable {
  const PetDetailsEvent();

  @override
  List<Object> get props => [];
}

final class GetPetDetailsEvent extends PetDetailsEvent {
  final String petId;
  final AnimalModel animal;
  final bool isFavorite;
  final bool isLoading;

  const GetPetDetailsEvent(
    {
      required this.petId, 
      required this.isFavorite, 
      required this.animal,
      required this.isLoading
    }
  );

  @override
  List<Object> get props => [petId, isFavorite, animal, isLoading];
}

class ToggleFavoriteEvent extends PetDetailsEvent {
  const ToggleFavoriteEvent();
  @override
  List<Object> get props => [];
}
