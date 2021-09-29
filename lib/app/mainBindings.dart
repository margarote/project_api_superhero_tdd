import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/usecases/buscar_super_hero_genero.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/usecases/buscar_super_hero_Inteligence.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/usecases/buscar_super_hero_nome.dart';

import 'modules/SuperHero/domain/usecases/buscar_superhero_all.dart';
import 'modules/SuperHero/domain/usecases/filtrar_quantidade_superhero_all.dart';
import 'modules/SuperHero/external/firebase/ExternalSuperHero.dart';
import 'modules/SuperHero/infra/repository/repository_infra_superhero_all.dart';

class MainBindings {
 
    static final IBuscarSuperHeroAll repositorySuperHeroAll = IBuscarSuperHeroAll(RepositoryInfraSuperHeroAll(ExternalSuperHero()));
    static final FiltrarQuantidadeSuperHeroAll filtrarQuantidadeSuperHeroAll = IFiltrarQuantidadeSuperHeroAll(RepositoryInfraSuperHeroAll(ExternalSuperHero()));

    static final BuscarSuperHeroNome buscarSuperHeroNome = IBuscarSuperHeroNome(RepositoryInfraSuperHeroAll(ExternalSuperHero()));
    static final BuscarSuperHeroGenero buscarSuperHeroGenero = IBuscarSuperHeroGenero(RepositoryInfraSuperHeroAll(ExternalSuperHero()));
    static final BuscarSuperHeroInteligence buscarSuperHeroInteligence = IBuscarSuperHeroInteligence(RepositoryInfraSuperHeroAll(ExternalSuperHero()));
  

}
