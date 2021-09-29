// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/errors/SuperHeroAllError.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/domain/usecases/buscar_superhero_all.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/external/firebase/ExternalSuperHero.dart';
import 'package:project_api_superhero_tdd/app/modules/SuperHero/infra/repository/repository_infra_superhero_all.dart';

import 'package:project_api_superhero_tdd/main.dart';

void main() {
  testWidgets('teste', (WidgetTester tester) async {
    var result =  await IBuscarSuperHeroAll(RepositoryInfraSuperHeroAll(ExternalSuperHero())).execute();
    var resultData = result.fold((l) => SuperHeroAllError("Ocorreu um erro"), (r) => r);
    
  });
}
