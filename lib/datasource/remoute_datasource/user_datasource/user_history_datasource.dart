import 'dart:convert';

import 'package:top_jobs/model/users/history_model.dart';
import 'package:http/http.dart' as http;

class UserHistoryDatasource {
  final String contact;

  UserHistoryDatasource({required this.contact});
  Future<List<HistoryModel>> getData() async {
    List<HistoryModel> datas = [];
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/history.json",
    );
    final data = await http.get(url);
    final decodedData = jsonDecode(data.body) as Map;
    final keys = decodedData.keys;
    for (var i in keys) {
      decodedData[i]["id"] = i;
      datas.add(HistoryModel.fromJson(decodedData[i]));
    }
    return datas;
  }

  Future<void> setData({
    required HistoryModel historyModel,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/history.json",
    );
    await http.post(url, body: historyModel.toJson());
  }

  Future<void> delete({required String id}) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/history/$id.json",
    );
    await http.delete(url);
  }
}
