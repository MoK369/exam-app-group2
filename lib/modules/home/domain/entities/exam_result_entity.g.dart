// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_result_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetExamResultEntityCollection on Isar {
  IsarCollection<ExamResultEntity> get examResultEntitys => this.collection();
}

const ExamResultEntitySchema = CollectionSchema(
  name: r'ExamResultEntity',
  id: -7364272927947082340,
  properties: {
    r'correct': PropertySchema(
      id: 0,
      name: r'correct',
      type: IsarType.long,
    ),
    r'correctQuestions': PropertySchema(
      id: 1,
      name: r'correctQuestions',
      type: IsarType.objectList,
      target: r'CheckedQuestion',
    ),
    r'examId': PropertySchema(
      id: 2,
      name: r'examId',
      type: IsarType.string,
    ),
    r'message': PropertySchema(
      id: 3,
      name: r'message',
      type: IsarType.string,
    ),
    r'subjectId': PropertySchema(
      id: 4,
      name: r'subjectId',
      type: IsarType.string,
    ),
    r'total': PropertySchema(
      id: 5,
      name: r'total',
      type: IsarType.string,
    ),
    r'wrong': PropertySchema(
      id: 6,
      name: r'wrong',
      type: IsarType.long,
    ),
    r'wrongQuestions': PropertySchema(
      id: 7,
      name: r'wrongQuestions',
      type: IsarType.objectList,
      target: r'CheckedQuestion',
    )
  },
  estimateSize: _examResultEntityEstimateSize,
  serialize: _examResultEntitySerialize,
  deserialize: _examResultEntityDeserialize,
  deserializeProp: _examResultEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'CheckedQuestion': CheckedQuestionSchema},
  getId: _examResultEntityGetId,
  getLinks: _examResultEntityGetLinks,
  attach: _examResultEntityAttach,
  version: '3.1.0+1',
);

int _examResultEntityEstimateSize(
  ExamResultEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.correctQuestions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[CheckedQuestion]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              CheckedQuestionSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.examId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.message;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.subjectId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.total;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.wrongQuestions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[CheckedQuestion]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              CheckedQuestionSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _examResultEntitySerialize(
  ExamResultEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.correct);
  writer.writeObjectList<CheckedQuestion>(
    offsets[1],
    allOffsets,
    CheckedQuestionSchema.serialize,
    object.correctQuestions,
  );
  writer.writeString(offsets[2], object.examId);
  writer.writeString(offsets[3], object.message);
  writer.writeString(offsets[4], object.subjectId);
  writer.writeString(offsets[5], object.total);
  writer.writeLong(offsets[6], object.wrong);
  writer.writeObjectList<CheckedQuestion>(
    offsets[7],
    allOffsets,
    CheckedQuestionSchema.serialize,
    object.wrongQuestions,
  );
}

ExamResultEntity _examResultEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExamResultEntity(
    correct: reader.readLongOrNull(offsets[0]),
    correctQuestions: reader.readObjectList<CheckedQuestion>(
      offsets[1],
      CheckedQuestionSchema.deserialize,
      allOffsets,
      CheckedQuestion(),
    ),
    examId: reader.readStringOrNull(offsets[2]),
    message: reader.readStringOrNull(offsets[3]),
    total: reader.readStringOrNull(offsets[5]),
    wrong: reader.readLongOrNull(offsets[6]),
    wrongQuestions: reader.readObjectList<CheckedQuestion>(
      offsets[7],
      CheckedQuestionSchema.deserialize,
      allOffsets,
      CheckedQuestion(),
    ),
  );
  object.id = id;
  object.subjectId = reader.readStringOrNull(offsets[4]);
  return object;
}

