import 'dart:convert';

import 'package:flutter_company_listing/model/app_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'company_model.freezed.dart';
part 'company_model.g.dart';

List<CompanyModel> companyModelFromJson(String str) => List<CompanyModel>.from(
    json.decode(str).map((x) => CompanyModel.fromJson(x)));

@freezed
class CompanyModel with _$CompanyModel {
  const factory CompanyModel({
    required String name,
    required String website,
    @Default('') String jobUrl,
    @Default('') String linkedin,
    @Default('') String? logoUrl,
    List<AppModel>? apps,
  }) = _CompanyModel;

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);
}
