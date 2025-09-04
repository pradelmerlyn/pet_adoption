import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agreement_model.g.dart';

@JsonSerializable()
class AgreementModel extends Equatable {
  @JsonKey(name: 'long_term_commitment')
  final String? longTermCommitment;

  @JsonKey(name: 'meet_and_greet')
  final String? meetAndGreet;

  @JsonKey(name: 'is_certify')
  final bool? isCertify;


  const AgreementModel({
    this.longTermCommitment,
    this.meetAndGreet,
    this.isCertify,
  });


  AgreementModel copyWith({
    String? longTermCommitment,
    String? meetAndGreet,
    bool? isCertify,
  }) {
    return AgreementModel(
      longTermCommitment: longTermCommitment ?? this.longTermCommitment,
      meetAndGreet: meetAndGreet ?? this.meetAndGreet,
      isCertify: isCertify ?? this.isCertify
    );
  }

  @override
  List<Object?> get props => [
        longTermCommitment,
        meetAndGreet,
        isCertify
      ];

  factory AgreementModel.fromJson(Map<String, dynamic> json) =>
      _$AgreementModelFromJson(json);

  Map<String, dynamic> toJson() => _$AgreementModelToJson(this);
}
