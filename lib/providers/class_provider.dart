import 'package:flutter/material.dart';
import '../models/class.dart'; // Certifique-se de que esse arquivo esteja correto

class ClassProvider with ChangeNotifier {
  List<Class> _classes = [];

  List<Class> get classes => _classes;

  // Carregar aulas iniciais (caso tenha algumas de exemplo)
  void loadClasses() {
    _classes = [
      Class(name: 'Funcional', time: '08:00', duration: 60),
      Class(name: 'Cross Time', time: '10:00', duration: 45),
      Class(name: 'Aquecimento', time: '10:30', duration: 10),
    ];
    notifyListeners();
  }

  // Função para adicionar uma nova aula
  void addClass(Class newClass) {
    _classes.add(newClass);
    notifyListeners(); // Notifica os listeners (telas) para reconstruírem a interface
  }
}
