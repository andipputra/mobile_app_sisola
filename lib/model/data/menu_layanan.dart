import 'package:equatable/equatable.dart';

class MenuLayanan extends Equatable {
  final String icon;
  final String name;
  final String route;

  MenuLayanan({required this.icon, required this.name, required this.route});

  @override
  List<Object?> get props => [icon,name,route];
}