import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/about_company_datasource.dart';

class AboutCompanyController {
  final String contact;
  AboutCompanyController({required this.contact});

  AboutCompanyDatasource getInsatce(){
    return AboutCompanyDatasource(contact: contact);
  }
  Future<AboutCompanyModel> (){
    return getInsatce().getData();
  }
}