P _examResultEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<CheckedQuestion>(
        offset,
        CheckedQuestionSchema.deserialize,
        allOffsets,
        CheckedQuestion(),
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readObjectList<CheckedQuestion>(
        offset,
        CheckedQuestionSchema.deserialize,
        allOffsets,
        CheckedQuestion(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _examResultEntityGetId(ExamResultEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _examResultEntityGetLinks(ExamResultEntity object) {
  return [];
}

void _examResultEntityAttach(
    IsarCollection<dynamic> col, Id id, ExamResultEntity object) {
  object.id = id;
}

extension ExamResultEntityQueryWhereSort
    on QueryBuilder<ExamResultEntity, ExamResultEntity, QWhere> {
  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ExamResultEntityQueryWhere
    on QueryBuilder<ExamResultEntity, ExamResultEntity, QWhereClause> {
  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterWhereClause>
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

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterWhereClause> idBetween(
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

extension ExamResultEntityQueryFilter
    on QueryBuilder<ExamResultEntity, ExamResultEntity, QFilterCondition> {
  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      correctIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correct',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      correctIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correct',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      correctEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correct',
        value: value,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      correctGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correct',
        value: value,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      correctLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correct',
        value: value,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      correctBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correct',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      correctQuestionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correctQuestions',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      correctQuestionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correctQuestions',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      correctQuestionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'correctQuestions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      correctQuestionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'correctQuestions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      correctQuestionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'correctQuestions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      correctQuestionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'correctQuestions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      correctQuestionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'correctQuestions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      correctQuestionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'correctQuestions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      examIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'examId',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      examIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'examId',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
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

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
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

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
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

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
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

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
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

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
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

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      examIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'examId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      examIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'examId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      examIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examId',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      examIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'examId',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
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

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
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

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
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

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      messageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'message',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      messageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'message',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      messageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      messageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      messageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      messageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'message',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      messageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      messageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      messageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      messageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'message',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      messageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      messageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      subjectIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subjectId',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      subjectIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subjectId',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      subjectIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subjectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      subjectIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subjectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      subjectIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subjectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      subjectIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subjectId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      subjectIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subjectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      subjectIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subjectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      subjectIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subjectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      subjectIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subjectId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      subjectIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subjectId',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      subjectIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subjectId',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      totalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      totalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      totalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      totalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      totalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      totalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      totalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'total',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      totalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'total',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      totalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'total',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      totalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'total',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      totalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      totalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'total',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      wrongIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wrong',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      wrongIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wrong',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      wrongEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wrong',
        value: value,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      wrongGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wrong',
        value: value,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      wrongLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wrong',
        value: value,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      wrongBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wrong',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      wrongQuestionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wrongQuestions',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      wrongQuestionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wrongQuestions',
      ));
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      wrongQuestionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wrongQuestions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      wrongQuestionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wrongQuestions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      wrongQuestionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wrongQuestions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      wrongQuestionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wrongQuestions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      wrongQuestionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wrongQuestions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      wrongQuestionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wrongQuestions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ExamResultEntityQueryObject
    on QueryBuilder<ExamResultEntity, ExamResultEntity, QFilterCondition> {
  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      correctQuestionsElement(FilterQuery<CheckedQuestion> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'correctQuestions');
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterFilterCondition>
      wrongQuestionsElement(FilterQuery<CheckedQuestion> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'wrongQuestions');
    });
  }
}

extension ExamResultEntityQueryLinks
    on QueryBuilder<ExamResultEntity, ExamResultEntity, QFilterCondition> {}

extension ExamResultEntityQuerySortBy
    on QueryBuilder<ExamResultEntity, ExamResultEntity, QSortBy> {
  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      sortByCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.asc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      sortByCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.desc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      sortByExamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.asc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      sortByExamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.desc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      sortByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      sortByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      sortBySubjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectId', Sort.asc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      sortBySubjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectId', Sort.desc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy> sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy> sortByWrong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrong', Sort.asc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      sortByWrongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrong', Sort.desc);
    });
  }
}

extension ExamResultEntityQuerySortThenBy
    on QueryBuilder<ExamResultEntity, ExamResultEntity, QSortThenBy> {
  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      thenByCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.asc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      thenByCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.desc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      thenByExamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.asc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      thenByExamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.desc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      thenByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      thenByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      thenBySubjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectId', Sort.asc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      thenBySubjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectId', Sort.desc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy> thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy> thenByWrong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrong', Sort.asc);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QAfterSortBy>
      thenByWrongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrong', Sort.desc);
    });
  }
}

extension ExamResultEntityQueryWhereDistinct
    on QueryBuilder<ExamResultEntity, ExamResultEntity, QDistinct> {
  QueryBuilder<ExamResultEntity, ExamResultEntity, QDistinct>
      distinctByCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correct');
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QDistinct> distinctByExamId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'examId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QDistinct> distinctByMessage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'message', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QDistinct>
      distinctBySubjectId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subjectId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QDistinct> distinctByTotal(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExamResultEntity, ExamResultEntity, QDistinct>
      distinctByWrong() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wrong');
    });
  }
}

