// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuestionEntityCollection on Isar {
  IsarCollection<QuestionEntity> get questionEntitys => this.collection();
}

const QuestionEntitySchema = CollectionSchema(
  name: r'QuestionEntity',
  id: -5718048655593194005,
  properties: {
    r'answers': PropertySchema(
      id: 0,
      name: r'answers',
      type: IsarType.objectList,
      target: r'Answer',
    ),
    r'correct': PropertySchema(
      id: 1,
      name: r'correct',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.string,
    ),
    r'question': PropertySchema(
      id: 3,
      name: r'question',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _questionEntityEstimateSize,
  serialize: _questionEntitySerialize,
  deserialize: _questionEntityDeserialize,
  deserializeProp: _questionEntityDeserializeProp,
  idName: r'entityId',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Answer': AnswerSchema},
  getId: _questionEntityGetId,
  getLinks: _questionEntityGetLinks,
  attach: _questionEntityAttach,
  version: '3.1.0+1',
);

int _questionEntityEstimateSize(
  QuestionEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.answers;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Answer]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += AnswerSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.correct;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.question;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.type;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _questionEntitySerialize(
  QuestionEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Answer>(
    offsets[0],
    allOffsets,
    AnswerSchema.serialize,
    object.answers,
  );
  writer.writeString(offsets[1], object.correct);
  writer.writeString(offsets[2], object.id);
  writer.writeString(offsets[3], object.question);
  writer.writeString(offsets[4], object.type);
}

QuestionEntity _questionEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuestionEntity(
    answers: reader.readObjectList<Answer>(
      offsets[0],
      AnswerSchema.deserialize,
      allOffsets,
      Answer(),
    ),
    correct: reader.readStringOrNull(offsets[1]),
    id: reader.readStringOrNull(offsets[2]),
    question: reader.readStringOrNull(offsets[3]),
    type: reader.readStringOrNull(offsets[4]),
  );
  object.entityId = id;
  return object;
}

P _questionEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Answer>(
        offset,
        AnswerSchema.deserialize,
        allOffsets,
        Answer(),
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _questionEntityGetId(QuestionEntity object) {
  return object.entityId;
}

List<IsarLinkBase<dynamic>> _questionEntityGetLinks(QuestionEntity object) {
  return [];
}

void _questionEntityAttach(
    IsarCollection<dynamic> col, Id id, QuestionEntity object) {
  object.entityId = id;
}

extension QuestionEntityQueryWhereSort
    on QueryBuilder<QuestionEntity, QuestionEntity, QWhere> {
  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhere> anyEntityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuestionEntityQueryWhere
    on QueryBuilder<QuestionEntity, QuestionEntity, QWhereClause> {
  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhereClause>
      entityIdEqualTo(Id entityId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: entityId,
        upper: entityId,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhereClause>
      entityIdNotEqualTo(Id entityId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: entityId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: entityId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: entityId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: entityId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhereClause>
      entityIdGreaterThan(Id entityId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: entityId, includeLower: include),
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhereClause>
      entityIdLessThan(Id entityId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: entityId, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhereClause>
      entityIdBetween(
    Id lowerEntityId,
    Id upperEntityId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerEntityId,
        includeLower: includeLower,
        upper: upperEntityId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QuestionEntityQueryFilter
    on QueryBuilder<QuestionEntity, QuestionEntity, QFilterCondition> {
  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      answersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'answers',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      answersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'answers',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      answersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      answersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      answersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      answersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      answersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      answersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      correctIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correct',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      correctIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correct',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      correctEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correct',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      correctGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correct',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      correctLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correct',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      correctBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correct',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      correctStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correct',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      correctEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correct',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      correctContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correct',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      correctMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correct',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      correctIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correct',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      correctIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correct',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      entityIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      entityIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      entityIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      entityIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition> idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition> idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      questionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'question',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      questionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'question',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      questionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      questionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      questionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      questionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'question',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      questionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      questionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      questionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      questionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'question',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      questionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      questionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      typeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      typeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      typeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      typeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension QuestionEntityQueryObject
    on QueryBuilder<QuestionEntity, QuestionEntity, QFilterCondition> {
  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      answersElement(FilterQuery<Answer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'answers');
    });
  }
}

extension QuestionEntityQueryLinks
    on QueryBuilder<QuestionEntity, QuestionEntity, QFilterCondition> {}

extension QuestionEntityQuerySortBy
    on QueryBuilder<QuestionEntity, QuestionEntity, QSortBy> {
  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> sortByCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.asc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy>
      sortByCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.desc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> sortByQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.asc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy>
      sortByQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.desc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension QuestionEntityQuerySortThenBy
    on QueryBuilder<QuestionEntity, QuestionEntity, QSortThenBy> {
  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> thenByCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.asc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy>
      thenByCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.desc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> thenByEntityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.asc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy>
      thenByEntityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.desc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> thenByQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.asc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy>
      thenByQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.desc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension QuestionEntityQueryWhereDistinct
    on QueryBuilder<QuestionEntity, QuestionEntity, QDistinct> {
  QueryBuilder<QuestionEntity, QuestionEntity, QDistinct> distinctByCorrect(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correct', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QDistinct> distinctByQuestion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'question', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension QuestionEntityQueryProperty
    on QueryBuilder<QuestionEntity, QuestionEntity, QQueryProperty> {
  QueryBuilder<QuestionEntity, int, QQueryOperations> entityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityId');
    });
  }

  QueryBuilder<QuestionEntity, List<Answer>?, QQueryOperations>
      answersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answers');
    });
  }

  QueryBuilder<QuestionEntity, String?, QQueryOperations> correctProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correct');
    });
  }

  QueryBuilder<QuestionEntity, String?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuestionEntity, String?, QQueryOperations> questionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'question');
    });
  }

  QueryBuilder<QuestionEntity, String?, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AnswerSchema = Schema(
  name: r'Answer',
  id: -5347394118497230781,
  properties: {
    r'answer': PropertySchema(
      id: 0,
      name: r'answer',
      type: IsarType.string,
    ),
    r'key': PropertySchema(
      id: 1,
      name: r'key',
      type: IsarType.string,
    )
  },
  estimateSize: _answerEstimateSize,
  serialize: _answerSerialize,
  deserialize: _answerDeserialize,
  deserializeProp: _answerDeserializeProp,
);

int _answerEstimateSize(
  Answer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.answer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.key;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _answerSerialize(
  Answer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.answer);
  writer.writeString(offsets[1], object.key);
}

Answer _answerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Answer(
    answer: reader.readStringOrNull(offsets[0]),
    key: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _answerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AnswerQueryFilter on QueryBuilder<Answer, Answer, QFilterCondition> {
  QueryBuilder<Answer, Answer, QAfterFilterCondition> answerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'answer',
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> answerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'answer',
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> answerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> answerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> answerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> answerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> answerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> answerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> answerContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> answerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> answerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answer',
        value: '',
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> answerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answer',
        value: '',
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> keyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'key',
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> keyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'key',
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> keyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> keyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> keyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> keyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'key',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> keyContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> keyMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'key',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> keyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<Answer, Answer, QAfterFilterCondition> keyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'key',
        value: '',
      ));
    });
  }
}

extension AnswerQueryObject on QueryBuilder<Answer, Answer, QFilterCondition> {}
