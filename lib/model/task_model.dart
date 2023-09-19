class TaskModel {
  int? id;
  String? title;
  String? notes;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? remind;
  int? color;
  String? repeat;

  TaskModel({
    this.id,
    required this.title,
    required this.notes,
    required this.isCompleted,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.remind,
    required this.repeat,
    required this.color,
  });

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    notes = json["notes"];
    isCompleted = json["isCompleted"];
    date = json["date"];
    startTime = json["startTime"];
    endTime = json["endTime"];
    remind = json["remind"];
    repeat = json["repeat"];
    color = json["color"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['notes'] = notes;
    data['isCompleted'] = isCompleted;

    data['date'] = date;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['remind'] = remind;
    data["repeat"] = repeat;
     data["color"] = color;
    return data;
  }
}
