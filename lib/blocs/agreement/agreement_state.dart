part of 'agreement_bloc.dart';

final class AgreementState extends Equatable {
  final AgreementModel? agreementInfo;
  const AgreementState({
    this.agreementInfo,
  });
  AgreementState copyWith({
    AgreementModel? agreementInfo,
  }) {
    return AgreementState(
      agreementInfo: agreementInfo ?? this.agreementInfo,
    );
  }
  @override
  List<Object?> get props => [agreementInfo];
}

final class AgreementInitial extends AgreementState {}

final class AgreementSaved extends AgreementState {
  const AgreementSaved({required AgreementModel agreementInfo})
      : super(agreementInfo: agreementInfo);
}
