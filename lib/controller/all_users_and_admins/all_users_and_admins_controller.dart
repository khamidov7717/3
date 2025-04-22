import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_register_datasource.dart';

class AllUsersAndAdminsController {
  Future<List<String>> getData()async{
    List <String> members = [];
   final users = await UserRegisterDatasource().getData();
   for(var i in users){
    members.add(i.contact);
   }
   final admins = await UserRegisterDatasource().getData();
   for(var i in admins){
    members.add(i.contact);
   }
    return members;
  }
}