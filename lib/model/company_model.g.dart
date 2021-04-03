// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompanyModel _$_$_CompanyModelFromJson(Map json) {
  return _$_CompanyModel(
    name: json['name'] as String,
    website: json['website'] as String,
    jobUrl: json['jobUrl'] as String? ?? '',
    linkedin: json['linkedin'] as String? ?? '',
    logoUrl: json['logoUrl'] as String? ?? '',
    apps: (json['apps'] as List<dynamic>?)
        ?.map((e) => AppModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList(),
  );
}

Map<String, dynamic> _$_$_CompanyModelToJson(_$_CompanyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'website': instance.website,
      'jobUrl': instance.jobUrl,
      'linkedin': instance.linkedin,
      'logoUrl': instance.logoUrl,
      'apps': instance.apps?.map((e) => e.toJson()).toList(),
    };
