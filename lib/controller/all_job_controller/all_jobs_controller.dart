import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/all_jobs_datasource.dart';
import 'package:top_jobs/model/admins/job_model.dart';

class AllJobsController {
  AllJobsDatasource allJobsDatasource = AllJobsDatasource();
  Future<List<JobModel>> getData()async{
   return allJobsDatasource.getData();
  }
}