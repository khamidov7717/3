import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/about_company_datasource.dart';
import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/admin_job_datacource.dart';

void main(List<String> args) {
  AdminJobDatacource(contact: "admin1").getData().then((
    value,
  ) {
    print(value);
  });
  AboutCompanyDatasource(contact: "admin1").getData().then((
    value,
  ) {
    print(value.companyBio);
  });
}
