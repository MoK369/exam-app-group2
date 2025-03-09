import 'package:exam_app_group2/modules/home/domain/entities/cahed_questions/cashed_questions_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../contracts/isar_storage_service_contract.dart';

@Injectable(as: IsarStorageService<CashedQuestions>)
class IsarStorageServiceCashedQuestionEntityImpl
    implements IsarStorageService<CashedQuestions> {
  Isar isar;

  IsarStorageServiceCashedQuestionEntityImpl({required this.isar});

  @override
  Future<List<CashedQuestions>?> get() {
    return isar.cashedQuestions.where().findAll();
  }

  @override
  Future<void> write(cashedQuestions) async {
    isar.writeTxn(() => isar.cashedQuestions.put(cashedQuestions));
  }
}
