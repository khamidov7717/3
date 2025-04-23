import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/about_company_datasource.dart';
import 'package:top_jobs/model/admins/about_company_model.dart';

class AdminAboutCompanyController {
  final AboutCompanyDatasource _datasource;

  AdminAboutCompanyController({required String contact})
    : _datasource = AboutCompanyDatasource(contact: contact);

  Future<AboutCompanyModel> getAboutcompanyData() async {
    final data = await _datasource.getData();
    return data;
  }
  Future<void> saveAboutcampanyData({
    required AboutCompanyModel aboutCompanyModel,
  }) async {
    await _datasource.setData(aboutCompanyModel: aboutCompanyModel);
  }

  Future<void> editAboutcompanyData({
    required String id,
    required AboutCompanyModel aboutCompanyModel,
  }) async {
    await _datasource.editData(aboutCompanyModel: aboutCompanyModel);
  }
}