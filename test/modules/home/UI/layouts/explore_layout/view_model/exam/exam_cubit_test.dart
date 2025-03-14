import 'package:bloc_test/bloc_test.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/explore_layout/view_model/exam/exam_cubit.dart';
import 'package:exam_app_group2/modules/home/domain/entities/exam_entity.dart';
import 'package:exam_app_group2/modules/home/domain/use_cases/get_all_exams_on_subject.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'exam_cubit_test.mocks.dart';

@GenerateMocks([GetAllExamsOnSubjectUseCase])
void main() {
  group("exam cubit ", () {
    late ExamCubit cubit;
    late MockGetAllExamsOnSubjectUseCase getAllExamsOnSubjectUseCase;
    setUp(() {
      getAllExamsOnSubjectUseCase = MockGetAllExamsOnSubjectUseCase();
      cubit = ExamCubit(
        getAllExamsOnSubjectUseCase: getAllExamsOnSubjectUseCase,
      );
    });
    blocTest<ExamCubit, ExamState>(
      'test do intent with success get all exams intent',
      setUp: () {
        provideDummy<ApiResult<List<ExamEntity>?>>(
          Success<List<ExamEntity>?>(data: []),
        );
        when(getAllExamsOnSubjectUseCase.execute(any)).thenAnswer(
          (_) async => Success<List<ExamEntity>?>(data: []),
        );
      },
      build: () => cubit,
      act: (cubit) {
        cubit.doIntent(
          GetAllExamsIntent(subjectId: ''),
        );
      },
      expect: () => [
        ExamState(getAllExamsStatus: Status.loading),
        ExamState(
          getAllExamsStatus: Status.success,
          exams: const [],
        ),
      ],
    );

    blocTest(
      'test do intent with Error get all exams intent',
      build: () => cubit,
      setUp: () {
        provideDummy<ApiResult<List<ExamEntity>?>>(
          Error<List<ExamEntity>?>(error: Exception()),
        );
        when(getAllExamsOnSubjectUseCase.execute(any)).thenAnswer(
          (_) async => Error<List<ExamEntity>?>(error: Exception()),
        );
      },
      act: (cubit) {
        cubit.doIntent(
          GetAllExamsIntent(subjectId: ''),
        );
      },
      expect: () => [
        ExamState(getAllExamsStatus: Status.loading),
        ExamState(
          getAllExamsStatus: Status.error,
          error: Exception(),
        ),
      ],
    );
  });
}
