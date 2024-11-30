import 'package:flutter/material.dart';
import 'edit_profile_screen.dart'; // Importando a tela de edição

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Exemplo de dados do aluno
    final student = {
      'name': 'João Silva',
      'age': 25,
      'email': 'joao.silva@academia.com',
      'phone': '(11) 98765-4321',
      'address': 'Rua Exemplo, 123, São Paulo, SP',
      'plan': 'Gold', // Tipo de plano do aluno (Silver, Gold, Diamond)
    };

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Perfil')),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Foto do aluno
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                    'assets/images/avatar.png'), // Coloque o caminho da imagem do aluno
              ),
            ),
            SizedBox(height: 20),

            // Nome
            Text(
              'Nome: ${student['name']}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Tipo de plano
            Text(
              'Plano: ${student['plan']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),

            // Idade
            Text(
              'Idade: ${student['age']} anos',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),

            // E-mail
            Text(
              'E-mail: ${student['email']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),

            // Telefone
            Text(
              'Telefone: ${student['phone']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),

            // Endereço
            Text(
              'Endereço: ${student['address']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),

            // Botão para editar perfil
            ElevatedButton(
              onPressed: () {
                // Navega para a tela de edição do perfil
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              },
              child: Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
