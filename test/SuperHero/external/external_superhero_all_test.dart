

import 'package:flutter_test/flutter_test.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/usecases/buscar_super_hero_Inteligence.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/external/firebase/ExternalSuperHero.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/infra/repository/repository_infra_superhero_all.dart';




void main() {
  ExternalSuperHero externalSuperHero = ExternalSuperHero();
  
  
  /*
  test('Deve retornar uma lista de SuperHeroModel', () async{
    var result = await externalSuperHero.buscarSuperHeroAll();
    var listResult = externalSuperHero.filtrarInteligenceSuperHeroAll(result, "50");
    listResult.forEach((element) {
      print(element.name);
    });
    expect(result, isNotNull);
  });
  */

/*
test('Deve retornar uma lista de SuperHeroModel', () async{
     var result = await externalSuperHero.buscarSuperHeroAll();
     final BuscarSuperHeroInteligence buscarSuperHeroInteligence = IBuscarSuperHeroInteligence(RepositoryInfraSuperHeroAll(ExternalSuperHero()));
   
    var listResult = buscarSuperHeroInteligence.execute(result, "50");
    var listData = listResult.fold((l) => null, (r) => r);
    
    listData?.forEach((element) {
      print(element.name);
    });
    
  });
  */
}