import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_all_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/usecases/buscar_super_hero_genero.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/usecases/buscar_super_hero_Inteligence.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/usecases/buscar_super_hero_nome.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/usecases/buscar_superhero_all.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/usecases/filtrar_quantidade_superhero_all.dart';

class HomeController extends GetxController {
  final BuscarSuperHeroAll? buscarSuperHeroAll;
  final FiltrarQuantidadeSuperHeroAll? filtrarQuantidadeSuperHeroAll;

  final BuscarSuperHeroNome? buscarSuperHeroNome;
  final BuscarSuperHeroGenero? buscarSuperHeroGenero;
  final BuscarSuperHeroInteligence? buscarSuperHeroInteligence;
  HomeController(
      {this.buscarSuperHeroAll,
      this.filtrarQuantidadeSuperHeroAll,
      this.buscarSuperHeroNome,
      this.buscarSuperHeroGenero,
      this.buscarSuperHeroInteligence});

  List<SuperHeroModel> listHeroes = <SuperHeroModel>[];
  List<SuperHeroModel> listHeroesCopy = <SuperHeroModel>[];
  RxInt count = 10.obs;

  Future<void> iniciar() async {
    var value = await buscarSuperHeroAll!.execute();
    print(value.length());
    List<SuperHeroModel> listNew = value.getOrElse(() => []);
    listHeroesCopy = listNew;
    listHeroes = listHeroesCopy.length > 0
        ? listHeroesCopy.getRange(0, 10).toList()
        : listHeroesCopy;
    update();
  }

  RxString genero = "Todos".obs;

  void filtrarGenero(String a) {
    //Filtrando
    String genero = a == "Homem"
        ? "Male"
        : a == "Mulher"
            ? "Female"
            : "Todos";
    if (genero != "Todos") {
      List<SuperHeroModel> list =
          buscarSuperHeroGenero!.execute(listHeroesCopy, genero).fold((l) {
        Get.snackbar("Erro", l.message);
        return [];
      }, (r) => r);
      listHeroes = list;
      update();
    } else {
      listHeroes = listHeroesCopy;
      update();
    }
  }

  void filtrarQuantidade() {
    if (count.value + 10 <= listHeroesCopy.length) {
      count += 10;
    } else {
      count.value = listHeroesCopy.length;
    }

    List<SuperHeroModel> result = filtrarQuantidadeSuperHeroAll!
        .execute(listHeroesCopy, count.value)
        .fold((l) {
      Get.snackbar("Erro", l.message);
      return [];
    }, (r) => r);

    listHeroes = result;
    update();
  }

  void buscarNome() {
    //Buscando

    //Filtrando
    List<SuperHeroModel> list =
        buscarSuperHeroNome!.execute(listHeroesCopy, nome.text).fold((l) {
      Get.snackbar("Erro", l.message);
      return [];
    }, (r) => r);
    listHeroes = list;
    update();
  }

  TextEditingController inteligencia = TextEditingController();
  TextEditingController nome = TextEditingController();

  void buscarInteligence() {
    //Filtrando
    if (inteligencia.text.isNotEmpty && inteligencia.text.isNum) {
      List<SuperHeroModel> list = buscarSuperHeroInteligence!
          .execute(listHeroesCopy, inteligencia.text)
          .fold((l) {
        return [];
      }, (r) => r);
      listHeroes = list;
      update();
    }
  }

  @override
  void onInit() async{
    await iniciar();
    nome.addListener(() {
      buscarNome();
    });
    inteligencia.addListener(() {
      buscarInteligence();
    });
    super.onInit();
  }
}
