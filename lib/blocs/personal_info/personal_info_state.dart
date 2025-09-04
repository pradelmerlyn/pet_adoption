part of 'personal_info_bloc.dart';

final class PersonalInfoState extends Equatable {
  final PersonalInfoModel? personalInfo;

  const PersonalInfoState({
    this.personalInfo,
  });
  
  PersonalInfoState copyWith({
    PersonalInfoModel? personalInfo,
  }) {
    return PersonalInfoState(
      personalInfo: personalInfo ?? this.personalInfo,
    );
  }

  @override
  List<Object?> get props => [personalInfo];
}

final class PersonalInfoInitial extends PersonalInfoState {
  const PersonalInfoInitial() : super ( personalInfo: null );
}

final class PersonalInfoSaved extends PersonalInfoState {
  const PersonalInfoSaved({required PersonalInfoModel personalInfo})
      : super(personalInfo: personalInfo);
}
