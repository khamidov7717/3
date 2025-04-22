import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_register_datasource.dart';
import 'package:top_jobs/model/sign_model.dart';

class UserRegisterController {
  final userRegisterDatasource = UserRegisterDatasource();

  Future<String> saveRegisterData({required String email, required String password}) async{
   return userRegisterDatasource.setData(contact: email, password: password);
  }

  Future<List<SignModel>> getRegisterData() async {
    final userGetedData = await userRegisterDatasource.getData();
    return userGetedData;
  }

  void editRegisterData({required String email, required String password}) {
    userRegisterDatasource.editPasswordByContact(contact: email, newPassword: password);
  }
}
