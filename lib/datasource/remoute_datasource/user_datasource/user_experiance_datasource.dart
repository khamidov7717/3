import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_jobs/model/users/experience_model.dart';

class UserExperianceDatasource {
  final String contact;

  UserExperianceDatasource({required this.contact});
  Future<List<ExperienceModel>> getData() async {
    List<ExperienceModel> datas = [];
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/experience.json",
    );
    final data = await http.get(url);
    final decodedData = jsonDecode(data.body) as Map;
    final keys = decodedData.keys;
    for (var i in keys) {
      decodedData[i]["id"] = i;
      datas.add(ExperienceModel.fromJson(decodedData[i]));
    }
    return datas;
  }

  Future<void> setData({
    required ExperienceModel experienceModel,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/experience.json",
    );
    await http.post(url, body: experienceModel.toJson());
  }

  Future<void> editData({
    required String id,
    required ExperienceModel experienceModel,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/experience/$id.json",
    );
    await http.put(url, body: experienceModel.toJson());
  }


  Future<void> delete({required String id}) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/experience/$id.json",
    );
    await http.delete(url);
  }
}
