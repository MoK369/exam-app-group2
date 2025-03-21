// Mocks generated by Mockito 5.4.4 from annotations
// in exam_app_group2/test/modules/home/data/repository_imp/explore_repository_imp_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:exam_app_group2/core/api/api_result/api_result.dart' as _i4;
import 'package:exam_app_group2/modules/home/data/data_source_contracts/explore_data_source.dart'
    as _i2;
import 'package:exam_app_group2/modules/home/data/data_source_contracts/questions_offline_data_source.dart'
    as _i11;
import 'package:exam_app_group2/modules/home/data/models/all_exams_on_subject_response/get_all_exams_on_subject_response.dart'
    as _i7;
import 'package:exam_app_group2/modules/home/data/models/all_questions_response/get_all_questions_response.dart'
    as _i8;
import 'package:exam_app_group2/modules/home/data/models/all_subjects_response/get_all_subjects_response.dart'
    as _i5;
import 'package:exam_app_group2/modules/home/data/models/check_questions/answers.dart'
    as _i13;
import 'package:exam_app_group2/modules/home/data/models/check_questions/check_question_response.dart'
    as _i9;
import 'package:exam_app_group2/modules/home/data/models/check_questions/check_questions_request.dart'
    as _i10;
import 'package:exam_app_group2/modules/home/domain/entities/cahed_questions/cashed_questions_entity.dart'
    as _i12;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ExploreDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockExploreDataSource extends _i1.Mock implements _i2.ExploreDataSource {
  MockExploreDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.ApiResult<_i5.GetAllSubjectsResponse>> getAllSubjects() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllSubjects,
          [],
        ),
        returnValue:
            _i3.Future<_i4.ApiResult<_i5.GetAllSubjectsResponse>>.value(
                _i6.dummyValue<_i4.ApiResult<_i5.GetAllSubjectsResponse>>(
          this,
          Invocation.method(
            #getAllSubjects,
            [],
          ),
        )),
      ) as _i3.Future<_i4.ApiResult<_i5.GetAllSubjectsResponse>>);

  @override
  _i3.Future<_i4.ApiResult<_i7.GetAllExamsOnSubjectResponse>>
      getAllExamsOnSubject(String? subjectId) => (super.noSuchMethod(
            Invocation.method(
              #getAllExamsOnSubject,
              [subjectId],
            ),
            returnValue: _i3
                .Future<_i4.ApiResult<_i7.GetAllExamsOnSubjectResponse>>.value(
                _i6.dummyValue<_i4.ApiResult<_i7.GetAllExamsOnSubjectResponse>>(
              this,
              Invocation.method(
                #getAllExamsOnSubject,
                [subjectId],
              ),
            )),
          ) as _i3.Future<_i4.ApiResult<_i7.GetAllExamsOnSubjectResponse>>);

  @override
  _i3.Future<_i4.ApiResult<_i8.GetAllQuestionsResponse>> getAllQuestions(
          String? examId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllQuestions,
          [examId],
        ),
        returnValue:
            _i3.Future<_i4.ApiResult<_i8.GetAllQuestionsResponse>>.value(
                _i6.dummyValue<_i4.ApiResult<_i8.GetAllQuestionsResponse>>(
          this,
          Invocation.method(
            #getAllQuestions,
            [examId],
          ),
        )),
      ) as _i3.Future<_i4.ApiResult<_i8.GetAllQuestionsResponse>>);

  @override
  _i3.Future<_i4.ApiResult<_i9.CheckQuestionResponse>> checkQuestions(
          {required _i10.CheckQuestionsRequest? checkQuestionRequest}) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkQuestions,
          [],
          {#checkQuestionRequest: checkQuestionRequest},
        ),
        returnValue: _i3.Future<_i4.ApiResult<_i9.CheckQuestionResponse>>.value(
            _i6.dummyValue<_i4.ApiResult<_i9.CheckQuestionResponse>>(
          this,
          Invocation.method(
            #checkQuestions,
            [],
            {#checkQuestionRequest: checkQuestionRequest},
          ),
        )),
      ) as _i3.Future<_i4.ApiResult<_i9.CheckQuestionResponse>>);
}

/// A class which mocks [QuestionsOfflineDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockQuestionsOfflineDataSource extends _i1.Mock
    implements _i11.QuestionsOfflineDataSource {
  MockQuestionsOfflineDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> saveCashedQuestions(_i12.CashedQuestions? cashedQuestions) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveCashedQuestions,
          [cashedQuestions],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<List<_i12.CashedQuestions>?> getCashedQuestionsAndAnswers() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCashedQuestionsAndAnswers,
          [],
        ),
        returnValue: _i3.Future<List<_i12.CashedQuestions>?>.value(),
      ) as _i3.Future<List<_i12.CashedQuestions>?>);
}

/// A class which mocks [CheckQuestionsRequest].
///
/// See the documentation for Mockito's code generation for more information.
class MockCheckQuestionsRequest extends _i1.Mock
    implements _i10.CheckQuestionsRequest {
  MockCheckQuestionsRequest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set answers(List<_i13.Answers>? _answers) => super.noSuchMethod(
        Invocation.setter(
          #answers,
          _answers,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set time(num? _time) => super.noSuchMethod(
        Invocation.setter(
          #time,
          _time,
        ),
        returnValueForMissingStub: null,
      );

  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
      ) as Map<String, dynamic>);
}
