import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_all_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroAllError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroAllFiltrarQuantidade.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroFiltrarGeneroError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroFiltrarInteligenceError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroFiltrarNomeError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/usecases/filtrar_quantidade_superhero_all.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/infra/datasources/datasource_superhero_all.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/infra/repository/repository_infra_superhero_all.dart';

class DataSourceMock implements DataSourceSuperHeroAll {
  @override
  Future<List<SuperHeroModel>> buscarSuperHeroAll() async {
    return <SuperHeroModel>[];
  }

  @override
  List<SuperHeroModel> filtrarQuantidadeSuperHeroAll(
      List<SuperHeroModel>? list, int? quantidade) {
    return [];
  }

  @override
  List<SuperHeroModel> filtrarGeneroSuperHeroAll(List<SuperHeroModel>? list, String? genero) {
    return [];
  }

  @override
  List<SuperHeroModel> filtrarInteligenceSuperHeroAll(List<SuperHeroModel>? list, String? inteligence) {
    return [];
  }

  @override
  List<SuperHeroModel> filtrarNomeSuperHeroAll(List<SuperHeroModel>? list, String? nome) {
    return [];
  }
}

class DataSourceMock2 implements DataSourceSuperHeroAll {
  @override
  Future<List<SuperHeroModel>> buscarSuperHeroAll() async {
    throw SuperHeroAllError("");
  }

  @override
  List<SuperHeroModel> filtrarQuantidadeSuperHeroAll(
      List<SuperHeroModel>? list, int? quantidade) {
    throw SuperHeroAllFiltrarQuantidadeError("");
  }

  @override
  List<SuperHeroModel> filtrarGeneroSuperHeroAll(List<SuperHeroModel>? list, String? genero) {
    throw SuperHeroAllFiltrarGeneroError("");
  }

  @override
  List<SuperHeroModel> filtrarInteligenceSuperHeroAll(List<SuperHeroModel>? list, String? inteligence) {
    throw SuperHeroAllFiltrarInteligenceError("");
  }

  @override
  List<SuperHeroModel> filtrarNomeSuperHeroAll(List<SuperHeroModel>? list, String? nome) {
    throw SuperHeroAllFiltrarNomeError("");
  }
}

void main() {
  final datasource = DataSourceMock();

  final repository = RepositoryInfraSuperHeroAll(datasource);
  final datasource2 = DataSourceMock2();
  final repository2 = RepositoryInfraSuperHeroAll(datasource2);

  test('Deve retornar uma lista de SuperHeroModel', () async {
    var result = await repository.buscarSuperHeroAll();
    var resultData = result.fold((l) => null, (r) => r);
    expect(resultData, isNotNull);
  });

  test('Deve retornar uma Exeption caso não retorne nada', () async {
    var result = await repository2.buscarSuperHeroAll();
    var resultData = result.fold(id, id);
    expect(resultData, isA<SuperHeroAllError>());
  });

  //Filtro Quantidade

  test('Deve retornar um filtro da lista de SuperHeroModel', () {
    var result = repository.filtrarQuantidadeSuperHeroAll([], 0);
    var resultData = result.fold((l) => null, (r) => r);
    expect(resultData, isNotNull);
  });

  test('Deve retornar uma Exeption caso não retorne nada', () {
    var result = repository2.filtrarQuantidadeSuperHeroAll([], 0);
    var resultData = result.fold(id, id);
    expect(resultData, isA<SuperHeroAllFiltrarQuantidadeError>());
  });

  //Filtro Nome

  test('Deve retornar um filtro da lista de SuperHeroModel', () {
    var result = repository.filtrarNomeSuperHeroAll([], "");
    var resultData = result.fold((l) => null, (r) => r);
    expect(resultData, isNotNull);
  });

  test('Deve retornar uma Exeption caso não retorne nada', () {
    var result = repository2.filtrarNomeSuperHeroAll([], "");
    var resultData = result.fold(id, id);
    expect(resultData, isA<SuperHeroAllFiltrarNomeError>());
  });

  //Filtro Inteligence

  test('Deve retornar um filtro da lista de SuperHeroModel', () {
    var result = repository.filtrarInteligenceSuperHeroAll([], "");
    var resultData = result.fold((l) => null, (r) => r);
    expect(resultData, isNotNull);
  });

  test('Deve retornar uma Exeption caso não retorne nada', () {
    var result = repository2.filtrarInteligenceSuperHeroAll([], "");
    var resultData = result.fold(id, id);
    expect(resultData, isA<SuperHeroAllFiltrarInteligenceError>());
  });

  //Filtro Genero

  test('Deve retornar um filtro da lista de SuperHeroModel', () {
    var result = repository.filtrarGeneroSuperHeroAll([], "");
    var resultData = result.fold((l) => null, (r) => r);
    expect(resultData, isNotNull);
  });

  test('Deve retornar uma Exeption caso não retorne nada', () {
    var result = repository2.filtrarGeneroSuperHeroAll([], "");
    var resultData = result.fold(id, id);
    expect(resultData, isA<SuperHeroAllFiltrarGeneroError>());
  });
}
