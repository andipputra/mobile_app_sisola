import 'package:equatable/equatable.dart';

class Promo extends Equatable{
  late final String? title;
  late final String? description;
  late final String? images;

  Promo({ this.title,  this.description,  this.images});

  Promo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['images'] = images;
    return data;
  }

  @override
  List<Object?> get props => [title,description,images];
}