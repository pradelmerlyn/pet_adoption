// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agreement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgreementModel _$AgreementModelFromJson(Map<String, dynamic> json) =>
    AgreementModel(
      longTermCommitment: json['long_term_commitment'] as String?,
      meetAndGreet: json['meet_and_greet'] as String?,
      isCertify: json['is_certify'] as bool?,
    );

Map<String, dynamic> _$AgreementModelToJson(AgreementModel instance) =>
    <String, dynamic>{
      'long_term_commitment': instance.longTermCommitment,
      'meet_and_greet': instance.meetAndGreet,
      'is_certify': instance.isCertify,
    };
