import 'dart:convert';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_all_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/external/firebase/wrapper.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/infra/datasources/datasource_superhero_all.dart';
import 'package:http/http.dart' as http;

class ExternalSuperHero implements DataSourceSuperHeroAll {
  @override
  Future<List<SuperHeroModel>> buscarSuperHeroAll() async {
    Uri baseUrl =
        Uri.parse("https://akabab.github.io/superhero-api/api/all.json");
    var result = await http.get(baseUrl);

    List<dynamic> listJson = await jsonDecode(result.body);

    return listJson.map((e) => SuperHeroModelWrapper?.fromJson(e)).toList();
  }

  @override
  List<SuperHeroModel> filtrarQuantidadeSuperHeroAll(
      List<SuperHeroModel>? list, int? quantidade) {
    List<SuperHeroModel> listNew = [];
    for (int i = 0; i < quantidade!; i++) {
      SuperHeroModel model = list![i];
      listNew.add(model);
    }
    return listNew;
  }

  @override
  List<SuperHeroModel> filtrarGeneroSuperHeroAll(
      List<SuperHeroModel>? list, String? genero) {
    var listNew =
        list!.where((element) => element.appearance!.gender == genero).toList();
    return listNew;
  }

  @override
  List<SuperHeroModel> filtrarInteligenceSuperHeroAll(
      List<SuperHeroModel>? list, String? inteligence) {
    var listNew = list?.where((element) {
      var e = element.powerstats!.intelligence!;

      int pesoMy = int.parse(inteligence!);

      return pesoMy <= e;
    }).toList();
    return listNew!;
  }

  @override
  List<SuperHeroModel> filtrarNomeSuperHeroAll(
      List<SuperHeroModel>? list, String? nome) {
    var listNew = list
        ?.where((element) => element.name!
            .toUpperCase()
            .replaceAll("-", "")
            .replaceAll(" ", "")
            .contains(
                nome!.toUpperCase().replaceAll("-", "").replaceAll(" ", "")))
        .toList();
    return listNew ?? [];
  }
}
