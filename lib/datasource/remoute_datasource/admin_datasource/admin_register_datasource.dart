import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_jobs/model/admins/admin_model.dart';
import 'package:top_jobs/model/sign_model.dart';

class AdminRegisterDatasource {
  Future<List<SignModel>> getData() async {
    List<SignModel> usersSign = [];
    final uri = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins.json",
    );

    final data = await http.get(uri);
    final decodedData = jsonDecode(data.body) as Map;
    final keys = decodedData.keys.toList();
    for (var i in keys) {
      decodedData[i]["sign"]["id"] = i;
      usersSign.add(
        SignModel.fromJson(decodedData[i]["sign"]),
      );
    }
    return usersSign;
  }

  Future<String> setData({
    required String contact,
    required String password,
  }) async {
    final uri = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins.json",
    );

    AdminModel adminModel = AdminModel(
      contact: contact,
      password: password,
    );

    final response = await http.post(
      uri,
      body: jsonEncode(adminModel.models()),
    );
    final responseData = json.decode(response.body);
    final generatedId = responseData['name'];
    return generatedId;
  }

  Future<void> editPasword({
    required String contact,
    required String password,
  }) async {
    final uri = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$contact/sign.json",
    );
    http.patch(
      uri,
      body: jsonEncode({"password": password}),
    );
  }
}
