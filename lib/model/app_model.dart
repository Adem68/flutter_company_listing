import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_model.freezed.dart';
part 'app_model.g.dart';

@freezed
class AppModel with _$AppModel {
  const factory AppModel({
    required String name,
    @Default('') String? description,
    @Default('') String? imageUrl,
    @Default('') String? playStore,
    @Default('') String? appStore,
    @Default([]) List<String>? screenshots,
  }) = _AppModel;

  factory AppModel.fromJson(Map<String, dynamic> json) =>
      _$AppModelFromJson(json);
}
