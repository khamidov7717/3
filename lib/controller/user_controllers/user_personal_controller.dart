import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_personal_datasource.dart';
import 'package:top_jobs/model/users/personal_model.dart';

class UserPersonalController {
  final UserPersonalDatasource _datasource;

  UserPersonalController({required String contact})
    : _datasource = UserPersonalDatasource(contact: contact);

  Future<PersonalModel> getPersonalData() async {
    final data = await _datasource.getData();
    return data;
  }

  Future<void> savePersonalData({
    required PersonalModel personalModel,
  }) async {
    await _datasource.setData(personalModel: personalModel);
  }

  Future<void> editPersonalData({
    required String id,
    required PersonalModel personalModel,
  }) async {
    await _datasource.editData(personalModel: personalModel);
  }
}
