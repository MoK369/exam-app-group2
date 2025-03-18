// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetImageEntityCollection on Isar {
  IsarCollection<ImageEntity> get imageEntitys => this.collection();
}

const ImageEntitySchema = CollectionSchema(
  name: r'ImageEntity',
  id: -4984262976942117902,
  properties: {
    r'emailId': PropertySchema(
      id: 0,
      name: r'emailId',
      type: IsarType.string,
    ),
    r'imageData': PropertySchema(
      id: 1,
      name: r'imageData',
      type: IsarType.byteList,
    )
  },
  estimateSize: _imageEntityEstimateSize,
  serialize: _imageEntitySerialize,
  deserialize: _imageEntityDeserialize,
  deserializeProp: _imageEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _imageEntityGetId,
  getLinks: _imageEntityGetLinks,
  attach: _imageEntityAttach,
  version: '3.1.0+1',
);

int _imageEntityEstimateSize(
  ImageEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.emailId.length * 3;
  bytesCount += 3 + object.imageData.length;
  return bytesCount;
}

void _imageEntitySerialize(
  ImageEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.emailId);
  writer.writeByteList(offsets[1], object.imageData);
}

ImageEntity _imageEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ImageEntity(
    emailId: reader.readString(offsets[0]),
    imageData: reader.readByteList(offsets[1]) ?? [],
  );
  object.id = id;
  return object;
}

P _imageEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readByteList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _imageEntityGetId(ImageEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _imageEntityGetLinks(ImageEntity object) {
  return [];
}

void _imageEntityAttach(
    IsarCollection<dynamic> col, Id id, ImageEntity object) {
  object.id = id;
}

extension ImageEntityQueryWhereSort
    on QueryBuilder<ImageEntity, ImageEntity, QWhere> {
  QueryBuilder<ImageEntity, ImageEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ImageEntityQueryWhere
    on QueryBuilder<ImageEntity, ImageEntity, QWhereClause> {
  QueryBuilder<ImageEntity, ImageEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<ImageEntity, ImageEntity, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterWhereClause> idBetween(
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

extension ImageEntityQueryFilter
    on QueryBuilder<ImageEntity, ImageEntity, QFilterCondition> {
  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition> emailIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition>
      emailIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition> emailIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition> emailIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emailId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition>
      emailIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition> emailIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition> emailIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition> emailIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emailId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition>
      emailIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailId',
        value: '',
      ));
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition>
      emailIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emailId',
        value: '',
      ));
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition>
      imageDataElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageData',
        value: value,
      ));
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition>
      imageDataElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageData',
        value: value,
      ));
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition>
      imageDataElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageData',
        value: value,
      ));
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition>
      imageDataElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition>
      imageDataLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageData',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition>
      imageDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageData',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition>
      imageDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageData',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition>
      imageDataLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageData',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition>
      imageDataLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageData',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterFilterCondition>
      imageDataLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageData',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ImageEntityQueryObject
    on QueryBuilder<ImageEntity, ImageEntity, QFilterCondition> {}

extension ImageEntityQueryLinks
    on QueryBuilder<ImageEntity, ImageEntity, QFilterCondition> {}

extension ImageEntityQuerySortBy
    on QueryBuilder<ImageEntity, ImageEntity, QSortBy> {
  QueryBuilder<ImageEntity, ImageEntity, QAfterSortBy> sortByEmailId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailId', Sort.asc);
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterSortBy> sortByEmailIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailId', Sort.desc);
    });
  }
}

extension ImageEntityQuerySortThenBy
    on QueryBuilder<ImageEntity, ImageEntity, QSortThenBy> {
  QueryBuilder<ImageEntity, ImageEntity, QAfterSortBy> thenByEmailId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailId', Sort.asc);
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterSortBy> thenByEmailIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailId', Sort.desc);
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension ImageEntityQueryWhereDistinct
    on QueryBuilder<ImageEntity, ImageEntity, QDistinct> {
  QueryBuilder<ImageEntity, ImageEntity, QDistinct> distinctByEmailId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emailId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ImageEntity, ImageEntity, QDistinct> distinctByImageData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageData');
    });
  }
}

extension ImageEntityQueryProperty
    on QueryBuilder<ImageEntity, ImageEntity, QQueryProperty> {
  QueryBuilder<ImageEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ImageEntity, String, QQueryOperations> emailIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emailId');
    });
  }

  QueryBuilder<ImageEntity, List<int>, QQueryOperations> imageDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageData');
    });
  }
}
