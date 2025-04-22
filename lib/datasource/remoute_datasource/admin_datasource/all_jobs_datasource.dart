import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_jobs/model/admins/job_model.dart';

class AllJobsDatasource {
  Future<List<JobModel>> getData() async {
    List<JobModel> jobs = [];
    final uri = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins.json",
    );
    final data = await http.get(uri);
    final decodedData = jsonDecode(data.body) as Map;

    final keys = decodedData.keys.toList();
    for (var i in keys) {
      List keylar =
          (decodedData[i]["jobs"] as Map).keys.toList();
      for (var j in keylar) {
        decodedData[i]["jobs"][j]["companyId"] = i;
        decodedData[i]["jobs"][j]["id"]= j;
        JobModel job = JobModel.fromJson(
          decodedData[i]["jobs"][j],
        );

        jobs.add(job);
      }
    }
    return jobs;
  }
}
