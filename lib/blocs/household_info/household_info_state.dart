part of 'household_info_bloc.dart';

final class HouseholdInfoState extends Equatable {
  final HouseholdInfoModel? householdInfo;
  const HouseholdInfoState({
    this.householdInfo,
  });
  HouseholdInfoState copyWith({
    HouseholdInfoModel? householdInfo,
  }) {
    return HouseholdInfoState(
      householdInfo: householdInfo ?? this.householdInfo,
    );
  }
  @override
  List<Object?> get props => [householdInfo];
}

final class HouseholdInfoInitial extends HouseholdInfoState {}

final class HouseholdInfoSaved extends HouseholdInfoState {
  const HouseholdInfoSaved({required HouseholdInfoModel householdInfo})
      : super(householdInfo: householdInfo);
}
