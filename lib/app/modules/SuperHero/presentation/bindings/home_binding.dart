import 'package:get/get.dart';
import 'package:project_api_superhero_tdd/app/mainBindings.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        buscarSuperHeroAll: MainBindings.repositorySuperHeroAll,
        filtrarQuantidadeSuperHeroAll: MainBindings.filtrarQuantidadeSuperHeroAll, 
        buscarSuperHeroGenero: MainBindings.buscarSuperHeroGenero,
        buscarSuperHeroInteligence: MainBindings.buscarSuperHeroInteligence,
        buscarSuperHeroNome: MainBindings.buscarSuperHeroNome,
      )
    );
  }
}
