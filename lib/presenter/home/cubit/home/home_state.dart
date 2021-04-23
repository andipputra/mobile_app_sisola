part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState{}

class HomeLoaded extends HomeState {
  final List<Artikel> artikel;
  final List<Promo> promo;

  HomeLoaded(this.artikel, this.promo);

  @override
  List<Object> get props => [artikel, promo];
}

class HomeFailure extends HomeState {
  final String error;

  HomeFailure(this.error);

  @override
  List<Object> get props => [error];
}
