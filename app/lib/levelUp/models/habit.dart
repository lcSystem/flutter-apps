class Habit {
  final int? id;
  final int userId;
  final String title;
  final String createdAt;

  Habit({this.id, required this.userId, required this.title, required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'created_at': createdAt,
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      id: map['id'],
      userId: map['user_id'],
      title: map['title'],
      createdAt: map['created_at'],
    );
  }
}