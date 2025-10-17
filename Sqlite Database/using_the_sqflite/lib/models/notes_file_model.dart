class NotesFileModel {
  int? sNo;
  String? title;
  String? description;

  NotesFileModel({this.sNo, this.title, this.description});

  Map<String, dynamic> toJson() => {
    's_no': sNo,
    'title': title,
    'desc': description,
  };

  factory NotesFileModel.fromJson(Map<String, dynamic> json) {
    return NotesFileModel(
      sNo: json['s_no'],
      title: json['title'],
      description: json['desc'],
    );
  }
}
