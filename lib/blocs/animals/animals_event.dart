part of 'animals_bloc.dart';

abstract class AnimalsEvent extends Equatable {
  const AnimalsEvent();

  @override
  List<Object> get props => [];
}

class GetAnimalsEvent extends AnimalsEvent {
  final String category;
  const GetAnimalsEvent({
    required this.category,
  });
  @override
  List<Object> get props => [category];
  

}