import 'package:get/get.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/presentation/bindings/home_binding.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/presentation/views/home_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
