// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_entry.dart';

// ignore_for_file: type=lint
class $CacheEntryTable extends CacheEntry
    with TableInfo<$CacheEntryTable, CacheEntryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CacheEntryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _validUntilMeta =
      const VerificationMeta('validUntil');
  @override
  late final GeneratedColumn<DateTime> validUntil = GeneratedColumn<DateTime>(
      'valid_until', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _savedMeta = const VerificationMeta('saved');
  @override
  late final GeneratedColumn<DateTime> saved = GeneratedColumn<DateTime>(
      'saved', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, url, validUntil, saved, body];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cache_entry';
  @override
  VerificationContext validateIntegrity(Insertable<CacheEntryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('valid_until')) {
      context.handle(
          _validUntilMeta,
          validUntil.isAcceptableOrUnknown(
              data['valid_until']!, _validUntilMeta));
    } else if (isInserting) {
      context.missing(_validUntilMeta);
    }
    if (data.containsKey('saved')) {
      context.handle(
          _savedMeta, saved.isAcceptableOrUnknown(data['saved']!, _savedMeta));
    } else if (isInserting) {
      context.missing(_savedMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CacheEntryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CacheEntryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      validUntil: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}valid_until'])!,
      saved: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}saved'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
    );
  }

  @override
  $CacheEntryTable createAlias(String alias) {
    return $CacheEntryTable(attachedDatabase, alias);
  }
}

