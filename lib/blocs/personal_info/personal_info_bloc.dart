import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/models/personal_info/personal_info_model.dart';

part 'personal_info_event.dart';
part 'personal_info_state.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfoBloc() : super(const PersonalInfoInitial()) {
    on<SavePersonalInfo>((event, emit) {
      emit(PersonalInfoSaved(personalInfo: event.info));
      debugPrint('Personal Info Saved: 👱👱👱 ${event.info.toString()}');
    });
  }

}
