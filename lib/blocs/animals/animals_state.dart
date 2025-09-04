part of 'animals_bloc.dart';

enum AnimalsStatus { loading, loaded, success, failed }

final class AnimalsState extends Equatable {
  final AnimalsStatus status;
  final List<AnimalModel> animals;

  const AnimalsState({
    this.status = AnimalsStatus.loading,
    this.animals = const [],
  });
  
  AnimalsState copyWith({
    AnimalsStatus? status,
    List<AnimalModel>? animals,
  }) {
    return AnimalsState(
      status: status ?? this.status,
      animals: animals ?? this.animals,
    );
  }

  @override
  List<Object> get props => [ status, animals ];
}

