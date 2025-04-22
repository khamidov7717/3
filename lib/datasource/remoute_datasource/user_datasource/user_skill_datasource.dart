import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_jobs/model/users/skills_model.dart';

class UserSkillDatasource {
  final String contact;

  UserSkillDatasource({required this.contact});
  Future<SkillsModel> getData() async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/skill.json",
    );
    final data = await http.get(url);
    final decodedData = jsonDecode(data.body);
    return SkillsModel.fromJson(decodedData);
  }

  Future<void> setData({
    required SkillsModel skillsModel,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/skill.json",
    );
    await http.patch(
      url,
      body: jsonEncode({skillsModel.toJson()}),
    );
  }

  Future<void> editData({
    required SkillsModel skillsModel,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/skill.json",
    );
    await http.put(url, body: skillsModel.toJson());
  }
}
