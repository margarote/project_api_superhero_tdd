import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_all_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroAllError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/repository/repository_superhero.dart';
import 'package:dartz/dartz.dart';


abstract class BuscarSuperHeroAll {
  Future<Either<SuperHeroAllError, List<SuperHeroModel>>> execute();
}

class IBuscarSuperHeroAll implements BuscarSuperHeroAll {
  final RepositorySuperHero superHero;

  IBuscarSuperHeroAll(this.superHero);

  @override
  Future<Either<SuperHeroAllError, List<SuperHeroModel>>> execute() async {
    return await superHero.buscarSuperHeroAll();
  }
}
