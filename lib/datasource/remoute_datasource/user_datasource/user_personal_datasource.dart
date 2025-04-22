import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_jobs/model/users/personal_model.dart';

class UserPersonalDatasource {
  final String contact;

  UserPersonalDatasource({required this.contact});
  Future<PersonalModel> getData() async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/personal.json",
    );
    final data = await http.get(url);
    final decodedData = jsonDecode(data.body);
    return PersonalModel.fromJson(decodedData);
  }

  Future<void> setData({
    required PersonalModel personalModel,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile.json",
    );
    await http.patch(
      url,
      body: jsonEncode({
        "personal": personalModel.toJson(),
      }),
    );
  }

  Future<void> editData({
    required PersonalModel personalModel,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/profile/personal.json",
    );
    await http.put(url, body: personalModel.toJson());
  }
}
