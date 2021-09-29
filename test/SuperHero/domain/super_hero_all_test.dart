import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroAllError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_all_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroAllFiltrarQuantidade.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroFiltrarInteligenceError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroFiltrarGeneroError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroFiltrarNomeError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/repository/repository_superhero.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/usecases/buscar_super_hero_genero.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/usecases/buscar_super_hero_Inteligence.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/usecases/buscar_super_hero_nome.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/usecases/buscar_superhero_all.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/usecases/filtrar_quantidade_superhero_all.dart';

class RepositorySuperHeroMock1 implements RepositorySuperHero {
  @override
  Future<Either<SuperHeroAllError, List<SuperHeroModel>>>
      buscarSuperHeroAll() async {
    return Right(<SuperHeroModel>[]);
  }

  @override
  Either<SuperHeroAllFiltrarQuantidadeError, List<SuperHeroModel>> filtrarQuantidadeSuperHeroAll(List<SuperHeroModel>? list, int? quantidade) {
   return Right([]);
  }

  @override
  Either<SuperHeroAllFiltrarGeneroError, List<SuperHeroModel>> filtrarGeneroSuperHeroAll(List<SuperHeroModel>? list, String? genero) {
    return Right(<SuperHeroModel>[]);
  }

  @override
  Either<SuperHeroAllFiltrarInteligenceError, List<SuperHeroModel>> filtrarInteligenceSuperHeroAll(List<SuperHeroModel>? list, String? inteligence) {
    return Right(<SuperHeroModel>[]);
  }

  @override
  Either<SuperHeroAllFiltrarNomeError, List<SuperHeroModel>> filtrarNomeSuperHeroAll(List<SuperHeroModel>? list, String? nome) {
    return Right(<SuperHeroModel>[]);
  }

  
}

class RepositorySuperHeroMock2 implements RepositorySuperHero {
  @override
  Future<Either<SuperHeroAllError, List<SuperHeroModel>>>
      buscarSuperHeroAll() async {
    return Left(SuperHeroAllError(
        "Ocorreu um erro ao pegar os dados de SuperHeroModel"));
  }

  @override
  Either<SuperHeroAllFiltrarQuantidadeError, List<SuperHeroModel>> filtrarQuantidadeSuperHeroAll(List<SuperHeroModel>? list, int? quantidade) {
    return Left(SuperHeroAllFiltrarQuantidadeError("Ocorreu um erro ao pegar os dados de SuperHeroModel"));
  }

  @override
  Either<SuperHeroAllFiltrarGeneroError, List<SuperHeroModel>> filtrarGeneroSuperHeroAll(List<SuperHeroModel>? list, String? genero) {
    return Left(SuperHeroAllFiltrarGeneroError("Ocorreu um erro ao filtrar os dados por genero"));
  }

  @override
  Either<SuperHeroAllFiltrarInteligenceError, List<SuperHeroModel>> filtrarInteligenceSuperHeroAll(List<SuperHeroModel>? list, String? nteligence) {
    return Left(SuperHeroAllFiltrarInteligenceError("Ocorreu um erro ao filtrar os dados por Inteligence"));
  }

  @override
  Either<SuperHeroAllFiltrarNomeError, List<SuperHeroModel>> filtrarNomeSuperHeroAll(List<SuperHeroModel>? list, String? nome) {
    return Left(SuperHeroAllFiltrarNomeError("Ocorreu um erro ao filtrar os dados por nome"));
  }

  
}

main() async {
  test('Deve retornar uma lista de SuperHeroModel', () async {
    final repository = RepositorySuperHeroMock1();
    final usecase = IBuscarSuperHeroAll(repository);

    final result = await usecase.execute();
    var resultData = result.fold((l) => null, (r) => r);
    expect(resultData, isNotNull);
  });

  test('Deve retornar uma Exeption caso não retorne nada', () async {
    final repository = RepositorySuperHeroMock2();
    final usecase = IBuscarSuperHeroAll(repository);

    final result = await usecase.execute();
    var resultData = result.fold(id, id);

    expect(resultData, isA<SuperHeroAllError>());
  });

  //Filtrar Quantidade
  test('Deve retornar um filtro da lista de SuperHeroModel', () {
    final repository = RepositorySuperHeroMock1();
    final usecase = IFiltrarQuantidadeSuperHeroAll(repository);

    final result =  usecase.execute([], 0);
    var resultData = result.fold((l) => null, (r) => r);
    expect(resultData, isNotNull);
  });

  test('Deve retornar uma Exeption caso não retorne nada', () async {
    final repository = RepositorySuperHeroMock2();
    final usecase = IFiltrarQuantidadeSuperHeroAll(repository);

    final result = usecase.execute([], 0);
    var resultData = result.fold(id, id);

    expect(resultData, isA<SuperHeroAllFiltrarQuantidadeError>());
  });


  //Filtrar Nome
  test('Deve retornar um filtro da lista de SuperHeroModel NOME', () {
    final repository = RepositorySuperHeroMock1();
    final usecase = IBuscarSuperHeroNome(repository);

    final result =  usecase.execute([], "A-Bomb");
    var resultData = result.fold((l) => null, (r) => r);
    expect(resultData, isNotNull);
  });

  test('Deve retornar uma Exeption caso não retorne nada NOME', () async {
    final repository = RepositorySuperHeroMock2();
    final usecase = IBuscarSuperHeroNome(repository);

    final result = usecase.execute([], "");
    var resultData = result.fold(id, id);

    expect(resultData, isA<SuperHeroAllFiltrarNomeError>());
  });

  //Filtrar Inteligence
  test('Deve retornar um filtro da lista de SuperHeroModel Inteligence', () {
    final repository = RepositorySuperHeroMock1();
    final usecase = IBuscarSuperHeroInteligence(repository);

    final result =  usecase.execute([], "441");
    var resultData = result.fold((l) => null, (r) => r);
    expect(resultData, isNotNull);
  });

  test('Deve retornar uma Exeption caso não retorne nada Inteligence', () async {
    final repository = RepositorySuperHeroMock2();
    final usecase = IBuscarSuperHeroInteligence(repository);

    final result = usecase.execute([], "");
    var resultData = result.fold(id, id);

    expect(resultData, isA<SuperHeroAllFiltrarInteligenceError>());
  });
  
  //Filtrar Genero
  test('Deve retornar um filtro da lista de SuperHeroModel GENERO', () {
    final repository = RepositorySuperHeroMock1();
    final usecase = IBuscarSuperHeroGenero(repository);

    final result =  usecase.execute([], "Male");
    var resultData = result.fold((l) => null, (r) => r);
    expect(resultData, isNotNull);
  });

  test('Deve retornar uma Exeption caso não retorne nada GENERO', () async {
    final repository = RepositorySuperHeroMock2();
    final usecase = IBuscarSuperHeroGenero(repository);

    final result = usecase.execute([], "");
    var resultData = result.fold(id, id);

    expect(resultData, isA<SuperHeroAllFiltrarGeneroError>());
  });
}
