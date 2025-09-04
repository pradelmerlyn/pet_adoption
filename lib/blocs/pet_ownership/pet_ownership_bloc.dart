import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/models/pet_owner_history/pet_owner_history_model.dart';

part 'pet_ownership_event.dart';
part 'pet_ownership_state.dart';

class PetOwnershipBloc extends Bloc<PetOwnershipEvent, PetOwnershipState> {
  PetOwnershipBloc() : super(PetOwnershipInitial()) {
    on<SavePetOwnershipInfo>((event, emit) {
      emit(PetOwnershipSaved(petOwnershipInfo: event.petOwnershipInfo));
      debugPrint('Pet Ownership Info Saved: 🐾🐾🐾 ${event.petOwnershipInfo.toString()}');
    });
  }
}
