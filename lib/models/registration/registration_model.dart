import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'registration_model.g.dart';

@JsonSerializable()
class RegistrationModel extends Equatable {
  @JsonKey(name: 'fullname')
  final String? fullname;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'password')
  final String? password;


  const RegistrationModel({
    this.fullname,
    this.email,
    this.password,
  });

  RegistrationModel copyWith({
    String? fullname,
    String? email,
    String? password,
  }) {
    return RegistrationModel(
        fullname: fullname ?? this.fullname,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  @override
  List<Object?> get props => [fullname, email, password];

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationModelToJson(this);
}
