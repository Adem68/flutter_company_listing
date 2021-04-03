import 'package:freezed_annotation/freezed_annotation.dart';
part 'appstore_model.freezed.dart';
part 'appstore_model.g.dart';

@freezed
class AppStoreModel with _$AppStoreModel {
  const factory AppStoreModel({
    required String artworkUrl100,
    required String description,
    required List<String> screenshotUrls,
  }) = _AppStoreModel;

  factory AppStoreModel.fromJson(Map<String, dynamic> json) =>
      _$AppStoreModelFromJson(json);
}
