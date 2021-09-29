import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_all_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_appearance_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_biography_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_connections_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_images_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_powerstats_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_work_entities.dart';

class SuperHeroModelWrapper {
  static SuperHeroModel fromJson(Map json) {
    return SuperHeroModel(
      appearance: AppearanceModelWrapper.fromJson(json['appearance']),
      biography: BiographyModelWarapper.fromJson(json['biography']),
      connections: ConnectionsModelWarapper.fromJson(json['connections']),
      id: json['id'],
      images: ImagesModelWarapper.fromJson(json['images']),
      name: json['name'],
      powerstats: PowerstatsModelWarapper.fromJson(json['powerstats']),
      slug: json['slug'],
      work: WorkModelWarapper.fromJson(json['work']),
    );
  }
}

class AppearanceModelWrapper {
  static AppearanceModel fromJson(Map json) {
    return AppearanceModel(
      eyeColor: json['eyeColor'],
      gender: json['gender'],
      hairColor: json['hairColor'],
      height: json['height'],
      race: json['race'],
      weight: json['weight'],
    );
  }
}

class BiographyModelWarapper {
  static BiographyModel fromJson(Map json) {
    return BiographyModel(
      aliases: json['aliases'],
      alignment: json['alignment'],
      alterEgos: json['alterEgos'],
      firstAppearance: json['firstAppearance'],
      fullName: json['fullName'],
      placeOfBirth: json['placeOfBirth'],
      publisher: json['publisher'],
    );
  }
}

class ConnectionsModelWarapper {
  static ConnectionsModel fromJson(Map json) {
    return ConnectionsModel(
      groupAffiliation: json['groupAffiliation'],
      relatives: json['relatives'],
    );
  }
}

class ImagesModelWarapper {
  static ImagesModel fromJson(Map json) {
    return ImagesModel(
      lg: json['lg'],
      md: json['md'],
      sm: json['sm'],
      xs: json['xs'],
    );
  }
}

class PowerstatsModelWarapper {
  static PowerstatsModel fromJson(Map json) {
    return PowerstatsModel(
      combat: json['combat'],
      durability: json['durability'],
      intelligence: json['intelligence'],
      power: json['power'],
      speed: json['speed'],
      strength: json['strength'],
    );
  }
}

class WorkModelWarapper {
  static WorkModel fromJson(Map json) {
    return WorkModel(
      base: json['base'],
      occupation: json['occupation'],
    );
  }
}
