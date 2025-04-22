import 'package:top_jobs/controller/all_job_controller/all_jobs_controller.dart';
import 'package:top_jobs/controller/user_controllers/about_company_controller.dart';
import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/about_company_datasource.dart';
import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/admin_job_datacource.dart';
import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/comment_datasource.dart';
import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_register_datasource.dart';

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
