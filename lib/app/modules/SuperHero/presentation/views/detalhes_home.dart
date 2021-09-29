import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_all_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/presentation/views/widgets/card_icon_person.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/presentation/views/widgets/card_image.dart';

class DetalhesHome extends StatelessWidget {
  SuperHeroModel model;
  DetalhesHome(this.model);

  @override
  Widget build(BuildContext context) {
    String descricao =
        "Appearance: ${model.appearance!.gender}, ${model.appearance!.hairColor}, ${model.appearance!.height![1]}, ${model.appearance!.race}, ${model.appearance!.weight![1]}.\n${model.biography!.fullName}, ${model.biography!.alterEgos}, ${model.biography!.aliases!.first}, ${model.biography!.placeOfBirth}, ${model.biography!.firstAppearance}, ${model.biography!.publisher}, ${model.biography!.alignment}.\nWork: ${model.work!.base}, ${model.work!.occupation}.\nConnections: ${model.connections!.groupAffiliation}, ${model.connections!.relatives}.";

    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
        builder: (_, c) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: CardImage(
                            urlImage: model.images!.lg!,
                            width: 500,
                            height: 500,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CardIconPerson(
                          icon: Icons.person,
                          title: "Combat",
                          subtitle: model.powerstats!.combat!.toString(),
                        ),
                        CardIconPerson(
                          icon: Icons.person,
                          title: "Durability",
                          subtitle: model.powerstats!.durability!.toString(),
                        ),
                        CardIconPerson(
                          icon: Icons.person,
                          title: "Intelligence",
                          subtitle: model.powerstats!.intelligence!.toString(),
                        ),
                        CardIconPerson(
                          icon: Icons.person,
                          title: "Power",
                          subtitle: model.powerstats!.power!.toString(),
                        ),
                        CardIconPerson(
                          icon: Icons.person,
                          title: "Speed",
                          subtitle: model.powerstats!.speed!.toString(),
                        ),
                        CardIconPerson(
                          icon: Icons.person,
                          title: "Strength",
                          subtitle: model.powerstats!.strength!.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: c.maxWidth * .8,
                    child: Text(
                      "${model.name}",
                      style: GoogleFonts.ptSans(
                          color: Colors.blue.shade700,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 4,
                ),
                Container(
                    width: c.maxWidth * .8,
                    child: Text(
                      "${model.biography!.fullName ?? "Nenhuma"}",
                      style: GoogleFonts.ptSans(
                          color: Colors.blueGrey, fontSize: 14),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: c.maxWidth * .8,
                    child: Text("${model.work!.occupation}",
                        style: GoogleFonts.ptSans(
                            color: Colors.blueGrey, fontSize: 18))),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: c.maxWidth * .8,
                    child: Text(
                      descricao,
                      style: GoogleFonts.ptSans(
                          color: Colors.blueGrey, fontSize: 18),
                      textAlign: TextAlign.justify,
                    )),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
