part of 'personal_info_bloc.dart';

abstract class PersonalInfoEvent extends Equatable {
  const PersonalInfoEvent();

  @override
  List<Object> get props => [];
}

class SavePersonalInfo extends PersonalInfoEvent {
  final PersonalInfoModel info;
  const SavePersonalInfo(this.info);
  
  @override
  List<Object> get props => [info];
}