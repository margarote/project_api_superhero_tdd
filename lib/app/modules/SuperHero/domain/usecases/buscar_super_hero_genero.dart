import 'package:dartz/dartz.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_all_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroFiltrarGeneroError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/repository/repository_superhero.dart';

abstract class BuscarSuperHeroGenero {
  Either<SuperHeroAllFiltrarGeneroError, List<SuperHeroModel>> execute(
      List<SuperHeroModel>? list, String? genero);
}

class IBuscarSuperHeroGenero implements BuscarSuperHeroGenero {
  final RepositorySuperHero repositorySuperHero;

  IBuscarSuperHeroGenero(this.repositorySuperHero);
  @override
  Either<SuperHeroAllFiltrarGeneroError, List<SuperHeroModel>> execute(
      List<SuperHeroModel>? list, String? genero) {
    if (list != null && genero != null) {
      if (list.length > 0) {
        if (genero.isNotEmpty) {
          return repositorySuperHero.filtrarGeneroSuperHeroAll(list, genero);
        }
      }
    }
    return repositorySuperHero.filtrarGeneroSuperHeroAll(list, genero);
  }
}
