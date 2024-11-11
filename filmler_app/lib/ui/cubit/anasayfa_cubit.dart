import 'package:filmler_app/data/entity/filmler.dart';
import 'package:filmler_app/data/repo/filmlerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Filmler>>{
  AnasayfaCubit():super(<Filmler>[]);

  var frepo = FilmlerDaoRepository();

  Future<void> filmleriYukle() async {
    var list = await frepo.filmleriYukle();
    emit(list);
  }
}