extension ExamResultEntityQueryProperty
    on QueryBuilder<ExamResultEntity, ExamResultEntity, QQueryProperty> {
  QueryBuilder<ExamResultEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ExamResultEntity, int?, QQueryOperations> correctProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correct');
    });
  }

  QueryBuilder<ExamResultEntity, List<CheckedQuestion>?, QQueryOperations>
      correctQuestionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctQuestions');
    });
  }

  QueryBuilder<ExamResultEntity, String?, QQueryOperations> examIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'examId');
    });
  }

  QueryBuilder<ExamResultEntity, String?, QQueryOperations> messageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'message');
    });
  }

  QueryBuilder<ExamResultEntity, String?, QQueryOperations>
      subjectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subjectId');
    });
  }

  QueryBuilder<ExamResultEntity, String?, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }

  QueryBuilder<ExamResultEntity, int?, QQueryOperations> wrongProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wrong');
    });
  }

  QueryBuilder<ExamResultEntity, List<CheckedQuestion>?, QQueryOperations>
      wrongQuestionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wrongQuestions');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CheckedQuestionSchema = Schema(
  name: r'CheckedQuestion',
  id: -2261955447124562610,
  properties: {
    r'correctAnswer': PropertySchema(
      id: 0,
      name: r'correctAnswer',
      type: IsarType.string,
    ),
    r'inCorrectAnswer': PropertySchema(
      id: 1,
      name: r'inCorrectAnswer',
      type: IsarType.string,
    ),
    r'qid': PropertySchema(
      id: 2,
      name: r'qid',
      type: IsarType.string,
    ),
    r'question': PropertySchema(
      id: 3,
      name: r'question',
      type: IsarType.string,
    )
  },
  estimateSize: _checkedQuestionEstimateSize,
  serialize: _checkedQuestionSerialize,
  deserialize: _checkedQuestionDeserialize,
  deserializeProp: _checkedQuestionDeserializeProp,
);

int _checkedQuestionEstimateSize(
  CheckedQuestion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.correctAnswer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.inCorrectAnswer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.qid;
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
  return bytesCount;
}

void _checkedQuestionSerialize(
  CheckedQuestion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.correctAnswer);
  writer.writeString(offsets[1], object.inCorrectAnswer);
  writer.writeString(offsets[2], object.qid);
  writer.writeString(offsets[3], object.question);
}

CheckedQuestion _checkedQuestionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CheckedQuestion(
    correctAnswer: reader.readStringOrNull(offsets[0]),
    inCorrectAnswer: reader.readStringOrNull(offsets[1]),
    qid: reader.readStringOrNull(offsets[2]),
    question: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _checkedQuestionDeserializeProp<P>(
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
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CheckedQuestionQueryFilter
    on QueryBuilder<CheckedQuestion, CheckedQuestion, QFilterCondition> {
  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      correctAnswerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correctAnswer',
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      correctAnswerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correctAnswer',
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      correctAnswerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      correctAnswerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      correctAnswerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      correctAnswerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctAnswer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      correctAnswerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      correctAnswerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      correctAnswerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      correctAnswerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correctAnswer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      correctAnswerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      correctAnswerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correctAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      inCorrectAnswerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'inCorrectAnswer',
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      inCorrectAnswerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'inCorrectAnswer',
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      inCorrectAnswerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inCorrectAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      inCorrectAnswerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inCorrectAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      inCorrectAnswerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inCorrectAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      inCorrectAnswerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inCorrectAnswer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      inCorrectAnswerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'inCorrectAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      inCorrectAnswerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'inCorrectAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      inCorrectAnswerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'inCorrectAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      inCorrectAnswerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'inCorrectAnswer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      inCorrectAnswerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inCorrectAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      inCorrectAnswerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'inCorrectAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      qidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qid',
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      qidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qid',
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      qidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      qidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      qidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      qidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      qidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'qid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      qidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'qid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      qidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'qid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      qidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'qid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      qidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qid',
        value: '',
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      qidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'qid',
        value: '',
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      questionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'question',
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      questionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'question',
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
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

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
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

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
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

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
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

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
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

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
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

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      questionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      questionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'question',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      questionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<CheckedQuestion, CheckedQuestion, QAfterFilterCondition>
      questionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'question',
        value: '',
      ));
    });
  }
}

extension CheckedQuestionQueryObject
    on QueryBuilder<CheckedQuestion, CheckedQuestion, QFilterCondition> {}
