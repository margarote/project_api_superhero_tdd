import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroAllError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_all_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroAllFiltrarQuantidade.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroFiltrarNomeError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroFiltrarInteligenceError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroFiltrarGeneroError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/repository/repository_superhero.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/infra/datasources/datasource_superhero_all.dart';

class RepositoryInfraSuperHeroAll implements RepositorySuperHero {
  final DataSourceSuperHeroAll dataSourceSuperHeroAll;

  RepositoryInfraSuperHeroAll(this.dataSourceSuperHeroAll);

  @override
  Future<Either<SuperHeroAllError, List<SuperHeroModel>>>
      buscarSuperHeroAll() async {
    try {
      var result = await dataSourceSuperHeroAll.buscarSuperHeroAll();
      return Right(result);
    } catch (e) {
      return Left(
          SuperHeroAllError("Ocorreu um erro ao buscar os json superhero all"));
    }
  }

  @override
  Either<SuperHeroAllFiltrarQuantidadeError, List<SuperHeroModel>>
      filtrarQuantidadeSuperHeroAll(
          List<SuperHeroModel>? list, int? quantidade) {
    try {
      var result = dataSourceSuperHeroAll.filtrarQuantidadeSuperHeroAll(
          list, quantidade);
      return Right(result);
    } catch (e) {
      return Left(SuperHeroAllFiltrarQuantidadeError(
          "Ocorreu um erro ao filtrar a lista de superhero all"));
    }
  }

  @override
  Either<SuperHeroAllFiltrarGeneroError, List<SuperHeroModel>>
      filtrarGeneroSuperHeroAll(List<SuperHeroModel>? list, String? genero) {
    try {
      var result =
          dataSourceSuperHeroAll.filtrarGeneroSuperHeroAll(list, genero);
      return Right(result);
    } catch (e) {
      return Left(SuperHeroAllFiltrarGeneroError(
          "Ocorreu um erro ao filtrar a lista de superhero all GENERO"));
    }
  }

  @override
  Either<SuperHeroAllFiltrarInteligenceError, List<SuperHeroModel>>
      filtrarInteligenceSuperHeroAll(List<SuperHeroModel>? list, String? inteligence) {
    try {
      var result = dataSourceSuperHeroAll.filtrarInteligenceSuperHeroAll(list, inteligence);
      
      return Right(result);
    } catch (e) {
      return Left(SuperHeroAllFiltrarInteligenceError(
          "Ocorreu um erro ao filtrar a lista de superhero all inteligence"));
    }
  }

  @override
  Either<SuperHeroAllFiltrarNomeError, List<SuperHeroModel>>
      filtrarNomeSuperHeroAll(List<SuperHeroModel>? list, String? nome) {
    try {
      var result = dataSourceSuperHeroAll.filtrarNomeSuperHeroAll(list, nome);
      return Right(result);
    } catch (e) {
      return Left(SuperHeroAllFiltrarNomeError(
          "Ocorreu um erro ao filtrar a lista de superhero all NOME"));
    }
  }
}
