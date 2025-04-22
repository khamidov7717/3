import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_jobs/model/admins/job_model.dart';

class AdminJobDatacource {
  final String contact;

  AdminJobDatacource({required this.contact});

  Future<List<JobModel>> getData() async {
    List<JobModel> datas = [];
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$contact/jobs.json",
    );
    final data = await http.get(url);
    final decodedData = jsonDecode(data.body) as Map;
    final keys = decodedData.keys;
    for (var i in keys) {
      decodedData[i]["id"] = i;
      datas.add(JobModel.fromJson(decodedData[i]));
    }
    return datas;
  }

  Future<void> setData({required JobModel jobModel}) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$contact/jobs.json",
    );
    await http.post(url, body: jobModel.toJson());
  }

  Future<void> editData({
    required String id,
    required JobModel jobModel,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$contact/jobs/$id.json",
    );
    await http.put(url, body: jobModel.toJson());
  }

  Future<void> delete({required String id}) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$contact/jobs/$id.json",
    );
    await http.delete(url);
  }
}
