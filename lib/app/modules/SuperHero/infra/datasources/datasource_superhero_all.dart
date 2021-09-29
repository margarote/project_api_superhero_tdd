
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_all_entities.dart';

abstract class DataSourceSuperHeroAll {
  Future<List<SuperHeroModel>> buscarSuperHeroAll();
  List<SuperHeroModel> filtrarQuantidadeSuperHeroAll(List<SuperHeroModel>? list, int? quantidade);
  List<SuperHeroModel> filtrarNomeSuperHeroAll(List<SuperHeroModel>? list, String? nome);
  List<SuperHeroModel> filtrarGeneroSuperHeroAll(List<SuperHeroModel>? list, String? genero);
  List<SuperHeroModel> filtrarInteligenceSuperHeroAll(List<SuperHeroModel>? list, String? inteligence);
}