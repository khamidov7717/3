import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_education_datasource.dart';
import 'package:top_jobs/model/users/education_model.dart';

class UserEducationController {
  final UserEducationDatasource _datasource;

  UserEducationController({required String contact})
      : _datasource = UserEducationDatasource(contact: contact);

  Future<List<EducationModel>> getEducationData() async {
    final data = await _datasource.getData();
    return data;
  }

  Future<void> saveEducationData({required EducationModel educationModel}) async {
    await _datasource.setData(educationName: educationModel);
  }

  Future<void> editEducationData({
    required String id,
    required EducationModel educationModel,
  }) async {
    await _datasource.editData(id: id, educationName: educationModel);
  }

  Future<void> deleteEducationData({required String id}) async {
    await _datasource.delete(id: id);
  }
}
