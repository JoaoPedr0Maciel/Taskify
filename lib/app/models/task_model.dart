class TaskModel {
  String? id;
  String? title;
  bool? isDone;

  TaskModel({this.id, this.title, this.isDone});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isDone = json['isDone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['isDone'] = this.isDone;
    return data;
  }
}
