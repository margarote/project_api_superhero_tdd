import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/entities/super_hero_all_entities.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/presentation/views/detalhes_home.dart';
import 'card_image.dart';

class ListTileMy extends StatelessWidget {
  SuperHeroModel model;
  ListTileMy({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CardImage(
                        urlImage: model.images?.lg,
                        width: 150,
                        height: 150,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            width: constrains.maxWidth * .3,
                            child: Text(
                              "${model.name}",
                              style: GoogleFonts.ptSans(
                                  color: Colors.blue.shade700,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                             SizedBox(
                          height: 4,
                        ),
                        Container(
                            width: constrains.maxWidth * .3,
                            child: Text(
                              "${model.biography!.fullName}",
                              style:
                                  GoogleFonts.ptSans(color: Colors.blueGrey, fontSize: 12),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: constrains.maxWidth * .3,
                            child: Text("${model.work!.occupation}",
                                style: GoogleFonts.ptSans(
                                    color: Colors.blueGrey, fontSize: 13))),
                      
                      Container(
                        child: Row(
                          children: [
                            Text("More info",
                                style: GoogleFonts.ptSans(
                                    color: Colors.blueGrey, fontSize: 15, fontWeight: FontWeight.bold)),
                            IconButton(
                                onPressed: () {
                                  Get.to(DetalhesHome(model));
                                },
                                icon: Icon(Icons.arrow_forward_ios,), iconSize: 20, color: Colors.blue.shade700),
                          ],
                        ),
                      ),  
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
