import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'animals_model.g.dart';

@JsonSerializable()
class AnimalModel extends Equatable {
  @JsonKey(name: 'id')
  final num? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'age')
  final String? age;

  @JsonKey(name: 'species')
  final String? species;

  @JsonKey(name: 'gender')
  final String? gender;

  @JsonKey(name: 'short_description')
  final String? shortDescription;

  @JsonKey(name: 'weight')
  final num? weight;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'adoption_fee')
  final num? adoptionFee;

  @JsonKey(name: 'shelterId')
  final num? shelterId;

  const AnimalModel({
    this.id,
    this.name,
    this.age,
    this.weight,
    this.imageUrl,
    this.description,
    this.adoptionFee,
    this.shelterId,
    this.species,
    this.gender,
    this.shortDescription,
  });

  AnimalModel copyWith({
    num? id,
    String? name,
    String? age,
    num? weight,
    String? imageUrl,
    String? description,
    num? adoptionFee,
    num? shelterId,
    String? species,
    String? gender,
    String? shortDescription,
  }) {
    return AnimalModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      description: description ?? this.description,
      adoptionFee: adoptionFee ?? this.adoptionFee,
      shelterId: shelterId ?? this.shelterId,
      species: species ?? this.species,
      gender: gender ?? this.gender,
      shortDescription: shortDescription ?? this.shortDescription,
    );
  }

  @override
  List<Object?> get props => [
        id,
        id,
        name,
        age,
        weight,
        imageUrl,
        description,
        adoptionFee,
        shelterId,
        species,
        gender,
        shortDescription,
      ];

  factory AnimalModel.fromJson(Map<String, dynamic> json) =>
      _$AnimalModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimalModelToJson(this);
}
