// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appstore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppStoreModel _$_$_AppStoreModelFromJson(Map json) {
  return _$_AppStoreModel(
    artworkUrl100: json['artworkUrl100'] as String,
    description: json['description'] as String,
    screenshotUrls: (json['screenshotUrls'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$_$_AppStoreModelToJson(_$_AppStoreModel instance) =>
    <String, dynamic>{
      'artworkUrl100': instance.artworkUrl100,
      'description': instance.description,
      'screenshotUrls': instance.screenshotUrls,
    };
