class AdminModel {
  final String contact;
  final String password;
  Map<String, dynamic> models() {
    return {
      "aboutCompany": {},
      "applied": [],
      "jobs": {},
      "sign": {"contact": contact, "password": password},
    };
  }

  AdminModel({
    required this.contact,
    required this.password,
  });
}
