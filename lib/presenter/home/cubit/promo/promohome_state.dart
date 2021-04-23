part of 'promohome_cubit.dart';

abstract class PromohomeState extends Equatable {
  const PromohomeState();

  @override
  List<Object> get props => [];
}

class PromohomeInitial extends PromohomeState {}

class PromohomeLoading extends PromohomeState{}

class PromohomeLoaded extends PromohomeState {
  final List<Promo> listPromo;

  PromohomeLoaded(this.listPromo);

  @override
  List<Object> get props => [listPromo];
}

class PromohomeFailure extends PromohomeState {
  final String error;

  PromohomeFailure(this.error);

  @override
  List<Object> get props => [error];
}