import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_jobs/model/admins/about_company_model.dart';

class AboutCompanyDatasource {
  final String contact;

  AboutCompanyDatasource({required this.contact});
  Future<AboutCompanyModel> getData() async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$contact/aboutCompany.json",
    );
    final data = await http.get(url);
    final decodedData = jsonDecode(data.body);
    return AboutCompanyModel.fromJson(decodedData);
  }

  Future<void> setData({
    required AboutCompanyModel aboutCompanyModel,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$contact/aboutCompany.json",
    );
    await http.patch(
      url,
      body: jsonEncode({aboutCompanyModel.toJson()}),
    );
  }

  Future<void> editData({
    required AboutCompanyModel aboutCompanyModel,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$contact/aboutCompany.json",
    );
    await http.put(url, body: aboutCompanyModel.toJson());
  }
}
