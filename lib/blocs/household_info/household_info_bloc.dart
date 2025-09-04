import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/models/household_info/household_info_model.dart';

part 'household_info_event.dart';
part 'household_info_state.dart';

class HouseholdInfoBloc extends Bloc<HouseholdInfoEvent, HouseholdInfoState> {
  HouseholdInfoBloc() : super(HouseholdInfoInitial()) {
    on<SaveHouseholdInfo>((event, emit) {
      emit(HouseholdInfoSaved(householdInfo: event.hhInfo));
      debugPrint('Household Info Saved: 🏡🏡🏡 ${event.hhInfo.toString()}');
    });
  }
}
