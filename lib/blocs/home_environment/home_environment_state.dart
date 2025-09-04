part of 'home_environment_bloc.dart';

final class HomeEnvironmentState extends Equatable {
  final HomeEnvironmentModel? homeEnvironmentInfo;

  const HomeEnvironmentState({
    this.homeEnvironmentInfo,
  });
  
  HomeEnvironmentState copyWith({
    HomeEnvironmentModel? homeEnvironmentInfo,
  }) {
    return HomeEnvironmentState(
      homeEnvironmentInfo: homeEnvironmentInfo ?? this.homeEnvironmentInfo,
    );
  }
  
  @override
  List<Object?> get props => [homeEnvironmentInfo];
}

final class HomeEnvironmentInitial extends HomeEnvironmentState {}

final class HomeEnvironmentSaved extends HomeEnvironmentState {
  const HomeEnvironmentSaved({required HomeEnvironmentModel homeEnvironmentInfo})
      : super(homeEnvironmentInfo: homeEnvironmentInfo);
}