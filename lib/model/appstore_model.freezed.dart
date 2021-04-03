// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'appstore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppStoreModel _$AppStoreModelFromJson(Map<String, dynamic> json) {
  return _AppStoreModel.fromJson(json);
}

/// @nodoc
class _$AppStoreModelTearOff {
  const _$AppStoreModelTearOff();

  _AppStoreModel call(
      {required String artworkUrl100,
      required String description,
      required List<String> screenshotUrls}) {
    return _AppStoreModel(
      artworkUrl100: artworkUrl100,
      description: description,
      screenshotUrls: screenshotUrls,
    );
  }

  AppStoreModel fromJson(Map<String, Object> json) {
    return AppStoreModel.fromJson(json);
  }
}

/// @nodoc
const $AppStoreModel = _$AppStoreModelTearOff();

/// @nodoc
mixin _$AppStoreModel {
  String get artworkUrl100 => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get screenshotUrls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppStoreModelCopyWith<AppStoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStoreModelCopyWith<$Res> {
  factory $AppStoreModelCopyWith(
          AppStoreModel value, $Res Function(AppStoreModel) then) =
      _$AppStoreModelCopyWithImpl<$Res>;
  $Res call(
      {String artworkUrl100, String description, List<String> screenshotUrls});
}

/// @nodoc
class _$AppStoreModelCopyWithImpl<$Res>
    implements $AppStoreModelCopyWith<$Res> {
  _$AppStoreModelCopyWithImpl(this._value, this._then);

  final AppStoreModel _value;
  // ignore: unused_field
  final $Res Function(AppStoreModel) _then;

  @override
  $Res call({
    Object? artworkUrl100 = freezed,
    Object? description = freezed,
    Object? screenshotUrls = freezed,
  }) {
    return _then(_value.copyWith(
      artworkUrl100: artworkUrl100 == freezed
          ? _value.artworkUrl100
          : artworkUrl100 // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      screenshotUrls: screenshotUrls == freezed
          ? _value.screenshotUrls
          : screenshotUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$AppStoreModelCopyWith<$Res>
    implements $AppStoreModelCopyWith<$Res> {
  factory _$AppStoreModelCopyWith(
          _AppStoreModel value, $Res Function(_AppStoreModel) then) =
      __$AppStoreModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String artworkUrl100, String description, List<String> screenshotUrls});
}

/// @nodoc
class __$AppStoreModelCopyWithImpl<$Res>
    extends _$AppStoreModelCopyWithImpl<$Res>
    implements _$AppStoreModelCopyWith<$Res> {
  __$AppStoreModelCopyWithImpl(
      _AppStoreModel _value, $Res Function(_AppStoreModel) _then)
      : super(_value, (v) => _then(v as _AppStoreModel));

  @override
  _AppStoreModel get _value => super._value as _AppStoreModel;

  @override
  $Res call({
    Object? artworkUrl100 = freezed,
    Object? description = freezed,
    Object? screenshotUrls = freezed,
  }) {
    return _then(_AppStoreModel(
      artworkUrl100: artworkUrl100 == freezed
          ? _value.artworkUrl100
          : artworkUrl100 // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      screenshotUrls: screenshotUrls == freezed
          ? _value.screenshotUrls
          : screenshotUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AppStoreModel implements _AppStoreModel {
  const _$_AppStoreModel(
      {required this.artworkUrl100,
      required this.description,
      required this.screenshotUrls});

  factory _$_AppStoreModel.fromJson(Map<String, dynamic> json) =>
      _$_$_AppStoreModelFromJson(json);

  @override
  final String artworkUrl100;
  @override
  final String description;
  @override
  final List<String> screenshotUrls;

  @override
  String toString() {
    return 'AppStoreModel(artworkUrl100: $artworkUrl100, description: $description, screenshotUrls: $screenshotUrls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppStoreModel &&
            (identical(other.artworkUrl100, artworkUrl100) ||
                const DeepCollectionEquality()
                    .equals(other.artworkUrl100, artworkUrl100)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.screenshotUrls, screenshotUrls) ||
                const DeepCollectionEquality()
                    .equals(other.screenshotUrls, screenshotUrls)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(artworkUrl100) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(screenshotUrls);

  @JsonKey(ignore: true)
  @override
  _$AppStoreModelCopyWith<_AppStoreModel> get copyWith =>
      __$AppStoreModelCopyWithImpl<_AppStoreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppStoreModelToJson(this);
  }
}

abstract class _AppStoreModel implements AppStoreModel {
  const factory _AppStoreModel(
      {required String artworkUrl100,
      required String description,
      required List<String> screenshotUrls}) = _$_AppStoreModel;

  factory _AppStoreModel.fromJson(Map<String, dynamic> json) =
      _$_AppStoreModel.fromJson;

  @override
  String get artworkUrl100 => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  List<String> get screenshotUrls => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppStoreModelCopyWith<_AppStoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}
