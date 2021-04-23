import 'package:equatable/equatable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuLayanan extends Equatable {
  final FaIcon icon;
  final String name;
  final String route;

  MenuLayanan({required this.icon, required this.name, required this.route});

  @override
  List<Object?> get props => [icon,name,route];
}