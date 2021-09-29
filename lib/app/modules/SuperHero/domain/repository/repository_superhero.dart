import 'package:dartz/dartz.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_all_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroAllError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroAllFiltrarQuantidade.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroFiltrarGeneroError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroFiltrarInteligenceError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroFiltrarNomeError.dart';

abstract class RepositorySuperHero {
  Future<Either<SuperHeroAllError, List<SuperHeroModel>>> buscarSuperHeroAll();
  Either<SuperHeroAllFiltrarQuantidadeError, List<SuperHeroModel>> filtrarQuantidadeSuperHeroAll(List<SuperHeroModel>? list, int? quantidade);
  Either<SuperHeroAllFiltrarNomeError, List<SuperHeroModel>> filtrarNomeSuperHeroAll(List<SuperHeroModel>? list, String? nome);
  Either<SuperHeroAllFiltrarGeneroError, List<SuperHeroModel>> filtrarGeneroSuperHeroAll(List<SuperHeroModel>? list, String? genero);
  Either<SuperHeroAllFiltrarInteligenceError, List<SuperHeroModel>> filtrarInteligenceSuperHeroAll(List<SuperHeroModel>? list, String? inteligence);
}