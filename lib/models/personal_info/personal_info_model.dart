import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'personal_info_model.g.dart';

@JsonSerializable()
class PersonalInfoModel extends Equatable {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'occupation')
  final String? occupation;

  @JsonKey(name: 'birthday')
  final String? birthday;

  @JsonKey(name: 'address')
  final String? address;

  @JsonKey(name: 'gender')
  final String? gender;

  const PersonalInfoModel({
    this.name,
    this.email,
    this.phone,
    this.occupation,
    this.birthday,
    this.address,
    this.gender,
  });

  PersonalInfoModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? occupation,
    String? birthday,
    String? address,
    String? gender,
  }) {
    return PersonalInfoModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      occupation: occupation ?? this.occupation,
      birthday: birthday ?? this.birthday,
      address: address ?? this.address,
      gender: gender ?? this.gender,
    );
  }

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        occupation,
        birthday,
        address,
        gender,
      ];

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoModelToJson(this);
}
