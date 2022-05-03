// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Schedule extends DataClass implements Insertable<Schedule> {
  final int id;
  final String content;
  final DateTime date;
  final int startTime;
  final int endTime;
  final int colorId;
  final int cateId;
  final DateTime createAt;
  Schedule(
      {required this.id,
      required this.content,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.colorId,
      required this.cateId,
      required this.createAt});
  factory Schedule.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Schedule(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      startTime: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}start_time'])!,
      endTime: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}end_time'])!,
      colorId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}color_id'])!,
      cateId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cate_id'])!,
      createAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}create_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content'] = Variable<String>(content);
    map['date'] = Variable<DateTime>(date);
    map['start_time'] = Variable<int>(startTime);
    map['end_time'] = Variable<int>(endTime);
    map['color_id'] = Variable<int>(colorId);
    map['cate_id'] = Variable<int>(cateId);
    map['create_at'] = Variable<DateTime>(createAt);
    return map;
  }

  SchedulesCompanion toCompanion(bool nullToAbsent) {
    return SchedulesCompanion(
      id: Value(id),
      content: Value(content),
      date: Value(date),
      startTime: Value(startTime),
      endTime: Value(endTime),
      colorId: Value(colorId),
      cateId: Value(cateId),
      createAt: Value(createAt),
    );
  }

  factory Schedule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Schedule(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      date: serializer.fromJson<DateTime>(json['date']),
      startTime: serializer.fromJson<int>(json['startTime']),
      endTime: serializer.fromJson<int>(json['endTime']),
      colorId: serializer.fromJson<int>(json['colorId']),
      cateId: serializer.fromJson<int>(json['cateId']),
      createAt: serializer.fromJson<DateTime>(json['createAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
      'date': serializer.toJson<DateTime>(date),
      'startTime': serializer.toJson<int>(startTime),
      'endTime': serializer.toJson<int>(endTime),
      'colorId': serializer.toJson<int>(colorId),
      'cateId': serializer.toJson<int>(cateId),
      'createAt': serializer.toJson<DateTime>(createAt),
    };
  }

  Schedule copyWith(
          {int? id,
          String? content,
          DateTime? date,
          int? startTime,
          int? endTime,
          int? colorId,
          int? cateId,
          DateTime? createAt}) =>
      Schedule(
        id: id ?? this.id,
        content: content ?? this.content,
        date: date ?? this.date,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        colorId: colorId ?? this.colorId,
        cateId: cateId ?? this.cateId,
        createAt: createAt ?? this.createAt,
      );
  @override
  String toString() {
    return (StringBuffer('Schedule(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('colorId: $colorId, ')
          ..write('cateId: $cateId, ')
          ..write('createAt: $createAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, content, date, startTime, endTime, colorId, cateId, createAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Schedule &&
          other.id == this.id &&
          other.content == this.content &&
          other.date == this.date &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.colorId == this.colorId &&
          other.cateId == this.cateId &&
          other.createAt == this.createAt);
}

class SchedulesCompanion extends UpdateCompanion<Schedule> {
  final Value<int> id;
  final Value<String> content;
  final Value<DateTime> date;
  final Value<int> startTime;
  final Value<int> endTime;
  final Value<int> colorId;
  final Value<int> cateId;
  final Value<DateTime> createAt;
  const SchedulesCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.date = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.colorId = const Value.absent(),
    this.cateId = const Value.absent(),
    this.createAt = const Value.absent(),
  });
  SchedulesCompanion.insert({
    this.id = const Value.absent(),
    required String content,
    required DateTime date,
    required int startTime,
    required int endTime,
    required int colorId,
    required int cateId,
    this.createAt = const Value.absent(),
  })  : content = Value(content),
        date = Value(date),
        startTime = Value(startTime),
        endTime = Value(endTime),
        colorId = Value(colorId),
        cateId = Value(cateId);
  static Insertable<Schedule> custom({
    Expression<int>? id,
    Expression<String>? content,
    Expression<DateTime>? date,
    Expression<int>? startTime,
    Expression<int>? endTime,
    Expression<int>? colorId,
    Expression<int>? cateId,
    Expression<DateTime>? createAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (date != null) 'date': date,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (colorId != null) 'color_id': colorId,
      if (cateId != null) 'cate_id': cateId,
      if (createAt != null) 'create_at': createAt,
    });
  }

  SchedulesCompanion copyWith(
      {Value<int>? id,
      Value<String>? content,
      Value<DateTime>? date,
      Value<int>? startTime,
      Value<int>? endTime,
      Value<int>? colorId,
      Value<int>? cateId,
      Value<DateTime>? createAt}) {
    return SchedulesCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      colorId: colorId ?? this.colorId,
      cateId: cateId ?? this.cateId,
      createAt: createAt ?? this.createAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    if (colorId.present) {
      map['color_id'] = Variable<int>(colorId.value);
    }
    if (cateId.present) {
      map['cate_id'] = Variable<int>(cateId.value);
    }
    if (createAt.present) {
      map['create_at'] = Variable<DateTime>(createAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchedulesCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('colorId: $colorId, ')
          ..write('cateId: $cateId, ')
          ..write('createAt: $createAt')
          ..write(')'))
        .toString();
  }
}

class $SchedulesTable extends Schedules
    with TableInfo<$SchedulesTable, Schedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchedulesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _startTimeMeta = const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<int?> startTime = GeneratedColumn<int?>(
      'start_time', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _endTimeMeta = const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<int?> endTime = GeneratedColumn<int?>(
      'end_time', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _colorIdMeta = const VerificationMeta('colorId');
  @override
  late final GeneratedColumn<int?> colorId = GeneratedColumn<int?>(
      'color_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _cateIdMeta = const VerificationMeta('cateId');
  @override
  late final GeneratedColumn<int?> cateId = GeneratedColumn<int?>(
      'cate_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _createAtMeta = const VerificationMeta('createAt');
  @override
  late final GeneratedColumn<DateTime?> createAt = GeneratedColumn<DateTime?>(
      'create_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns =>
      [id, content, date, startTime, endTime, colorId, cateId, createAt];
  @override
  String get aliasedName => _alias ?? 'schedules';
  @override
  String get actualTableName => 'schedules';
  @override
  VerificationContext validateIntegrity(Insertable<Schedule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('color_id')) {
      context.handle(_colorIdMeta,
          colorId.isAcceptableOrUnknown(data['color_id']!, _colorIdMeta));
    } else if (isInserting) {
      context.missing(_colorIdMeta);
    }
    if (data.containsKey('cate_id')) {
      context.handle(_cateIdMeta,
          cateId.isAcceptableOrUnknown(data['cate_id']!, _cateIdMeta));
    } else if (isInserting) {
      context.missing(_cateIdMeta);
    }
    if (data.containsKey('create_at')) {
      context.handle(_createAtMeta,
          createAt.isAcceptableOrUnknown(data['create_at']!, _createAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Schedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Schedule.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SchedulesTable createAlias(String alias) {
    return $SchedulesTable(attachedDatabase, alias);
  }
}

class CategoryColor extends DataClass implements Insertable<CategoryColor> {
  final int colorId;
  final String hexCode;
  CategoryColor({required this.colorId, required this.hexCode});
  factory CategoryColor.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CategoryColor(
      colorId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}color_id'])!,
      hexCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hex_code'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['color_id'] = Variable<int>(colorId);
    map['hex_code'] = Variable<String>(hexCode);
    return map;
  }

  CategoryColorsCompanion toCompanion(bool nullToAbsent) {
    return CategoryColorsCompanion(
      colorId: Value(colorId),
      hexCode: Value(hexCode),
    );
  }

  factory CategoryColor.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryColor(
      colorId: serializer.fromJson<int>(json['colorId']),
      hexCode: serializer.fromJson<String>(json['hexCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'colorId': serializer.toJson<int>(colorId),
      'hexCode': serializer.toJson<String>(hexCode),
    };
  }

  CategoryColor copyWith({int? colorId, String? hexCode}) => CategoryColor(
        colorId: colorId ?? this.colorId,
        hexCode: hexCode ?? this.hexCode,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryColor(')
          ..write('colorId: $colorId, ')
          ..write('hexCode: $hexCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(colorId, hexCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryColor &&
          other.colorId == this.colorId &&
          other.hexCode == this.hexCode);
}

class CategoryColorsCompanion extends UpdateCompanion<CategoryColor> {
  final Value<int> colorId;
  final Value<String> hexCode;
  const CategoryColorsCompanion({
    this.colorId = const Value.absent(),
    this.hexCode = const Value.absent(),
  });
  CategoryColorsCompanion.insert({
    this.colorId = const Value.absent(),
    required String hexCode,
  }) : hexCode = Value(hexCode);
  static Insertable<CategoryColor> custom({
    Expression<int>? colorId,
    Expression<String>? hexCode,
  }) {
    return RawValuesInsertable({
      if (colorId != null) 'color_id': colorId,
      if (hexCode != null) 'hex_code': hexCode,
    });
  }

  CategoryColorsCompanion copyWith(
      {Value<int>? colorId, Value<String>? hexCode}) {
    return CategoryColorsCompanion(
      colorId: colorId ?? this.colorId,
      hexCode: hexCode ?? this.hexCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (colorId.present) {
      map['color_id'] = Variable<int>(colorId.value);
    }
    if (hexCode.present) {
      map['hex_code'] = Variable<String>(hexCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryColorsCompanion(')
          ..write('colorId: $colorId, ')
          ..write('hexCode: $hexCode')
          ..write(')'))
        .toString();
  }
}

class $CategoryColorsTable extends CategoryColors
    with TableInfo<$CategoryColorsTable, CategoryColor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryColorsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _colorIdMeta = const VerificationMeta('colorId');
  @override
  late final GeneratedColumn<int?> colorId = GeneratedColumn<int?>(
      'color_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _hexCodeMeta = const VerificationMeta('hexCode');
  @override
  late final GeneratedColumn<String?> hexCode = GeneratedColumn<String?>(
      'hex_code', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [colorId, hexCode];
  @override
  String get aliasedName => _alias ?? 'category_colors';
  @override
  String get actualTableName => 'category_colors';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryColor> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('color_id')) {
      context.handle(_colorIdMeta,
          colorId.isAcceptableOrUnknown(data['color_id']!, _colorIdMeta));
    }
    if (data.containsKey('hex_code')) {
      context.handle(_hexCodeMeta,
          hexCode.isAcceptableOrUnknown(data['hex_code']!, _hexCodeMeta));
    } else if (isInserting) {
      context.missing(_hexCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {colorId};
  @override
  CategoryColor map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CategoryColor.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategoryColorsTable createAlias(String alias) {
    return $CategoryColorsTable(attachedDatabase, alias);
  }
}

class CategoryNameData extends DataClass
    implements Insertable<CategoryNameData> {
  final int cateId;
  final String category;
  CategoryNameData({required this.cateId, required this.category});
  factory CategoryNameData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CategoryNameData(
      cateId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cate_id'])!,
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cate_id'] = Variable<int>(cateId);
    map['category'] = Variable<String>(category);
    return map;
  }

  CategoryNameCompanion toCompanion(bool nullToAbsent) {
    return CategoryNameCompanion(
      cateId: Value(cateId),
      category: Value(category),
    );
  }

  factory CategoryNameData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryNameData(
      cateId: serializer.fromJson<int>(json['cateId']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cateId': serializer.toJson<int>(cateId),
      'category': serializer.toJson<String>(category),
    };
  }

  CategoryNameData copyWith({int? cateId, String? category}) =>
      CategoryNameData(
        cateId: cateId ?? this.cateId,
        category: category ?? this.category,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryNameData(')
          ..write('cateId: $cateId, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cateId, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryNameData &&
          other.cateId == this.cateId &&
          other.category == this.category);
}

class CategoryNameCompanion extends UpdateCompanion<CategoryNameData> {
  final Value<int> cateId;
  final Value<String> category;
  const CategoryNameCompanion({
    this.cateId = const Value.absent(),
    this.category = const Value.absent(),
  });
  CategoryNameCompanion.insert({
    this.cateId = const Value.absent(),
    required String category,
  }) : category = Value(category);
  static Insertable<CategoryNameData> custom({
    Expression<int>? cateId,
    Expression<String>? category,
  }) {
    return RawValuesInsertable({
      if (cateId != null) 'cate_id': cateId,
      if (category != null) 'category': category,
    });
  }

  CategoryNameCompanion copyWith(
      {Value<int>? cateId, Value<String>? category}) {
    return CategoryNameCompanion(
      cateId: cateId ?? this.cateId,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cateId.present) {
      map['cate_id'] = Variable<int>(cateId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryNameCompanion(')
          ..write('cateId: $cateId, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

class $CategoryNameTable extends CategoryName
    with TableInfo<$CategoryNameTable, CategoryNameData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryNameTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _cateIdMeta = const VerificationMeta('cateId');
  @override
  late final GeneratedColumn<int?> cateId = GeneratedColumn<int?>(
      'cate_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedColumn<String?> category = GeneratedColumn<String?>(
      'category', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [cateId, category];
  @override
  String get aliasedName => _alias ?? 'category_name';
  @override
  String get actualTableName => 'category_name';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryNameData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cate_id')) {
      context.handle(_cateIdMeta,
          cateId.isAcceptableOrUnknown(data['cate_id']!, _cateIdMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cateId};
  @override
  CategoryNameData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CategoryNameData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategoryNameTable createAlias(String alias) {
    return $CategoryNameTable(attachedDatabase, alias);
  }
}

abstract class _$LocalDb extends GeneratedDatabase {
  _$LocalDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $SchedulesTable schedules = $SchedulesTable(this);
  late final $CategoryColorsTable categoryColors = $CategoryColorsTable(this);
  late final $CategoryNameTable categoryName = $CategoryNameTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [schedules, categoryColors, categoryName];
}
