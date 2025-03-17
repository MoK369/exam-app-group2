import 'package:exam_app_group2/modules/home/domain/entities/cahed_questions/cashed_questions_entity.dart';
import 'package:exam_app_group2/storage/contracts/isar_storage_service_cashed_question_entity_contract.dart';
import 'package:injectable/injectable.dart';

import '../data_source_contracts/questions_offline_data_source.dart';

@Injectable(as: QuestionsOfflineDataSource)
class QuestionsOfflineDataSourceImpl implements QuestionsOfflineDataSource {
  IsarStorageServiceCachedQuestionEntity<CashedQuestions> database;

  QuestionsOfflineDataSourceImpl({required this.database});

  @override
  Future<void> saveCashedQuestions(CashedQuestions cashedQuestions) async {
    await database.write(cashedQuestions);
  }

  @override
  Future<List<CashedQuestions>?> getCashedQuestionsAndAnswers() {
    return database.get();
  }
}
