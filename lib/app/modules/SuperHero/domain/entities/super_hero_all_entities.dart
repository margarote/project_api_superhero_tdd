import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_appearance_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_biography_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_connections_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_images_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_powerstats_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_work_entities.dart';

class SuperHeroModel {
  int? id;
  String? name;
  String? slug;
  PowerstatsModel? powerstats;
  AppearanceModel? appearance;
  BiographyModel? biography;
  WorkModel? work;
  ConnectionsModel? connections;
  ImagesModel? images;

  SuperHeroModel({
      this.id,
      this.name,
      this.slug,
      this.powerstats,
      this.appearance,
      this.biography,
      this.work,
      this.connections,
      this.images});
}
