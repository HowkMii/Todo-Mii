class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endtTime;
  int? color;
  int? remind;
  String? repeat;
  Task(
      {this.id,
      this.title,
      this.note,
      this.isCompleted,
      this.date,
      this.startTime,
      this.endtTime,
      this.color,
      this.remind,
      this.repeat});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'isCompleted': isCompleted,
      'date': date,
      'startTime': startTime,
      'endtTime': endtTime,
      'color': color,
      'remind': remind,
      'repeat': repeat,
    };
  }

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    note = json['note'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    startTime = json['startTime'];
    endtTime = json['endtTime'];
    color = json['color'];
    remind = json['remind'];
    repeat = json['repeat'];
  }
}
