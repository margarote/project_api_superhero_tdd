import 'package:dartz/dartz.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_all_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroFiltrarInteligenceError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/repository/repository_superhero.dart';

abstract class BuscarSuperHeroInteligence {
  Either<SuperHeroAllFiltrarInteligenceError, List<SuperHeroModel>> execute(
      List<SuperHeroModel>? list, String? inteligence);
}

class IBuscarSuperHeroInteligence implements BuscarSuperHeroInteligence {
  final RepositorySuperHero repositorySuperHero;

  IBuscarSuperHeroInteligence(this.repositorySuperHero);
  @override
  Either<SuperHeroAllFiltrarInteligenceError, List<SuperHeroModel>> execute(
      List<SuperHeroModel>? list, String? inteligence) {
    if (list != null && inteligence != null) {
      if (list.length > 0) {
        if (inteligence.isNotEmpty) {
          return repositorySuperHero.filtrarInteligenceSuperHeroAll(list, inteligence);
        }
      }
    }
    return repositorySuperHero.filtrarInteligenceSuperHeroAll(list, inteligence);
  }
}
