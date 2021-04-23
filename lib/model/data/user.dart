import 'package:equatable/equatable.dart';

class User extends Equatable {
//   late final String? id;
  final String? nik;
  final String? name;
  // late final String? email;
  // late final String? password;
  final String? location;
  final String? dateOfBirth;
  // late final String? createdTimestamp;
  // late final String? updatedTimestamp;
  // late final String? lastLogin;
  // late final String? active;

  User({
    // this.id,
    this.nik,
    this.name,
    // this.email,
    // this.password,
    this.location,
    this.dateOfBirth,
    // this.createdTimestamp,
    // this.updatedTimestamp,
    // this.lastLogin,
    // this.active
    // }
  });

  // factory Artikel.fromJson(Map<String, dynamic> json) {
  //   return Artikel(
  //       title: json['title'],
  //       description: json['description'],
  //       images: json['images']);
  // }

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
        nik: json['nik'],
        name: json['name'],
        location: json['location'],
        dateOfBirth: json['date_of_birth']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    // data['id'] = id;
    data['nik'] = nik;
    data['name'] = name;
    // data['email'] = email;
    // data['password'] = password;
    data['location'] = location;
    data['date_of_birth'] = dateOfBirth;
    // data['created_timestamp'] = createdTimestamp;
    // data['updated_timestamp'] = updatedTimestamp;
    // data['last_login'] = lastLogin;
    // data['active'] = active;
    return data;
  }

  @override
  List<Object?> get props => [
        // id,
        nik,
        name,
        // email,
        // password,
        location,
        dateOfBirth,
        // createdTimestamp,
        // updatedTimestamp,
        // lastLogin,
        // active
      ];
}
