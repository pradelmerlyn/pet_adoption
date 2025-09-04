part of 'agreement_bloc.dart';

abstract class AgreementEvent extends Equatable {
  const AgreementEvent();

  @override
  List<Object> get props => [];
}

final class SaveAgreementInfo extends AgreementEvent {
  final AgreementModel agreementInfo;

  const SaveAgreementInfo(this.agreementInfo);

  @override
  List<Object> get props => [agreementInfo];
}