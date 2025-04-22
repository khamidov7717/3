import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_skill_datasource.dart';
import 'package:top_jobs/model/users/skills_model.dart';

class UserSkillController {
  final UserSkillDatasource _datasource;

  UserSkillController({required String contact})
    : _datasource = UserSkillDatasource(contact: contact);

  Future<SkillsModel> getSkillData() async {
    final data = await _datasource.getData();
    return data;
  }

  Future<void> saveSkillData({
    required SkillsModel skillsModel ,
  }) async {
    await _datasource.setData(skillsModel: skillsModel);
  }

  Future<void> editSkillData({
    required String id,
    required SkillsModel  skillsModel,
  }) async {
    await _datasource.editData(skillsModel: skillsModel);
  }
}
