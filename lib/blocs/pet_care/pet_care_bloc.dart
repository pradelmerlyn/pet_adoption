import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/models/pet_care/pet_care_model.dart';

part 'pet_care_event.dart';
part 'pet_care_state.dart';

class PetCareBloc extends Bloc<PetCareEvent, PetCareState> {
  PetCareBloc() : super(PetCareInitial()) {
    on<SavePetCareInfo>((event, emit) {
      emit(PetCareState(petCareInfo: event.petCareInfo));
      debugPrint(
          'Home Environment Info Saved: 🏡🏡🏡 ${event.petCareInfo.toString()}');
    });
  }
}
