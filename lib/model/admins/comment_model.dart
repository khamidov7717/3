
class CommentModel {
    final String coment;
    final String contact;

    CommentModel({
        required this.coment,
        required this.contact,
    });

    CommentModel copyWith({
        String? coment,
        String? contact,
    }) => 
        CommentModel(
            coment: coment ?? this.coment,
            contact: contact ?? this.contact,
        );

    factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        coment: json["coment"],
        contact: json["contact"],
    );

    Map<String, dynamic> toJson() => {
        "coment": coment,
        "contact": contact,
    };
}
