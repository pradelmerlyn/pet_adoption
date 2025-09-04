import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/blocs/animals/animals_bloc.dart';
import 'package:pet_adoption/models/animals/animals_model.dart';
import 'package:pet_adoption/services/animal/animal_service.dart';

part 'pet_details_event.dart';
part 'pet_details_state.dart';

class PetDetailsBloc extends Bloc<PetDetailsEvent, PetDetailsState> {
  PetDetailsBloc() : super(const PetDetailsLoading()) {
    on<GetPetDetailsEvent>(_onGetPetDetails);
    on<ToggleFavoriteEvent>(_onToggleFavorite);
  }

  Future<void> _onGetPetDetails(
      GetPetDetailsEvent event, Emitter<PetDetailsState> emit) async {
    debugPrint('🐾 petId: ${event.petId}');
    debugPrint('💓 isFavorite: ${event.isFavorite}');
    debugPrint('📦 Animal: ${event.animal.name}');

    emit(PetDetailsLoaded(
        animal: event.animal,
        petId: event.petId,
        isLoading: false,
        isFavorite: event.isFavorite));
  }

  void _onToggleFavorite(
      ToggleFavoriteEvent event, Emitter<PetDetailsState> emit) {
    if (state is PetDetailsLoaded) {
      final currentState = state as PetDetailsLoaded;
      emit(
        PetDetailsLoaded(
          animal: currentState.animal,
          petId: currentState.petId,
          isLoading: currentState.isLoading,
          isFavorite: !currentState.isFavorite,
        ),
      );
      debugPrint('Toggle Favorite: ${currentState.isFavorite}');
      debugPrint('Current State: $state');
    }
  }
}