class CacheEntryData extends DataClass implements Insertable<CacheEntryData> {
  final int id;
  final String url;
  final DateTime validUntil;
  final DateTime saved;
  final String body;
  const CacheEntryData(
      {required this.id,
      required this.url,
      required this.validUntil,
      required this.saved,
      required this.body});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['url'] = Variable<String>(url);
    map['valid_until'] = Variable<DateTime>(validUntil);
    map['saved'] = Variable<DateTime>(saved);
    map['body'] = Variable<String>(body);
    return map;
  }

  CacheEntryCompanion toCompanion(bool nullToAbsent) {
    return CacheEntryCompanion(
      id: Value(id),
      url: Value(url),
      validUntil: Value(validUntil),
      saved: Value(saved),
      body: Value(body),
    );
  }

  factory CacheEntryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CacheEntryData(
      id: serializer.fromJson<int>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      validUntil: serializer.fromJson<DateTime>(json['validUntil']),
      saved: serializer.fromJson<DateTime>(json['saved']),
      body: serializer.fromJson<String>(json['body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'url': serializer.toJson<String>(url),
      'validUntil': serializer.toJson<DateTime>(validUntil),
      'saved': serializer.toJson<DateTime>(saved),
      'body': serializer.toJson<String>(body),
    };
  }

  CacheEntryData copyWith(
          {int? id,
          String? url,
          DateTime? validUntil,
          DateTime? saved,
          String? body}) =>
      CacheEntryData(
        id: id ?? this.id,
        url: url ?? this.url,
        validUntil: validUntil ?? this.validUntil,
        saved: saved ?? this.saved,
        body: body ?? this.body,
      );
  CacheEntryData copyWithCompanion(CacheEntryCompanion data) {
    return CacheEntryData(
      id: data.id.present ? data.id.value : this.id,
      url: data.url.present ? data.url.value : this.url,
      validUntil:
          data.validUntil.present ? data.validUntil.value : this.validUntil,
      saved: data.saved.present ? data.saved.value : this.saved,
      body: data.body.present ? data.body.value : this.body,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CacheEntryData(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('validUntil: $validUntil, ')
          ..write('saved: $saved, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, url, validUntil, saved, body);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CacheEntryData &&
          other.id == this.id &&
          other.url == this.url &&
          other.validUntil == this.validUntil &&
          other.saved == this.saved &&
          other.body == this.body);
}

class CacheEntryCompanion extends UpdateCompanion<CacheEntryData> {
  final Value<int> id;
  final Value<String> url;
  final Value<DateTime> validUntil;
  final Value<DateTime> saved;
  final Value<String> body;
  final Value<int> rowid;
  const CacheEntryCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.validUntil = const Value.absent(),
    this.saved = const Value.absent(),
    this.body = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CacheEntryCompanion.insert({
    required int id,
    required String url,
    required DateTime validUntil,
    required DateTime saved,
    required String body,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        url = Value(url),
        validUntil = Value(validUntil),
        saved = Value(saved),
        body = Value(body);
  static Insertable<CacheEntryData> custom({
    Expression<int>? id,
    Expression<String>? url,
    Expression<DateTime>? validUntil,
    Expression<DateTime>? saved,
    Expression<String>? body,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (validUntil != null) 'valid_until': validUntil,
      if (saved != null) 'saved': saved,
      if (body != null) 'body': body,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CacheEntryCompanion copyWith(
      {Value<int>? id,
      Value<String>? url,
      Value<DateTime>? validUntil,
      Value<DateTime>? saved,
      Value<String>? body,
      Value<int>? rowid}) {
    return CacheEntryCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      validUntil: validUntil ?? this.validUntil,
      saved: saved ?? this.saved,
      body: body ?? this.body,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (validUntil.present) {
      map['valid_until'] = Variable<DateTime>(validUntil.value);
    }
    if (saved.present) {
      map['saved'] = Variable<DateTime>(saved.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CacheEntryCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('validUntil: $validUntil, ')
          ..write('saved: $saved, ')
          ..write('body: $body, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$CacheDatabase extends GeneratedDatabase {
  _$CacheDatabase(QueryExecutor e) : super(e);
  $CacheDatabaseManager get managers => $CacheDatabaseManager(this);
  late final $CacheEntryTable cacheEntry = $CacheEntryTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cacheEntry];
}

typedef $$CacheEntryTableCreateCompanionBuilder = CacheEntryCompanion Function({
  required int id,
  required String url,
  required DateTime validUntil,
  required DateTime saved,
  required String body,
  Value<int> rowid,
});
typedef $$CacheEntryTableUpdateCompanionBuilder = CacheEntryCompanion Function({
  Value<int> id,
  Value<String> url,
  Value<DateTime> validUntil,
  Value<DateTime> saved,
  Value<String> body,
  Value<int> rowid,
});

class $$CacheEntryTableFilterComposer
    extends FilterComposer<_$CacheDatabase, $CacheEntryTable> {
  $$CacheEntryTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get validUntil => $state.composableBuilder(
      column: $state.table.validUntil,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get saved => $state.composableBuilder(
      column: $state.table.saved,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get body => $state.composableBuilder(
      column: $state.table.body,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CacheEntryTableOrderingComposer
    extends OrderingComposer<_$CacheDatabase, $CacheEntryTable> {
  $$CacheEntryTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get validUntil => $state.composableBuilder(
      column: $state.table.validUntil,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get saved => $state.composableBuilder(
      column: $state.table.saved,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get body => $state.composableBuilder(
      column: $state.table.body,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$CacheEntryTableTableManager extends RootTableManager<
    _$CacheDatabase,
    $CacheEntryTable,
    CacheEntryData,
    $$CacheEntryTableFilterComposer,
    $$CacheEntryTableOrderingComposer,
    $$CacheEntryTableCreateCompanionBuilder,
    $$CacheEntryTableUpdateCompanionBuilder,
    (
      CacheEntryData,
      BaseReferences<_$CacheDatabase, $CacheEntryTable, CacheEntryData>
    ),
    CacheEntryData,
    PrefetchHooks Function()> {
  $$CacheEntryTableTableManager(_$CacheDatabase db, $CacheEntryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CacheEntryTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CacheEntryTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<DateTime> validUntil = const Value.absent(),
            Value<DateTime> saved = const Value.absent(),
            Value<String> body = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CacheEntryCompanion(
            id: id,
            url: url,
            validUntil: validUntil,
            saved: saved,
            body: body,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String url,
            required DateTime validUntil,
            required DateTime saved,
            required String body,
            Value<int> rowid = const Value.absent(),
          }) =>
              CacheEntryCompanion.insert(
            id: id,
            url: url,
            validUntil: validUntil,
            saved: saved,
            body: body,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CacheEntryTableProcessedTableManager = ProcessedTableManager<
    _$CacheDatabase,
    $CacheEntryTable,
    CacheEntryData,
    $$CacheEntryTableFilterComposer,
    $$CacheEntryTableOrderingComposer,
    $$CacheEntryTableCreateCompanionBuilder,
    $$CacheEntryTableUpdateCompanionBuilder,
    (
      CacheEntryData,
      BaseReferences<_$CacheDatabase, $CacheEntryTable, CacheEntryData>
    ),
    CacheEntryData,
    PrefetchHooks Function()>;

class $CacheDatabaseManager {
  final _$CacheDatabase _db;
  $CacheDatabaseManager(this._db);
  $$CacheEntryTableTableManager get cacheEntry =>
      $$CacheEntryTableTableManager(_db, _db.cacheEntry);
}
