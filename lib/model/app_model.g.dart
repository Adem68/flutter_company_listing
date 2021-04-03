// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppModel _$_$_AppModelFromJson(Map json) {
  return _$_AppModel(
    name: json['name'] as String,
    website: json['website'] as String? ?? '',
    description: json['description'] as String? ?? '',
    imageUrl: json['imageUrl'] as String? ?? '',
    playStore: json['playStore'] as String? ?? '',
    appStore: json['appStore'] as String? ?? '',
    screenshots: (json['screenshots'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_AppModelToJson(_$_AppModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'website': instance.website,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'playStore': instance.playStore,
      'appStore': instance.appStore,
      'screenshots': instance.screenshots,
    };
