import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_all_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/presentation/views/widgets/list_tile_my.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade700,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.high_quality_rounded,
                size: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Heróis',
                style: GoogleFonts.ptSans(fontSize: 22),
              ),
              SizedBox(
                width: 10,
              ),
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: (_) {
                  return Text(
                    '${controller.listHeroes.length}/${controller.listHeroesCopy.length}',
                    style: GoogleFonts.ptSans(fontSize: 15),
                  );
                },
              ),
            ],
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: "Adicione mais 10 heróis!",
            onPressed: () {
              controller.filtrarQuantidade();
            }),
        body: LayoutBuilder(
          builder: (_, constrains) {
            double sW = constrains.maxWidth;
            double sH = constrains.maxHeight;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: constrains.maxWidth * .03,
                    ),
                    Container(
                      width: constrains.maxWidth * .35,
                      height: 60,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Procurar Herói",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        controller: controller.nome,
                      ),
                    ),
                    SizedBox(
                      width: constrains.maxWidth * .03,
                    ),
                    Container(
                      width: constrains.maxWidth * .3,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Inteligência (%)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        controller: controller.inteligencia,
                      ),
                    ),
                    SizedBox(
                      width: constrains.maxWidth * .03,
                    ),
                    Container(
                      child: Obx(() => DropdownButton<String>(
                            value: controller.genero.value,
                            isDense: true,
                            onChanged: (a) {
                              controller.genero.value = a!;
                              controller.filtrarGenero(a);
                            },
                            items: ["Todos", "Homem", "Mulher"]
                                .map((String value) {
                              return new DropdownMenuItem<String>(
                                child: new Text(value),
                                value: value,
                              );
                            }).toList(),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: sW,
                  height: sH - 90,
                  child: GetBuilder<HomeController>(
                    init: HomeController(),
                    builder: (_) {
                      return ListView.builder(
                        itemCount: controller.listHeroes.length,
                        itemBuilder: (context, index) {
                          SuperHeroModel model = controller.listHeroes[index];
                          return ListTileMy(
                            model: model,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
