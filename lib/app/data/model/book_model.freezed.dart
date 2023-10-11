// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookModel _$BookModelFromJson(Map<String, dynamic> json) {
  return _BookModel.fromJson(json);
}

/// @nodoc
mixin _$BookModel {
  int? get index =>
      throw _privateConstructorUsedError; // sorting을 위한 index, auto increment
  String get uuid => throw _privateConstructorUsedError; // uuid 자동으로 부여
  String get title => throw _privateConstructorUsedError; // 책 제목
  String? get description => throw _privateConstructorUsedError; // 책 소개 글
  String? get bookImage =>
      throw _privateConstructorUsedError; // 책 이미지, 없을시 default image
  List<BookCreator>? get creators =>
      throw _privateConstructorUsedError; // 책 작가, 1명: ['BookCreator']
  List<String>? get tags => throw _privateConstructorUsedError; // 책 태그
  BookCategory get category =>
      throw _privateConstructorUsedError; // 카테고리, 반드시 1개
  String? get version =>
      throw _privateConstructorUsedError; // '1.38.72' : 1명, 38개 에피소드, 72번 수정
  List<BookEpisode>? get episodes =>
      throw _privateConstructorUsedError; // dpisode 가 없으면 default
  bool get isPrivate => throw _privateConstructorUsedError; // 책 공개 여부
  DateTime get createdAt => throw _privateConstructorUsedError; // 최초 생성일
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookModelCopyWith<BookModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookModelCopyWith<$Res> {
  factory $BookModelCopyWith(BookModel value, $Res Function(BookModel) then) =
      _$BookModelCopyWithImpl<$Res, BookModel>;
  @useResult
  $Res call(
      {int? index,
      String uuid,
      String title,
      String? description,
      String? bookImage,
      List<BookCreator>? creators,
      List<String>? tags,
      BookCategory category,
      String? version,
      List<BookEpisode>? episodes,
      bool isPrivate,
      DateTime createdAt,
      DateTime? updatedAt});

  $BookCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$BookModelCopyWithImpl<$Res, $Val extends BookModel>
    implements $BookModelCopyWith<$Res> {
  _$BookModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? uuid = null,
    Object? title = null,
    Object? description = freezed,
    Object? bookImage = freezed,
    Object? creators = freezed,
    Object? tags = freezed,
    Object? category = null,
    Object? version = freezed,
    Object? episodes = freezed,
    Object? isPrivate = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      bookImage: freezed == bookImage
          ? _value.bookImage
          : bookImage // ignore: cast_nullable_to_non_nullable
              as String?,
      creators: freezed == creators
          ? _value.creators
          : creators // ignore: cast_nullable_to_non_nullable
              as List<BookCreator>?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as BookCategory,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      episodes: freezed == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<BookEpisode>?,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookCategoryCopyWith<$Res> get category {
    return $BookCategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BookModelCopyWith<$Res> implements $BookModelCopyWith<$Res> {
  factory _$$_BookModelCopyWith(
          _$_BookModel value, $Res Function(_$_BookModel) then) =
      __$$_BookModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? index,
      String uuid,
      String title,
      String? description,
      String? bookImage,
      List<BookCreator>? creators,
      List<String>? tags,
      BookCategory category,
      String? version,
      List<BookEpisode>? episodes,
      bool isPrivate,
      DateTime createdAt,
      DateTime? updatedAt});

  @override
  $BookCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$_BookModelCopyWithImpl<$Res>
    extends _$BookModelCopyWithImpl<$Res, _$_BookModel>
    implements _$$_BookModelCopyWith<$Res> {
  __$$_BookModelCopyWithImpl(
      _$_BookModel _value, $Res Function(_$_BookModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? uuid = null,
    Object? title = null,
    Object? description = freezed,
    Object? bookImage = freezed,
    Object? creators = freezed,
    Object? tags = freezed,
    Object? category = null,
    Object? version = freezed,
    Object? episodes = freezed,
    Object? isPrivate = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_BookModel(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      bookImage: freezed == bookImage
          ? _value.bookImage
          : bookImage // ignore: cast_nullable_to_non_nullable
              as String?,
      creators: freezed == creators
          ? _value._creators
          : creators // ignore: cast_nullable_to_non_nullable
              as List<BookCreator>?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as BookCategory,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      episodes: freezed == episodes
          ? _value._episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<BookEpisode>?,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookModel implements _BookModel {
  _$_BookModel(
      {this.index,
      required this.uuid,
      required this.title,
      this.description,
      this.bookImage,
      final List<BookCreator>? creators,
      final List<String>? tags,
      required this.category,
      this.version,
      final List<BookEpisode>? episodes,
      required this.isPrivate,
      required this.createdAt,
      this.updatedAt})
      : _creators = creators,
        _tags = tags,
        _episodes = episodes;

  factory _$_BookModel.fromJson(Map<String, dynamic> json) =>
      _$$_BookModelFromJson(json);

  @override
  final int? index;
// sorting을 위한 index, auto increment
  @override
  final String uuid;
// uuid 자동으로 부여
  @override
  final String title;
// 책 제목
  @override
  final String? description;
// 책 소개 글
  @override
  final String? bookImage;
// 책 이미지, 없을시 default image
  final List<BookCreator>? _creators;
// 책 이미지, 없을시 default image
  @override
  List<BookCreator>? get creators {
    final value = _creators;
    if (value == null) return null;
    if (_creators is EqualUnmodifiableListView) return _creators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 책 작가, 1명: ['BookCreator']
  final List<String>? _tags;
// 책 작가, 1명: ['BookCreator']
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 책 태그
  @override
  final BookCategory category;
// 카테고리, 반드시 1개
  @override
  final String? version;
// '1.38.72' : 1명, 38개 에피소드, 72번 수정
  final List<BookEpisode>? _episodes;
// '1.38.72' : 1명, 38개 에피소드, 72번 수정
  @override
  List<BookEpisode>? get episodes {
    final value = _episodes;
    if (value == null) return null;
    if (_episodes is EqualUnmodifiableListView) return _episodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// dpisode 가 없으면 default
  @override
  final bool isPrivate;
// 책 공개 여부
  @override
  final DateTime createdAt;
// 최초 생성일
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'BookModel(index: $index, uuid: $uuid, title: $title, description: $description, bookImage: $bookImage, creators: $creators, tags: $tags, category: $category, version: $version, episodes: $episodes, isPrivate: $isPrivate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookModel &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bookImage, bookImage) ||
                other.bookImage == bookImage) &&
            const DeepCollectionEquality().equals(other._creators, _creators) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._episodes, _episodes) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      index,
      uuid,
      title,
      description,
      bookImage,
      const DeepCollectionEquality().hash(_creators),
      const DeepCollectionEquality().hash(_tags),
      category,
      version,
      const DeepCollectionEquality().hash(_episodes),
      isPrivate,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookModelCopyWith<_$_BookModel> get copyWith =>
      __$$_BookModelCopyWithImpl<_$_BookModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookModelToJson(
      this,
    );
  }
}

abstract class _BookModel implements BookModel {
  factory _BookModel(
      {final int? index,
      required final String uuid,
      required final String title,
      final String? description,
      final String? bookImage,
      final List<BookCreator>? creators,
      final List<String>? tags,
      required final BookCategory category,
      final String? version,
      final List<BookEpisode>? episodes,
      required final bool isPrivate,
      required final DateTime createdAt,
      final DateTime? updatedAt}) = _$_BookModel;

  factory _BookModel.fromJson(Map<String, dynamic> json) =
      _$_BookModel.fromJson;

  @override
  int? get index;
  @override // sorting을 위한 index, auto increment
  String get uuid;
  @override // uuid 자동으로 부여
  String get title;
  @override // 책 제목
  String? get description;
  @override // 책 소개 글
  String? get bookImage;
  @override // 책 이미지, 없을시 default image
  List<BookCreator>? get creators;
  @override // 책 작가, 1명: ['BookCreator']
  List<String>? get tags;
  @override // 책 태그
  BookCategory get category;
  @override // 카테고리, 반드시 1개
  String? get version;
  @override // '1.38.72' : 1명, 38개 에피소드, 72번 수정
  List<BookEpisode>? get episodes;
  @override // dpisode 가 없으면 default
  bool get isPrivate;
  @override // 책 공개 여부
  DateTime get createdAt;
  @override // 최초 생성일
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_BookModelCopyWith<_$_BookModel> get copyWith =>
      throw _privateConstructorUsedError;
}

BookCreator _$BookCreatorFromJson(Map<String, dynamic> json) {
  return _BookCreator.fromJson(json);
}

/// @nodoc
mixin _$BookCreator {
  UserModel get user => throw _privateConstructorUsedError; // 유저 모델로 판별
  bool get isOriginCreator => throw _privateConstructorUsedError; // 원작자인지 여부
  DateTime get createdAt => throw _privateConstructorUsedError; // JoinDate
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCreatorCopyWith<BookCreator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCreatorCopyWith<$Res> {
  factory $BookCreatorCopyWith(
          BookCreator value, $Res Function(BookCreator) then) =
      _$BookCreatorCopyWithImpl<$Res, BookCreator>;
  @useResult
  $Res call(
      {UserModel user,
      bool isOriginCreator,
      DateTime createdAt,
      DateTime? updatedAt});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$BookCreatorCopyWithImpl<$Res, $Val extends BookCreator>
    implements $BookCreatorCopyWith<$Res> {
  _$BookCreatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? isOriginCreator = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      isOriginCreator: null == isOriginCreator
          ? _value.isOriginCreator
          : isOriginCreator // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BookCreatorCopyWith<$Res>
    implements $BookCreatorCopyWith<$Res> {
  factory _$$_BookCreatorCopyWith(
          _$_BookCreator value, $Res Function(_$_BookCreator) then) =
      __$$_BookCreatorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserModel user,
      bool isOriginCreator,
      DateTime createdAt,
      DateTime? updatedAt});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$_BookCreatorCopyWithImpl<$Res>
    extends _$BookCreatorCopyWithImpl<$Res, _$_BookCreator>
    implements _$$_BookCreatorCopyWith<$Res> {
  __$$_BookCreatorCopyWithImpl(
      _$_BookCreator _value, $Res Function(_$_BookCreator) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? isOriginCreator = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_BookCreator(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      isOriginCreator: null == isOriginCreator
          ? _value.isOriginCreator
          : isOriginCreator // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookCreator implements _BookCreator {
  _$_BookCreator(
      {required this.user,
      required this.isOriginCreator,
      required this.createdAt,
      this.updatedAt});

  factory _$_BookCreator.fromJson(Map<String, dynamic> json) =>
      _$$_BookCreatorFromJson(json);

  @override
  final UserModel user;
// 유저 모델로 판별
  @override
  final bool isOriginCreator;
// 원작자인지 여부
  @override
  final DateTime createdAt;
// JoinDate
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'BookCreator(user: $user, isOriginCreator: $isOriginCreator, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookCreator &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isOriginCreator, isOriginCreator) ||
                other.isOriginCreator == isOriginCreator) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, user, isOriginCreator, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookCreatorCopyWith<_$_BookCreator> get copyWith =>
      __$$_BookCreatorCopyWithImpl<_$_BookCreator>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookCreatorToJson(
      this,
    );
  }
}

abstract class _BookCreator implements BookCreator {
  factory _BookCreator(
      {required final UserModel user,
      required final bool isOriginCreator,
      required final DateTime createdAt,
      final DateTime? updatedAt}) = _$_BookCreator;

  factory _BookCreator.fromJson(Map<String, dynamic> json) =
      _$_BookCreator.fromJson;

  @override
  UserModel get user;
  @override // 유저 모델로 판별
  bool get isOriginCreator;
  @override // 원작자인지 여부
  DateTime get createdAt;
  @override // JoinDate
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_BookCreatorCopyWith<_$_BookCreator> get copyWith =>
      throw _privateConstructorUsedError;
}

BookEpisode _$BookEpisodeFromJson(Map<String, dynamic> json) {
  return _BookEpisode.fromJson(json);
}

/// @nodoc
mixin _$BookEpisode {
  int? get index =>
      throw _privateConstructorUsedError; // 정렬을 위한 index, 없을 시 자동 부여
  String get title => throw _privateConstructorUsedError; // 에피소드 제목
  List<BookStory>? get stories =>
      throw _privateConstructorUsedError; // Story 가 없을 수도 있음
  bool get isPrivate => throw _privateConstructorUsedError; // 공개여부
  DateTime get createdAt => throw _privateConstructorUsedError; // 최초생성일
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookEpisodeCopyWith<BookEpisode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookEpisodeCopyWith<$Res> {
  factory $BookEpisodeCopyWith(
          BookEpisode value, $Res Function(BookEpisode) then) =
      _$BookEpisodeCopyWithImpl<$Res, BookEpisode>;
  @useResult
  $Res call(
      {int? index,
      String title,
      List<BookStory>? stories,
      bool isPrivate,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$BookEpisodeCopyWithImpl<$Res, $Val extends BookEpisode>
    implements $BookEpisodeCopyWith<$Res> {
  _$BookEpisodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? title = null,
    Object? stories = freezed,
    Object? isPrivate = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      stories: freezed == stories
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<BookStory>?,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookEpisodeCopyWith<$Res>
    implements $BookEpisodeCopyWith<$Res> {
  factory _$$_BookEpisodeCopyWith(
          _$_BookEpisode value, $Res Function(_$_BookEpisode) then) =
      __$$_BookEpisodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? index,
      String title,
      List<BookStory>? stories,
      bool isPrivate,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$_BookEpisodeCopyWithImpl<$Res>
    extends _$BookEpisodeCopyWithImpl<$Res, _$_BookEpisode>
    implements _$$_BookEpisodeCopyWith<$Res> {
  __$$_BookEpisodeCopyWithImpl(
      _$_BookEpisode _value, $Res Function(_$_BookEpisode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? title = null,
    Object? stories = freezed,
    Object? isPrivate = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_BookEpisode(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      stories: freezed == stories
          ? _value._stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<BookStory>?,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookEpisode implements _BookEpisode {
  _$_BookEpisode(
      {this.index,
      required this.title,
      final List<BookStory>? stories,
      required this.isPrivate,
      required this.createdAt,
      this.updatedAt})
      : _stories = stories;

  factory _$_BookEpisode.fromJson(Map<String, dynamic> json) =>
      _$$_BookEpisodeFromJson(json);

  @override
  final int? index;
// 정렬을 위한 index, 없을 시 자동 부여
  @override
  final String title;
// 에피소드 제목
  final List<BookStory>? _stories;
// 에피소드 제목
  @override
  List<BookStory>? get stories {
    final value = _stories;
    if (value == null) return null;
    if (_stories is EqualUnmodifiableListView) return _stories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Story 가 없을 수도 있음
  @override
  final bool isPrivate;
// 공개여부
  @override
  final DateTime createdAt;
// 최초생성일
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'BookEpisode(index: $index, title: $title, stories: $stories, isPrivate: $isPrivate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookEpisode &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._stories, _stories) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      index,
      title,
      const DeepCollectionEquality().hash(_stories),
      isPrivate,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookEpisodeCopyWith<_$_BookEpisode> get copyWith =>
      __$$_BookEpisodeCopyWithImpl<_$_BookEpisode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookEpisodeToJson(
      this,
    );
  }
}

abstract class _BookEpisode implements BookEpisode {
  factory _BookEpisode(
      {final int? index,
      required final String title,
      final List<BookStory>? stories,
      required final bool isPrivate,
      required final DateTime createdAt,
      final DateTime? updatedAt}) = _$_BookEpisode;

  factory _BookEpisode.fromJson(Map<String, dynamic> json) =
      _$_BookEpisode.fromJson;

  @override
  int? get index;
  @override // 정렬을 위한 index, 없을 시 자동 부여
  String get title;
  @override // 에피소드 제목
  List<BookStory>? get stories;
  @override // Story 가 없을 수도 있음
  bool get isPrivate;
  @override // 공개여부
  DateTime get createdAt;
  @override // 최초생성일
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_BookEpisodeCopyWith<_$_BookEpisode> get copyWith =>
      throw _privateConstructorUsedError;
}

BookStory _$BookStoryFromJson(Map<String, dynamic> json) {
  return _BookStory.fromJson(json);
}

/// @nodoc
mixin _$BookStory {
  int? get index =>
      throw _privateConstructorUsedError; // 정렬을 위한 index, 없을 시 자동 부여
  String get title => throw _privateConstructorUsedError; // 스토리 제목
  String get content => throw _privateConstructorUsedError; // 스토리 내용 (html로 변경)
  String? get imagePath =>
      throw _privateConstructorUsedError; // 내용에 포함될 이미지 (html로 변경 시 필요없음)
  bool get isPrivate => throw _privateConstructorUsedError; // 스토리 공개 여부
  DateTime get createdAt => throw _privateConstructorUsedError; // 최초 생성일
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookStoryCopyWith<BookStory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookStoryCopyWith<$Res> {
  factory $BookStoryCopyWith(BookStory value, $Res Function(BookStory) then) =
      _$BookStoryCopyWithImpl<$Res, BookStory>;
  @useResult
  $Res call(
      {int? index,
      String title,
      String content,
      String? imagePath,
      bool isPrivate,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$BookStoryCopyWithImpl<$Res, $Val extends BookStory>
    implements $BookStoryCopyWith<$Res> {
  _$BookStoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? title = null,
    Object? content = null,
    Object? imagePath = freezed,
    Object? isPrivate = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookStoryCopyWith<$Res> implements $BookStoryCopyWith<$Res> {
  factory _$$_BookStoryCopyWith(
          _$_BookStory value, $Res Function(_$_BookStory) then) =
      __$$_BookStoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? index,
      String title,
      String content,
      String? imagePath,
      bool isPrivate,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$_BookStoryCopyWithImpl<$Res>
    extends _$BookStoryCopyWithImpl<$Res, _$_BookStory>
    implements _$$_BookStoryCopyWith<$Res> {
  __$$_BookStoryCopyWithImpl(
      _$_BookStory _value, $Res Function(_$_BookStory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? title = null,
    Object? content = null,
    Object? imagePath = freezed,
    Object? isPrivate = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_BookStory(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookStory implements _BookStory {
  _$_BookStory(
      {this.index,
      required this.title,
      required this.content,
      this.imagePath,
      required this.isPrivate,
      required this.createdAt,
      this.updatedAt});

  factory _$_BookStory.fromJson(Map<String, dynamic> json) =>
      _$$_BookStoryFromJson(json);

  @override
  final int? index;
// 정렬을 위한 index, 없을 시 자동 부여
  @override
  final String title;
// 스토리 제목
  @override
  final String content;
// 스토리 내용 (html로 변경)
  @override
  final String? imagePath;
// 내용에 포함될 이미지 (html로 변경 시 필요없음)
  @override
  final bool isPrivate;
// 스토리 공개 여부
  @override
  final DateTime createdAt;
// 최초 생성일
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'BookStory(index: $index, title: $title, content: $content, imagePath: $imagePath, isPrivate: $isPrivate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookStory &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, title, content, imagePath,
      isPrivate, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookStoryCopyWith<_$_BookStory> get copyWith =>
      __$$_BookStoryCopyWithImpl<_$_BookStory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookStoryToJson(
      this,
    );
  }
}

abstract class _BookStory implements BookStory {
  factory _BookStory(
      {final int? index,
      required final String title,
      required final String content,
      final String? imagePath,
      required final bool isPrivate,
      required final DateTime createdAt,
      final DateTime? updatedAt}) = _$_BookStory;

  factory _BookStory.fromJson(Map<String, dynamic> json) =
      _$_BookStory.fromJson;

  @override
  int? get index;
  @override // 정렬을 위한 index, 없을 시 자동 부여
  String get title;
  @override // 스토리 제목
  String get content;
  @override // 스토리 내용 (html로 변경)
  String? get imagePath;
  @override // 내용에 포함될 이미지 (html로 변경 시 필요없음)
  bool get isPrivate;
  @override // 스토리 공개 여부
  DateTime get createdAt;
  @override // 최초 생성일
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_BookStoryCopyWith<_$_BookStory> get copyWith =>
      throw _privateConstructorUsedError;
}

BookCategory _$BookCategoryFromJson(Map<String, dynamic> json) {
  return _BookCategory.fromJson(json);
}

/// @nodoc
mixin _$BookCategory {
  int get index => throw _privateConstructorUsedError; // 카테고리 인덱스
  String get title => throw _privateConstructorUsedError; // 카테고리 타이틀
  DateTime get createdAt => throw _privateConstructorUsedError; // 카테고리 최초 생성일
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCategoryCopyWith<BookCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCategoryCopyWith<$Res> {
  factory $BookCategoryCopyWith(
          BookCategory value, $Res Function(BookCategory) then) =
      _$BookCategoryCopyWithImpl<$Res, BookCategory>;
  @useResult
  $Res call({int index, String title, DateTime createdAt, DateTime? updatedAt});
}

/// @nodoc
class _$BookCategoryCopyWithImpl<$Res, $Val extends BookCategory>
    implements $BookCategoryCopyWith<$Res> {
  _$BookCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? title = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookCategoryCopyWith<$Res>
    implements $BookCategoryCopyWith<$Res> {
  factory _$$_BookCategoryCopyWith(
          _$_BookCategory value, $Res Function(_$_BookCategory) then) =
      __$$_BookCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, String title, DateTime createdAt, DateTime? updatedAt});
}

/// @nodoc
class __$$_BookCategoryCopyWithImpl<$Res>
    extends _$BookCategoryCopyWithImpl<$Res, _$_BookCategory>
    implements _$$_BookCategoryCopyWith<$Res> {
  __$$_BookCategoryCopyWithImpl(
      _$_BookCategory _value, $Res Function(_$_BookCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? title = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_BookCategory(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookCategory implements _BookCategory {
  _$_BookCategory(
      {required this.index,
      required this.title,
      required this.createdAt,
      this.updatedAt});

  factory _$_BookCategory.fromJson(Map<String, dynamic> json) =>
      _$$_BookCategoryFromJson(json);

  @override
  final int index;
// 카테고리 인덱스
  @override
  final String title;
// 카테고리 타이틀
  @override
  final DateTime createdAt;
// 카테고리 최초 생성일
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'BookCategory(index: $index, title: $title, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookCategory &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, index, title, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookCategoryCopyWith<_$_BookCategory> get copyWith =>
      __$$_BookCategoryCopyWithImpl<_$_BookCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookCategoryToJson(
      this,
    );
  }
}

abstract class _BookCategory implements BookCategory {
  factory _BookCategory(
      {required final int index,
      required final String title,
      required final DateTime createdAt,
      final DateTime? updatedAt}) = _$_BookCategory;

  factory _BookCategory.fromJson(Map<String, dynamic> json) =
      _$_BookCategory.fromJson;

  @override
  int get index;
  @override // 카테고리 인덱스
  String get title;
  @override // 카테고리 타이틀
  DateTime get createdAt;
  @override // 카테고리 최초 생성일
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_BookCategoryCopyWith<_$_BookCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
