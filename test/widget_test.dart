import 'package:fff/providers/class_provider.dart';
import 'package:fff/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'providers/class_provider.dart';
import 'home_screen.dart';

void main() {
  testWidgets('HomeScreen displays classes correctly',
      (WidgetTester tester) async {
    // Criar um provider simulado com dados de teste
    final classProvider = ClassProvider();
    classProvider.loadClasses(); // Carregar aulas simuladas

    // Montar o widget com o provider
    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: classProvider,
        child: MaterialApp(home: HomeScreen()),
      ),
    );

    // Verificar se as aulas estão sendo exibidas
    expect(find.text('Aula de CrossFit'), findsOneWidget);
    expect(find.text('Horário: 08:00'), findsOneWidget);
    expect(find.text('Duração: 60 minutos'), findsOneWidget);
    expect(find.text('Aula de HIIT'), findsOneWidget);
    expect(find.text('Horário: 10:00'), findsOneWidget);
    expect(find.text('Duração: 45 minutos'), findsOneWidget);
  });
}
