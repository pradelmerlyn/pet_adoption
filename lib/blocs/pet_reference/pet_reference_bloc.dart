import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/models/pet_reference/pet_reference_model.dart';

part 'pet_reference_event.dart';
part 'pet_reference_state.dart';

class PetReferenceBloc extends Bloc<PetReferenceEvent, PetReferenceState> {
  PetReferenceBloc() : super(PetReferenceInitial()) {
    on<SavePetReferenceInfo>((event, emit) {
      emit(PetReferenceSaved(petReferenceInfo: event.petReferenceInfo));
      debugPrint('Pet Reference Info Saved: 🐾🐾🐾 ${event.petReferenceInfo.toString()}');
    });
  }
}
