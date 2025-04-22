import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_jobs/model/sign_model.dart';
import 'package:top_jobs/model/users/users_model.dart';

class UserRegisterDatasource {
  Future<List<SignModel>> getData() async {
    List<SignModel> usersSign = [];
    final uri = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users.json",
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
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users.json",
    );

    UsersModel usersModel = UsersModel(
      contact: contact,
      password: password,
    );

    final response = await http.post(
      uri,
      body: jsonEncode(usersModel.models()),
    );
    final responseData = json.decode(response.body);
    final generatedId = responseData['name'];
    return generatedId;
  }

  Future<void> editPasswordByContact({
    required String contact,
    required String newPassword,
  }) async {
    try {
      // 1. Avval barcha foydalanuvchilarni olish
      List<SignModel> allUsers = await getData();

      // 2. Kontakt bo'yicha foydalanuvchini qidirish
      String? userId;
      for (var user in allUsers) {
        if (user.contact == contact) {
          userId = user.id;
          break;
        }
      }

      // 3. Agar foydalanuvchi topilmasa, false qaytarish
      if (userId == null) {
        return;
      }

      // 4. Foydalanuvchi topilgan bo'lsa, parolni o'zgartirish
      final uri = Uri.parse(
        "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$userId/sign.json",
      );

      await http.patch(
        uri,
        body: jsonEncode({"password": newPassword}),
      );
    } catch (e) {
      return;
    }
  }
}
