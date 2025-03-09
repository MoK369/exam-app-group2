// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashed_questions_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCashedQuestionsCollection on Isar {
  IsarCollection<CashedQuestions> get cashedQuestions => this.collection();
}

const CashedQuestionsSchema = CollectionSchema(
  name: r'CashedQuestions',
  id: -3982127287933329300,
  properties: {
    r'answers': PropertySchema(
      id: 0,
      name: r'answers',
      type: IsarType.objectList,
      target: r'Answers',
    ),
    r'examId': PropertySchema(
      id: 1,
      name: r'examId',
      type: IsarType.string,
    ),
    r'questions': PropertySchema(
      id: 2,
      name: r'questions',
      type: IsarType.objectList,
      target: r'QuestionEntity',
    )
  },
  estimateSize: _cashedQuestionsEstimateSize,
  serialize: _cashedQuestionsSerialize,
  deserialize: _cashedQuestionsDeserialize,
  deserializeProp: _cashedQuestionsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'QuestionEntity': QuestionEntitySchema,
    r'AnswerEntity': AnswerEntitySchema,
    r'SubjectEntity': SubjectEntitySchema,
    r'ExamEntity': ExamEntitySchema,
    r'Answers': AnswersSchema
  },
  getId: _cashedQuestionsGetId,
  getLinks: _cashedQuestionsGetLinks,
  attach: _cashedQuestionsAttach,
  version: '3.1.0+1',
);

int _cashedQuestionsEstimateSize(
  CashedQuestions object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.answers;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Answers]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += AnswersSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.subjectName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.questions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[QuestionEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              QuestionEntitySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _cashedQuestionsSerialize(
  CashedQuestions object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Answers>(
    offsets[0],
    allOffsets,
    AnswersSchema.serialize,
    object.answers,
  );
  writer.writeString(offsets[1], object.subjectName);
  writer.writeObjectList<QuestionEntity>(
    offsets[2],
    allOffsets,
    QuestionEntitySchema.serialize,
    object.questions,
  );
}

CashedQuestions _cashedQuestionsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CashedQuestions(
    answers: reader.readObjectList<Answers>(
      offsets[0],
      AnswersSchema.deserialize,
      allOffsets,
      Answers(),
    ),
    subjectName: reader.readStringOrNull(offsets[1]),
    questions: reader.readObjectList<QuestionEntity>(
      offsets[2],
      QuestionEntitySchema.deserialize,
      allOffsets,
      QuestionEntity(),
    ),
  );
  object.id = id;
  return object;
}

P _cashedQuestionsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Answers>(
        offset,
        AnswersSchema.deserialize,
        allOffsets,
        Answers(),
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readObjectList<QuestionEntity>(
        offset,
        QuestionEntitySchema.deserialize,
        allOffsets,
        QuestionEntity(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cashedQuestionsGetId(CashedQuestions object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cashedQuestionsGetLinks(CashedQuestions object) {
  return [];
}

void _cashedQuestionsAttach(
    IsarCollection<dynamic> col, Id id, CashedQuestions object) {
  object.id = id;
}

extension CashedQuestionsQueryWhereSort
    on QueryBuilder<CashedQuestions, CashedQuestions, QWhere> {
  QueryBuilder<CashedQuestions, CashedQuestions, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CashedQuestionsQueryWhere
    on QueryBuilder<CashedQuestions, CashedQuestions, QWhereClause> {
  QueryBuilder<CashedQuestions, CashedQuestions, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterWhereClause> idBetween(
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

extension CashedQuestionsQueryFilter
    on QueryBuilder<CashedQuestions, CashedQuestions, QFilterCondition> {
  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      answersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'answers',
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      answersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'answers',
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
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

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
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

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
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

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
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

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
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

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
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

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      examIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'examId',
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      examIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'examId',
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      examIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      examIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'examId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      examIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'examId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      examIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'examId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      examIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'examId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      examIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'examId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      examIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'examId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      examIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'examId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      examIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examId',
        value: '',
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      examIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'examId',
        value: '',
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      questionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questions',
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      questionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questions',
      ));
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      questionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      questionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      questionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      questionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      questionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      questionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension CashedQuestionsQueryObject
    on QueryBuilder<CashedQuestions, CashedQuestions, QFilterCondition> {
  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      answersElement(FilterQuery<Answers> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'answers');
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterFilterCondition>
      questionsElement(FilterQuery<QuestionEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'questions');
    });
  }
}

extension CashedQuestionsQueryLinks
    on QueryBuilder<CashedQuestions, CashedQuestions, QFilterCondition> {}

extension CashedQuestionsQuerySortBy
    on QueryBuilder<CashedQuestions, CashedQuestions, QSortBy> {
  QueryBuilder<CashedQuestions, CashedQuestions, QAfterSortBy> sortByExamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.asc);
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterSortBy>
      sortByExamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.desc);
    });
  }
}

extension CashedQuestionsQuerySortThenBy
    on QueryBuilder<CashedQuestions, CashedQuestions, QSortThenBy> {
  QueryBuilder<CashedQuestions, CashedQuestions, QAfterSortBy> thenByExamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.asc);
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterSortBy>
      thenByExamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.desc);
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CashedQuestions, CashedQuestions, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension CashedQuestionsQueryWhereDistinct
    on QueryBuilder<CashedQuestions, CashedQuestions, QDistinct> {
  QueryBuilder<CashedQuestions, CashedQuestions, QDistinct> distinctByExamId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'examId', caseSensitive: caseSensitive);
    });
  }
}

extension CashedQuestionsQueryProperty
    on QueryBuilder<CashedQuestions, CashedQuestions, QQueryProperty> {
  QueryBuilder<CashedQuestions, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CashedQuestions, List<Answers>?, QQueryOperations>
      answersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answers');
    });
  }

  QueryBuilder<CashedQuestions, String?, QQueryOperations> examIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'examId');
    });
  }

  QueryBuilder<CashedQuestions, List<QuestionEntity>?, QQueryOperations>
      questionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questions');
    });
  }
}
