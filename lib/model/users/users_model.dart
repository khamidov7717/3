class UsersModel {
  final String contact;
  final String password;

  Map<String, dynamic> models() {
    return {
      "profile": {
        "education": {},
        "experience": {},
        "history": {},
        "language": {},
        "personal": {},
      },
      "sign": {"contact": contact, "password": password},
    };
  }

  UsersModel({
    required this.contact,
    required this.password,
  });
}
