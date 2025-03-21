// import 'dart:developer';
//
// import 'package:bloc_test/bloc_test.dart';
// import 'package:exam_app_group2/core/api/api_result/api_result.dart';
// import 'package:exam_app_group2/modules/home/UI/layouts/explore_layout/view_model/questions/questions_cubit.dart';
// import 'package:exam_app_group2/modules/home/domain/entities/question_entity.dart';
// import 'package:exam_app_group2/modules/home/domain/use_cases/check_questions.dart';
// import 'package:exam_app_group2/modules/home/domain/use_cases/get_all_questions.dart';
// import 'package:exam_app_group2/modules/home/domain/use_cases/get_cashed_question.dart';
// import 'package:exam_app_group2/modules/home/domain/use_cases/save_questions.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// import 'questions_cubit_test.mocks.dart';
//
// @GenerateMocks([
//   GetAllQuestionsUseCase,
//   CheckQuestionsUseCase,
//   SaveQuestionsUseCase,
//   GetCashedQuestionUseCase,
// ])
// void main() {
//   group('questions cubit', () {
//     late QuestionsCubit cubit;
//     late MockGetAllQuestionsUseCase getAllQuestionsUseCase;
//     late MockCheckQuestionsUseCase checkQuestionsUseCase;
//     late MockSaveQuestionsUseCase saveQuestionsUseCase;
//     late MockGetCashedQuestionUseCase getCashedQuestionUseCase;
//     setUp(() {
//       getAllQuestionsUseCase = MockGetAllQuestionsUseCase();
//       checkQuestionsUseCase = MockCheckQuestionsUseCase();
//       saveQuestionsUseCase = MockSaveQuestionsUseCase();
//       getCashedQuestionUseCase = MockGetCashedQuestionUseCase();
//       cubit = QuestionsCubit(
//         getAllQuestionsUseCase: getAllQuestionsUseCase,
//         checkQuestionsUseCase: checkQuestionsUseCase,
//         saveQuestionsUseCase: saveQuestionsUseCase,
//         getCashedQuestionUseCase: getCashedQuestionUseCase,
//       );
//     });
//
//     group('get all questions', () {
//       blocTest('get all questions success ',
//           build: () => cubit,
//           setUp: () {
//             provideDummy<ApiResult<List<QuestionEntity>?>>(
//               Success<List<QuestionEntity>?>(data: []),
//             );
//             when(getAllQuestionsUseCase.execute(examId: '')).thenAnswer(
//               (_) async => Success<List<QuestionEntity>?>(
//                 data: [],
//               ),
//             );
//           },
//           act: (cubit) {
//             cubit.doIntent(
//               GetAllQuestionsIntent(examId: ''),
//             );
//           },
//           expect: () => [
//                 QuestionsState(
//                   getAllQuestionsStatus: Status.loading,
//                 ),
//                 QuestionsState(
//                   getAllQuestionsStatus: Status.success,
//                   questions: const [],
//                 ),
//               ]);
//
//       blocTest(
//         'get all questions error ',
//         build: () => cubit,
//         setUp: () {
//           provideDummy<ApiResult<List<QuestionEntity>?>>(
//             Error<List<QuestionEntity>?>(error: ''),
//           );
//           when(getAllQuestionsUseCase.execute(examId: '')).thenAnswer(
//             (_) async => Error<List<QuestionEntity>?>(
//               error: '',
//             ),
//           );
//         },
//         act: (cubit) {
//           cubit.doIntent(
//             GetAllQuestionsIntent(examId: ''),
//           );
//         },
//         expect: () => [
//           QuestionsState(
//             getAllQuestionsStatus: Status.loading,
//           ),
//           QuestionsState(
//             getAllQuestionsStatus: Status.error,
//             error: '',
//           ),
//         ],
//       );
//     });
//     group('next question intent', () {
//       late int currentQuestion;
//       blocTest(
//         'next question true',
//         build: () => cubit,
//         setUp: () {
//           currentQuestion = 1;
//         },
//         act: (cubit) {
//           cubit.doIntent(
//             NextQuestionIntent(
//               currentQuestion: currentQuestion,
//               questions: [],
//             ),
//           );
//         },
//         expect: () => [
//           QuestionsState(
//             questionsStatus: QuestionsStatus.nextQuestion,
//             currentQuestion: currentQuestion + 1,
//           )
//         ],
//       );
//
//       blocTest(
//         'next question false',
//         build: () => cubit,
//         setUp: () {
//           currentQuestion = 0;
//         },
//         act: (cubit) {
//           cubit.doIntent(
//             NextQuestionIntent(
//               currentQuestion: currentQuestion,
//               questions: [],
//             ),
//           );
//         },
//         expect: () => [
//           QuestionsState(
//             questionsStatus: QuestionsStatus.endExam,
//           ),
//         ],
//       );
//     });
//     group('previous question intent ', () {
//       late int currentQuestion;
//       blocTest(
//         'previous question true',
//         build: () => cubit,
//         setUp: () {
//           currentQuestion = 2;
//         },
//         act: (cubit) {
//           cubit.doIntent(
//             PreviousQuestionIntent(
//               currentQuestion: currentQuestion,
//             ),
//           );
//         },
//         expect: () => [
//           QuestionsState(
//             questionsStatus: QuestionsStatus.previousQuestion,
//             currentQuestion: currentQuestion - 1,
//           )
//         ],
//       );
//
//       blocTest(
//         'next question false',
//         build: () => cubit,
//         setUp: () {
//           currentQuestion = 1;
//         },
//         act: (cubit) {
//           cubit.doIntent(
//             PreviousQuestionIntent(
//               currentQuestion: currentQuestion,
//             ),
//           );
//         },
//         expect: () => [
//           QuestionsState(
//             questionsStatus: QuestionsStatus.previousQuestion,
//             currentQuestion: currentQuestion,
//           )
//         ],
//       );
//     });
//   });
// }
