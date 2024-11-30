import 'package:flutter/material.dart';
import '../providers/class_provider.dart'; // Importando o ClassProvider
import '../models/class.dart'; // Importando a classe que representa a aula
import 'package:provider/provider.dart';

class AddClassScreen extends StatefulWidget {
  @override
  _AddClassScreenState createState() => _AddClassScreenState();
}

class _AddClassScreenState extends State<AddClassScreen> {
  final _nameController = TextEditingController();
  final _timeController = TextEditingController();
  final _durationController = TextEditingController();

  void _addClass() {
    final name = _nameController.text;
    final time = _timeController.text;
    final duration = int.tryParse(_durationController.text) ?? 0;

    if (name.isEmpty || time.isEmpty || duration <= 0) {
      // Mostra uma mensagem se os campos não estiverem preenchidos corretamente
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Por favor, preencha todos os campos corretamente!')));
      return;
    }

    // Criando uma nova aula
    final newClass = Class(name: name, time: time, duration: duration);

    // Adiciona a nova aula ao provider
    Provider.of<ClassProvider>(context, listen: false).addClass(newClass);

    // Volta para a tela inicial (HomeScreen)
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Aula')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome da Aula'),
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Horário'),
            ),
            TextField(
              controller: _durationController,
              decoration: InputDecoration(labelText: 'Duração (minutos)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addClass,
              child: Text('Adicionar Aula'),
            ),
          ],
        ),
      ),
    );
  }
}
