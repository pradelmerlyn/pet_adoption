import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/models/home_environment/home_environment_model.dart';

part 'home_environment_event.dart';
part 'home_environment_state.dart';

class HomeEnvironmentBloc extends Bloc<HomeEnvironmentEvent, HomeEnvironmentState> {
  HomeEnvironmentBloc() : super(HomeEnvironmentInitial()) {
    on<SaveHomeEnvironmentInfo>((event, emit) {
      emit(HomeEnvironmentSaved(homeEnvironmentInfo: event.heInfo));
      debugPrint('Home Environment Info Saved: 🏡🏡🏡 ${event.heInfo.toString()}');
    });
  }
}

