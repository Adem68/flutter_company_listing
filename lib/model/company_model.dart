import 'dart:convert';

List<CompanyModel> companyModelFromJson(String str) => List<CompanyModel>.from(
    json.decode(str).map((x) => CompanyModel.fromJson(x)));

class CompanyModel {
  CompanyModel({
    required this.name,
    required this.website,
    required this.jobUrl,
    required this.linkedin,
  });

  CompanyModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    website = json['website'];
    jobUrl = json['jobUrl'];
    linkedin = json['linkedin'];
  }

  late String name;
  late String website;
  late String jobUrl;
  late String linkedin;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['website'] = website;
    data['jobUrl'] = jobUrl;
    data['alternateJobUrl'] = linkedin;
    return data;
  }
}
