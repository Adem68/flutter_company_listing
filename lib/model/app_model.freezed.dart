// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppModel _$AppModelFromJson(Map<String, dynamic> json) {
  return _AppModel.fromJson(json);
}

/// @nodoc
class _$AppModelTearOff {
  const _$AppModelTearOff();

  _AppModel call(
      {required String name,
      String? description = '',
      String? imageUrl = '',
      String? playStore = '',
      String? appStore = '',
      List<String>? screenshots = const []}) {
    return _AppModel(
      name: name,
      description: description,
      imageUrl: imageUrl,
      playStore: playStore,
      appStore: appStore,
      screenshots: screenshots,
    );
  }

  AppModel fromJson(Map<String, Object> json) {
    return AppModel.fromJson(json);
  }
}

/// @nodoc
const $AppModel = _$AppModelTearOff();

/// @nodoc
mixin _$AppModel {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get playStore => throw _privateConstructorUsedError;
  String? get appStore => throw _privateConstructorUsedError;
  List<String>? get screenshots => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppModelCopyWith<AppModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppModelCopyWith<$Res> {
  factory $AppModelCopyWith(AppModel value, $Res Function(AppModel) then) =
      _$AppModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String? description,
      String? imageUrl,
      String? playStore,
      String? appStore,
      List<String>? screenshots});
}

/// @nodoc
class _$AppModelCopyWithImpl<$Res> implements $AppModelCopyWith<$Res> {
  _$AppModelCopyWithImpl(this._value, this._then);

  final AppModel _value;
  // ignore: unused_field
  final $Res Function(AppModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? playStore = freezed,
    Object? appStore = freezed,
    Object? screenshots = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      playStore: playStore == freezed
          ? _value.playStore
          : playStore // ignore: cast_nullable_to_non_nullable
              as String?,
      appStore: appStore == freezed
          ? _value.appStore
          : appStore // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshots: screenshots == freezed
          ? _value.screenshots
          : screenshots // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$AppModelCopyWith<$Res> implements $AppModelCopyWith<$Res> {
  factory _$AppModelCopyWith(_AppModel value, $Res Function(_AppModel) then) =
      __$AppModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String? description,
      String? imageUrl,
      String? playStore,
      String? appStore,
      List<String>? screenshots});
}

/// @nodoc
class __$AppModelCopyWithImpl<$Res> extends _$AppModelCopyWithImpl<$Res>
    implements _$AppModelCopyWith<$Res> {
  __$AppModelCopyWithImpl(_AppModel _value, $Res Function(_AppModel) _then)
      : super(_value, (v) => _then(v as _AppModel));

  @override
  _AppModel get _value => super._value as _AppModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? playStore = freezed,
    Object? appStore = freezed,
    Object? screenshots = freezed,
  }) {
    return _then(_AppModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      playStore: playStore == freezed
          ? _value.playStore
          : playStore // ignore: cast_nullable_to_non_nullable
              as String?,
      appStore: appStore == freezed
          ? _value.appStore
          : appStore // ignore: cast_nullable_to_non_nullable
              as String?,
      screenshots: screenshots == freezed
          ? _value.screenshots
          : screenshots // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AppModel implements _AppModel {
  const _$_AppModel(
      {required this.name,
      this.description = '',
      this.imageUrl = '',
      this.playStore = '',
      this.appStore = '',
      this.screenshots = const []});

  factory _$_AppModel.fromJson(Map<String, dynamic> json) =>
      _$_$_AppModelFromJson(json);

  @override
  final String name;
  @JsonKey(defaultValue: '')
  @override
  final String? description;
  @JsonKey(defaultValue: '')
  @override
  final String? imageUrl;
  @JsonKey(defaultValue: '')
  @override
  final String? playStore;
  @JsonKey(defaultValue: '')
  @override
  final String? appStore;
  @JsonKey(defaultValue: const [])
  @override
  final List<String>? screenshots;

  @override
  String toString() {
    return 'AppModel(name: $name, description: $description, imageUrl: $imageUrl, playStore: $playStore, appStore: $appStore, screenshots: $screenshots)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.playStore, playStore) ||
                const DeepCollectionEquality()
                    .equals(other.playStore, playStore)) &&
            (identical(other.appStore, appStore) ||
                const DeepCollectionEquality()
                    .equals(other.appStore, appStore)) &&
            (identical(other.screenshots, screenshots) ||
                const DeepCollectionEquality()
                    .equals(other.screenshots, screenshots)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(playStore) ^
      const DeepCollectionEquality().hash(appStore) ^
      const DeepCollectionEquality().hash(screenshots);

  @JsonKey(ignore: true)
  @override
  _$AppModelCopyWith<_AppModel> get copyWith =>
      __$AppModelCopyWithImpl<_AppModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppModelToJson(this);
  }
}

abstract class _AppModel implements AppModel {
  const factory _AppModel(
      {required String name,
      String? description,
      String? imageUrl,
      String? playStore,
      String? appStore,
      List<String>? screenshots}) = _$_AppModel;

  factory _AppModel.fromJson(Map<String, dynamic> json) = _$_AppModel.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  String? get playStore => throw _privateConstructorUsedError;
  @override
  String? get appStore => throw _privateConstructorUsedError;
  @override
  List<String>? get screenshots => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppModelCopyWith<_AppModel> get copyWith =>
      throw _privateConstructorUsedError;
}
