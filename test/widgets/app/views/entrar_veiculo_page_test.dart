import 'package:dio/dio.dart';
import 'package:estacionamento/app/controllers/controller.dart';
import 'package:estacionamento/app/repository/repository.dart';
import 'package:estacionamento/app/views/entrar_veiculo_page.dart';
import 'package:estacionamento/shared/data/data.dart';
import 'package:estacionamento/app/models/vaga_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('EntrarVeiculoPage widget test', (WidgetTester tester) async {
    final dio = Dio();
    final data = Data();
    final repository = Repository(dio, data);
    final controller = Controller(repository);

    final vagas = [
      VagaModel(nomeVaga: 'A1', ocupada: false),
      VagaModel(nomeVaga: 'A2', ocupada: false),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: EntrarVeiculoPage(
          vagas: vagas,
          controller: controller,
        ),
      ),
    );

    // Dropdown
    expect(find.byType(DropdownButton<VagaModel>), findsOneWidget);
    expect(find.text('A1'), findsOneWidget);

    // TextField
    expect(find.byType(TextFormField), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'ABC1234');

    // Botoes Actions
    expect(find.text('Cancelar'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);

    // Pressionar OK
    await tester.tap(find.text('OK'));

    //Espera o delay da requisição
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(repository.entrarVeiculo, isA<Function>());
  });
}
