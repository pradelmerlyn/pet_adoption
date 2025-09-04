import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/models/agreement/agreement_model.dart';

part 'agreement_event.dart';
part 'agreement_state.dart';

class AgreementBloc extends Bloc<AgreementEvent, AgreementState> {
  AgreementBloc() : super(AgreementInitial()) {
    on<SaveAgreementInfo>((event, emit) {
      emit(AgreementSaved(agreementInfo: event.agreementInfo));
      debugPrint('Agreement Info Saved: 📜📜📜 ${event.agreementInfo.toString()}');
    });
  }
}
