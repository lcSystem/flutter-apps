class HabitLog {
  final int? id;
  final int habitId;
  final String completedAt;
  final int xpEarned;
  final int synced;

  HabitLog({this.id, required this.habitId, required this.completedAt, required this.xpEarned, this.synced = 0});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'habit_id': habitId,
      'completed_at': completedAt,
      'xp_earned': xpEarned,
      'synced': synced,
    };
  }

  factory HabitLog.fromMap(Map<String, dynamic> map) {
    return HabitLog(
      id: map['id'],
      habitId: map['habit_id'],
      completedAt: map['completed_at'],
      xpEarned: map['xp_earned'],
      synced: map['synced'],
    );
  }
}