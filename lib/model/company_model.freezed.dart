// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'company_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) {
  return _CompanyModel.fromJson(json);
}

/// @nodoc
class _$CompanyModelTearOff {
  const _$CompanyModelTearOff();

  _CompanyModel call(
      {required String name,
      required String website,
      String jobUrl = '',
      String linkedin = '',
      String? logoUrl = '',
      List<AppModel>? apps}) {
    return _CompanyModel(
      name: name,
      website: website,
      jobUrl: jobUrl,
      linkedin: linkedin,
      logoUrl: logoUrl,
      apps: apps,
    );
  }

  CompanyModel fromJson(Map<String, Object> json) {
    return CompanyModel.fromJson(json);
  }
}

/// @nodoc
const $CompanyModel = _$CompanyModelTearOff();

/// @nodoc
mixin _$CompanyModel {
  String get name => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;
  String get jobUrl => throw _privateConstructorUsedError;
  String get linkedin => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  List<AppModel>? get apps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyModelCopyWith<CompanyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyModelCopyWith<$Res> {
  factory $CompanyModelCopyWith(
          CompanyModel value, $Res Function(CompanyModel) then) =
      _$CompanyModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String website,
      String jobUrl,
      String linkedin,
      String? logoUrl,
      List<AppModel>? apps});
}

/// @nodoc
class _$CompanyModelCopyWithImpl<$Res> implements $CompanyModelCopyWith<$Res> {
  _$CompanyModelCopyWithImpl(this._value, this._then);

  final CompanyModel _value;
  // ignore: unused_field
  final $Res Function(CompanyModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? website = freezed,
    Object? jobUrl = freezed,
    Object? linkedin = freezed,
    Object? logoUrl = freezed,
    Object? apps = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      jobUrl: jobUrl == freezed
          ? _value.jobUrl
          : jobUrl // ignore: cast_nullable_to_non_nullable
              as String,
      linkedin: linkedin == freezed
          ? _value.linkedin
          : linkedin // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: logoUrl == freezed
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      apps: apps == freezed
          ? _value.apps
          : apps // ignore: cast_nullable_to_non_nullable
              as List<AppModel>?,
    ));
  }
}

/// @nodoc
abstract class _$CompanyModelCopyWith<$Res>
    implements $CompanyModelCopyWith<$Res> {
  factory _$CompanyModelCopyWith(
          _CompanyModel value, $Res Function(_CompanyModel) then) =
      __$CompanyModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String website,
      String jobUrl,
      String linkedin,
      String? logoUrl,
      List<AppModel>? apps});
}

/// @nodoc
class __$CompanyModelCopyWithImpl<$Res> extends _$CompanyModelCopyWithImpl<$Res>
    implements _$CompanyModelCopyWith<$Res> {
  __$CompanyModelCopyWithImpl(
      _CompanyModel _value, $Res Function(_CompanyModel) _then)
      : super(_value, (v) => _then(v as _CompanyModel));

  @override
  _CompanyModel get _value => super._value as _CompanyModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? website = freezed,
    Object? jobUrl = freezed,
    Object? linkedin = freezed,
    Object? logoUrl = freezed,
    Object? apps = freezed,
  }) {
    return _then(_CompanyModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      jobUrl: jobUrl == freezed
          ? _value.jobUrl
          : jobUrl // ignore: cast_nullable_to_non_nullable
              as String,
      linkedin: linkedin == freezed
          ? _value.linkedin
          : linkedin // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: logoUrl == freezed
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      apps: apps == freezed
          ? _value.apps
          : apps // ignore: cast_nullable_to_non_nullable
              as List<AppModel>?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CompanyModel implements _CompanyModel {
  const _$_CompanyModel(
      {required this.name,
      required this.website,
      this.jobUrl = '',
      this.linkedin = '',
      this.logoUrl = '',
      this.apps});

  factory _$_CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CompanyModelFromJson(json);

  @override
  final String name;
  @override
  final String website;
  @JsonKey(defaultValue: '')
  @override
  final String jobUrl;
  @JsonKey(defaultValue: '')
  @override
  final String linkedin;
  @JsonKey(defaultValue: '')
  @override
  final String? logoUrl;
  @override
  final List<AppModel>? apps;

  @override
  String toString() {
    return 'CompanyModel(name: $name, website: $website, jobUrl: $jobUrl, linkedin: $linkedin, logoUrl: $logoUrl, apps: $apps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CompanyModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.website, website) ||
                const DeepCollectionEquality()
                    .equals(other.website, website)) &&
            (identical(other.jobUrl, jobUrl) ||
                const DeepCollectionEquality().equals(other.jobUrl, jobUrl)) &&
            (identical(other.linkedin, linkedin) ||
                const DeepCollectionEquality()
                    .equals(other.linkedin, linkedin)) &&
            (identical(other.logoUrl, logoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.logoUrl, logoUrl)) &&
            (identical(other.apps, apps) ||
                const DeepCollectionEquality().equals(other.apps, apps)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(website) ^
      const DeepCollectionEquality().hash(jobUrl) ^
      const DeepCollectionEquality().hash(linkedin) ^
      const DeepCollectionEquality().hash(logoUrl) ^
      const DeepCollectionEquality().hash(apps);

  @JsonKey(ignore: true)
  @override
  _$CompanyModelCopyWith<_CompanyModel> get copyWith =>
      __$CompanyModelCopyWithImpl<_CompanyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CompanyModelToJson(this);
  }
}

abstract class _CompanyModel implements CompanyModel {
  const factory _CompanyModel(
      {required String name,
      required String website,
      String jobUrl,
      String linkedin,
      String? logoUrl,
      List<AppModel>? apps}) = _$_CompanyModel;

  factory _CompanyModel.fromJson(Map<String, dynamic> json) =
      _$_CompanyModel.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get website => throw _privateConstructorUsedError;
  @override
  String get jobUrl => throw _privateConstructorUsedError;
  @override
  String get linkedin => throw _privateConstructorUsedError;
  @override
  String? get logoUrl => throw _privateConstructorUsedError;
  @override
  List<AppModel>? get apps => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CompanyModelCopyWith<_CompanyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
