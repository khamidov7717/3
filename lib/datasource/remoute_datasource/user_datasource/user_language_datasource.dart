import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_jobs/model/users/language_model.dart';

class UserLanguageDatasource {
  final String contact;

  UserLanguageDatasource({required this.contact});
  Future<List<LanguageModel>> getData() async {
    List<LanguageModel> datas = [];
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/language.json",
    );
    final data = await http.get(url);
    final decodedData = jsonDecode(data.body) as Map;
    final keys = decodedData.keys;
    for (var i in keys) {
      decodedData[i]["id"] = i;
      datas.add(LanguageModel.fromJson(decodedData[i]));
    }
    return datas;
  }

  Future<void> setData({
    required LanguageModel languageModel,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/language.json",
    );
    await http.post(url, body: languageModel.toJson());
  }

  Future<void> editData({
    required String id,
    required LanguageModel languageModel,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/language/$id.json",
    );
    await http.put(url, body: languageModel.toJson());
  }


  Future<void> delete({required String id}) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/language/$id.json",
    );
    await http.delete(url);
  }
}
