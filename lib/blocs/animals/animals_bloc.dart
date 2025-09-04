
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pet_adoption/models/animals/animals_model.dart';

import '../../services/animal/animal_service.dart';

part 'animals_event.dart';
part 'animals_state.dart';

class AnimalsBloc extends Bloc<AnimalsEvent, AnimalsState> {
  AnimalsBloc() : super(const AnimalsState()) {
    on<GetAnimalsEvent>(_onGetAnimalsEvent);
  }
  Future<void> _onGetAnimalsEvent(
    GetAnimalsEvent event,
    Emitter<AnimalsState> emit,
  ) async {
      try {
        final AnimalServices animalServices = AnimalServices();
        emit(state.copyWith(
          status: AnimalsStatus.loading,
          animals: [],
        ));

        final response = await animalServices.getAnimals();
        if (kDebugMode) {
          print(jsonEncode(response.data.toString()));
        }

        emit(
          state.copyWith(
            status: AnimalsStatus.loaded,
            animals: response.data,
          ),
        );
        return;
      } catch (e, stackTrace) {
        log(e.toString());
        log(stackTrace.toString());
        emit(state.copyWith(
          status: AnimalsStatus.failed,
          animals: [],
        ));
      }
    }

}
