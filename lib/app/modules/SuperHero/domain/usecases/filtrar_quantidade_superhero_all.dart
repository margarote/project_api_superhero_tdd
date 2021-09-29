import 'package:dartz/dartz.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_all_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroAllFiltrarQuantidade.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/repository/repository_superhero.dart';

abstract class FiltrarQuantidadeSuperHeroAll {
  Either<SuperHeroAllFiltrarQuantidadeError, List<SuperHeroModel>> execute(List<SuperHeroModel> list, int quantidade);
}

class IFiltrarQuantidadeSuperHeroAll implements FiltrarQuantidadeSuperHeroAll {
  final RepositorySuperHero repository;

  IFiltrarQuantidadeSuperHeroAll(this.repository);

  @override
  Either<SuperHeroAllFiltrarQuantidadeError, List<SuperHeroModel>> execute(List<SuperHeroModel>? list, int? quantidade) {
    if (list != null && quantidade != null) {
      if (list.length > 0) {
        if(quantidade <= list.length){
          return repository.filtrarQuantidadeSuperHeroAll(list, quantidade);
        } else {
          return repository.filtrarQuantidadeSuperHeroAll(list, list.length);
        }
        
      }
    }
    return repository.filtrarQuantidadeSuperHeroAll(list, quantidade);
  }
}
