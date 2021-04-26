import 'package:equatable/equatable.dart';

class Produk extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final String? link;
  final String? images;

  Produk({
    this.id,
    this.title,
    this.description,
    this.link,
    this.images,
  });

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        link: json['link'],
        images: json['images']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['link'] = link;
    data['images'] = images;
    return data;
  }

  @override
  List<Object?> get props => [id, title, description, link, images];
}
