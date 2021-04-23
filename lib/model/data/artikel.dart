import 'package:equatable/equatable.dart';

class Artikel extends Equatable {
  final String? title;
  final String? description;
  final String? images;

  Artikel({this.title, this.description, this.images});

  factory Artikel.fromJson(Map<String, dynamic> json) {
    return Artikel(
        title: json['title'],
        description: json['description'],
        images: json['images']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['images'] = images;
    return data;
  }

  @override
  List<Object?> get props => [title, description, images];
}
