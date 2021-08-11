class Student {
  late String name;
  late String std;
  late String school;
  late String board;
  void createStudent(String name, String std, String school, String board) {
    this.name = name;
    this.std = std;
    this.school = school;
    this.board = board;
  }

  Map<String, String> toJson() =>
      {'Name': name, 'Class': std, 'School': school, 'Board': board};
}
