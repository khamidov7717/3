import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_experiance_datasource.dart';
import 'package:top_jobs/model/users/experience_model.dart';

class UserExperienceController {
  final UserExperianceDatasource _datasource;

  UserExperienceController({required String contact})
    : _datasource = UserExperianceDatasource(contact: contact);

  Future<List<ExperienceModel>> getExperienceData() async {
    final data = await _datasource.getData();
    return data;
  }

  Future<void> saveExperienceData({
    required ExperienceModel experienceModel,
  }) async {
    await _datasource.setData(experienceModel: experienceModel);
  }

  Future<void> editExperienceData({
    required String id,
    required ExperienceModel experienceModel,
  }) async {
    await _datasource.editData(id: id, experienceModel: experienceModel);
  }

  Future<void> deleteExperienceData({required String id}) async {
    await _datasource.delete(id: id);
  }
}
