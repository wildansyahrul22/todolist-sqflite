class User {
  int? id;
  String? name;
  String? email;
  String? nohp;
  String? createdAt;
  String? updateAt;

  User({
    this.id,
    this.name,
    this.email,
    this.nohp,
    this.createdAt,
    this.updateAt,
  });

  Map<String?, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'nohp': nohp,
      'created_at': createdAt,
      "updated_at": updateAt,
    };
  }

  factory User.fromJson(Map<String, dynamic> jsonD) {
    return User(
      id: jsonD['id'],
      name: jsonD['name'],
      email: jsonD['email'],
      nohp: jsonD['nohp'],
      createdAt: jsonD['created_at'],
      updateAt: jsonD['updated_at'],
    );
  }

  // static User? jsonFromDB(Map<String, dynamic>? jsonD) {
  //   if (jsonD == null || jsonD.isEmpty) return null;

  //   return User(
  //     id: jsonD['id'],
  //     name: jsonD['name'],
  //     email: jsonD['email'],
  //     nohp: jsonD['nohp'],
  //     createdAt: jsonD['created_at'],
  //     updateAt: jsonD['updated_at'],
  //   );
  // }

  @override
  String toString() {
    return '''User{
      id: $id,
      name: $name,
      email: $email,
      nohp: $nohp,
      createdAt: $createdAt,
      updateAt: $updateAt
    }''';
  }
}
