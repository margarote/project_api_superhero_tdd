import 'package:dartz/dartz.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_all_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroFiltrarNomeError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/repository/repository_superhero.dart';

abstract class BuscarSuperHeroNome {
  Either<SuperHeroAllFiltrarNomeError, List<SuperHeroModel>> execute(List<SuperHeroModel>? list, String? nome);
  
}

class IBuscarSuperHeroNome implements BuscarSuperHeroNome {
  final RepositorySuperHero repositorySuperHero;

  IBuscarSuperHeroNome(this.repositorySuperHero);
  @override
  Either<SuperHeroAllFiltrarNomeError, List<SuperHeroModel>> execute(List<SuperHeroModel>? list, String? nome) {
     if (list != null && nome != null) {
      if (list.length > 0) {
        if(nome.isNotEmpty){
          return repositorySuperHero.filtrarNomeSuperHeroAll(list, nome);
        } 
        
      }
    }
    return repositorySuperHero.filtrarNomeSuperHeroAll(list, nome);
  }

}
