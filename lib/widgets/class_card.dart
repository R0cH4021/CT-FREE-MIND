import 'package:flutter/material.dart';
import '../models/class.dart'; // Importando a model de aula

class ClassCard extends StatelessWidget {
  final Class classInfo;

  ClassCard({required this.classInfo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(classInfo.name),
        subtitle: Text('${classInfo.time} - ${classInfo.duration} min'),
      ),
    );
  }
}
