class SignModel {
  final String contact;
  final String password;
  final String id;

  SignModel({
    required this.id,
    required this.contact,
    required this.password,
  });

  SignModel copyWith({String? contact, String? password}) =>
      SignModel(
        id: id,
        contact: contact ?? this.contact,
        password: password ?? this.password,
      );

  factory SignModel.fromJson(Map<String, dynamic> json) =>
      SignModel(
        id: json["id"],
        contact: json["contact"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
    "contact": contact,
    "password": password,
  };
}
