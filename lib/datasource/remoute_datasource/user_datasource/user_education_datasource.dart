import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_jobs/model/users/education_model.dart';

class UserEducationDatasource {
  final String contact;

  UserEducationDatasource({required this.contact});
  Future<List<EducationModel>> getData() async {
    List<EducationModel> datas = [];
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/education.json",
    );
    final data = await http.get(url);
    final decodedData = jsonDecode(data.body) as Map;
    final keys = decodedData.keys;
    for (var i in keys) {
      decodedData[i]["id"] = i;
      datas.add(EducationModel.fromJson(decodedData[i]));
    }
    return datas;
  }

  Future<void> setData({
    required EducationModel educationName,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/education.json",
    );
    await http.post(url, body: educationName.toJson());
  }

  Future<void> editData({
    required String id,
    required EducationModel educationName,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/education/$id.json",
    );
    await http.put(url, body: educationName.toJson());
  }


  Future<void> delete({required String id}) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/experience/$id.json",
    );
    await http.delete(url);
  }
}
