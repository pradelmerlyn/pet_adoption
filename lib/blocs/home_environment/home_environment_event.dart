part of 'home_environment_bloc.dart';

abstract class HomeEnvironmentEvent extends Equatable {
  const HomeEnvironmentEvent();

  @override
  List<Object> get props => [];
}

class SaveHomeEnvironmentInfo extends HomeEnvironmentEvent {
  final HomeEnvironmentModel heInfo;

  const SaveHomeEnvironmentInfo(this.heInfo);

  @override
  List<Object> get props => [heInfo];
}
