class NotesModel {
  String? title;
  String? description;

  NotesModel({required this.title, required this.description});

  Map<String, dynamic> toJson() {
    return {"title": title, "description": description};
  }

  factory NotesModel.fromJson(Map<String, dynamic> json) {
    return NotesModel(title: json["title"], description: json["description"]);
  }
}
