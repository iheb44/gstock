final String tableUsers = 'Users';

class Userfiled {
  static final List<String> values = [id, username, password, phone];
  static final String id = '_id';
  static final String username = 'username';
  static final String password = 'password';
  static final String phone = 'phone';
}

class User {
  final int? id;
  final String username;
  final String password;
  final String phone;

  const User({
    this.id,
    required this.username,
    required this.password,
    required this.phone,
  });
  static User fromJson(Map<String, Object?> json) => User(
        id: json[Userfiled.id] as int?,
        username: json[Userfiled.username] as String,
        password: json[Userfiled.password] as String,
        phone: json[Userfiled.phone] as String,
      );

  Map<String, Object?> toJson() => {
        Userfiled.id: id,
        Userfiled.username: username,
        Userfiled.password: password,
        Userfiled.phone: phone
      };
  User copy({int? id}) => User(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        phone: phone ?? this.phone,
      );
}
