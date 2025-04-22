import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_jobs/model/admins/grade_model.dart';

class AdminGradeDatasource {
  final String contact;
  final String companyId;
    final String jobId;


  AdminGradeDatasource({required this.contact,required this.companyId,required this.jobId});


  Future<List<GradeModel>> getData(
  ) async {
    List<GradeModel> datas = [];
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$companyId/jobs/$jobId/grade.json",
    );
    final data = await http.get(url);
    final decodedData = jsonDecode(data.body) as Map;
    final keys = decodedData.keys;
    for (var i in keys) {
      decodedData[i]["id"] = i;
      datas.add(GradeModel.fromJson(decodedData[i]));
    }
    return datas;
  }

  Future<void> setData({required GradeModel gradeModel}) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$companyId/jobs/$jobId/grade.json",
    );
    await http.post(url, body: gradeModel.toJson());
  }

  Future<void> editData({
    required String id,
    required GradeModel gradeModel,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$contact/jobs/$jobId/grade/$id.json",
    );
    await http.put(url, body: gradeModel.toJson());
  }

  Future<void> delete({required String id}) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$contact/jobs/$jobId/grade/$id.json",
    );
    await http.delete(url);
  }
}
