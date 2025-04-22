
class AboutCompanyModel {
    final String companyBio;
    final String companyImage;
    final String employees;
    final String location;
    final String name;

    AboutCompanyModel({
        required this.companyBio,
        required this.companyImage,
        required this.employees,
        required this.location,
        required this.name,
    });

    AboutCompanyModel copyWith({
        String? companyBio,
        String? companyImage,
        String? employees,
        String? location,
        String? name,
    }) => 
        AboutCompanyModel(
            companyBio: companyBio ?? this.companyBio,
            companyImage: companyImage ?? this.companyImage,
            employees: employees ?? this.employees,
            location: location ?? this.location,
            name: name ?? this.name,
        );

    factory AboutCompanyModel.fromJson(Map<String, dynamic> json) => AboutCompanyModel(
        companyBio: json["companyBio"],
        companyImage: json["companyImage"],
        employees: json["employees"],
        location: json["location"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "companyBio": companyBio,
        "companyImage": companyImage,
        "employees": employees,
        "location": location,
        "name": name,
    };
}
