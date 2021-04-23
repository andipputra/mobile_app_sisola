part of 'artikelhome_cubit.dart';

abstract class ArtikelhomeState extends Equatable {
  const ArtikelhomeState();

  @override
  List<Object> get props => [];
}

class ArtikelhomeInitial extends ArtikelhomeState {}

class ArtikelhomeLoading extends ArtikelhomeState {}

class ArtikelhomeLoaded extends ArtikelhomeState {
  final List<Promo> listPromo;

  ArtikelhomeLoaded(this.listPromo);

  @override
  List<Object> get props => [listPromo];
}

class ArtikelhomeFailure extends ArtikelhomeState {
  final String error;

  ArtikelhomeFailure(this.error);

  @override
  List<Object> get props => [error];
}
