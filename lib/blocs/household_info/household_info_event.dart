part of 'household_info_bloc.dart';

abstract class HouseholdInfoEvent extends Equatable {
  const HouseholdInfoEvent();

  @override
  List<Object> get props => [];
}

class SaveHouseholdInfo extends HouseholdInfoEvent {
  final HouseholdInfoModel hhInfo;

  const SaveHouseholdInfo(this.hhInfo);

  @override
  List<Object> get props => [hhInfo];
}
