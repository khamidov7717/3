import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_language_datasource.dart';
import 'package:top_jobs/model/users/language_model.dart';

class UserLanguageController {
  final UserLanguageDatasource _datasource;

  UserLanguageController({required String contact})
    : _datasource = UserLanguageDatasource(contact: contact);

  Future<List<LanguageModel>> getLanguageData() async {
    final data = await _datasource.getData();
    return data;
  }

  Future<void> saveLanguageData({
    required LanguageModel languageModel,
  }) async {
    await _datasource.setData(languageModel: languageModel);
  }

  Future<void> editLanguageData({
    required String id,
    required LanguageModel languageModel,
  }) async {
    await _datasource.editData(id: id, languageModel: languageModel);
  }

  Future<void> deleteLanguageData({required String id}) async {
    await _datasource.delete(id: id);
  }
}
