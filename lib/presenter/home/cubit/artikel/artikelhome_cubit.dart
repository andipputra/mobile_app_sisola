import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_app_sisola/model/data/data.dart';

part 'artikelhome_state.dart';

class ArtikelhomeCubit extends Cubit<ArtikelhomeState> {
  ArtikelhomeCubit() : super(ArtikelhomeInitial());
}
