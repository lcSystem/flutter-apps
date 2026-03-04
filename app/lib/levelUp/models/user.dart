class User {
  final int? id;
  final String username;
  final String email;
  final int xp;
  final int synced;

  User({this.id, required this.username, required this.email, this.xp = 0, this.synced = 0});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'xp': xp,
      'synced': synced,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      xp: map['xp'],
      synced: map['synced'],
    );
  }
}