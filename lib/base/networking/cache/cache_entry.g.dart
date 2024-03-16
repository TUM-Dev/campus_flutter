// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_entry.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCacheEntryCollection on Isar {
  IsarCollection<CacheEntry> get cacheEntrys => this.collection();
}

const CacheEntrySchema = CollectionSchema(
  name: r'CacheEntry',
  id: 1901957776030515961,
  properties: {
    r'data': PropertySchema(
      id: 0,
      name: r'data',
      type: IsarType.string,
    ),
    r'saved': PropertySchema(
      id: 1,
      name: r'saved',
      type: IsarType.dateTime,
    ),
    r'url': PropertySchema(
      id: 2,
      name: r'url',
      type: IsarType.string,
    ),
    r'validUntil': PropertySchema(
      id: 3,
      name: r'validUntil',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _cacheEntryEstimateSize,
  serialize: _cacheEntrySerialize,
  deserialize: _cacheEntryDeserialize,
  deserializeProp: _cacheEntryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cacheEntryGetId,
  getLinks: _cacheEntryGetLinks,
  attach: _cacheEntryAttach,
  version: '3.1.4',
);

int _cacheEntryEstimateSize(
  CacheEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.data.length * 3;
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _cacheEntrySerialize(
  CacheEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.data);
  writer.writeDateTime(offsets[1], object.saved);
  writer.writeString(offsets[2], object.url);
  writer.writeDateTime(offsets[3], object.validUntil);
}

CacheEntry _cacheEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CacheEntry(
    data: reader.readString(offsets[0]),
    id: id,
    saved: reader.readDateTime(offsets[1]),
    url: reader.readString(offsets[2]),
    validUntil: reader.readDateTime(offsets[3]),
  );
  return object;
}

P _cacheEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cacheEntryGetId(CacheEntry object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cacheEntryGetLinks(CacheEntry object) {
  return [];
}

void _cacheEntryAttach(IsarCollection<dynamic> col, Id id, CacheEntry object) {}

extension CacheEntryQueryWhereSort
    on QueryBuilder<CacheEntry, CacheEntry, QWhere> {
  QueryBuilder<CacheEntry, CacheEntry, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CacheEntryQueryWhere
    on QueryBuilder<CacheEntry, CacheEntry, QWhereClause> {
  QueryBuilder<CacheEntry, CacheEntry, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CacheEntryQueryFilter
    on QueryBuilder<CacheEntry, CacheEntry, QFilterCondition> {
  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> dataEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> dataGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> dataLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> dataBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'data',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> dataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> dataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> dataContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> dataMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'data',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> dataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data',
        value: '',
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> dataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'data',
        value: '',
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> savedEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saved',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> savedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saved',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> savedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saved',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> savedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saved',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> urlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> urlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> validUntilEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validUntil',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition>
      validUntilGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'validUntil',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition>
      validUntilLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'validUntil',
        value: value,
      ));
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterFilterCondition> validUntilBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'validUntil',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CacheEntryQueryObject
    on QueryBuilder<CacheEntry, CacheEntry, QFilterCondition> {}

extension CacheEntryQueryLinks
    on QueryBuilder<CacheEntry, CacheEntry, QFilterCondition> {}

extension CacheEntryQuerySortBy
    on QueryBuilder<CacheEntry, CacheEntry, QSortBy> {
  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> sortByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> sortByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> sortBySaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saved', Sort.asc);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> sortBySavedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saved', Sort.desc);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> sortByValidUntil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validUntil', Sort.asc);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> sortByValidUntilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validUntil', Sort.desc);
    });
  }
}

extension CacheEntryQuerySortThenBy
    on QueryBuilder<CacheEntry, CacheEntry, QSortThenBy> {
  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> thenByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> thenByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> thenBySaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saved', Sort.asc);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> thenBySavedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saved', Sort.desc);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> thenByValidUntil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validUntil', Sort.asc);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QAfterSortBy> thenByValidUntilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validUntil', Sort.desc);
    });
  }
}

extension CacheEntryQueryWhereDistinct
    on QueryBuilder<CacheEntry, CacheEntry, QDistinct> {
  QueryBuilder<CacheEntry, CacheEntry, QDistinct> distinctByData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'data', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QDistinct> distinctBySaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saved');
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CacheEntry, CacheEntry, QDistinct> distinctByValidUntil() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validUntil');
    });
  }
}

extension CacheEntryQueryProperty
    on QueryBuilder<CacheEntry, CacheEntry, QQueryProperty> {
  QueryBuilder<CacheEntry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CacheEntry, String, QQueryOperations> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'data');
    });
  }

  QueryBuilder<CacheEntry, DateTime, QQueryOperations> savedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saved');
    });
  }

  QueryBuilder<CacheEntry, String, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }

  QueryBuilder<CacheEntry, DateTime, QQueryOperations> validUntilProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validUntil');
    });
  }
}
