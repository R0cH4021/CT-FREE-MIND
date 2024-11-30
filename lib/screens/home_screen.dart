import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/class_provider.dart';
import '../widgets/class_card.dart'; // O widget que exibe as aulas
import 'profile_screen.dart'; // Tela de perfil
import 'add_class_screen.dart'; // Tela para adicionar aulas

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Indica qual opção está selecionada na Hotbar

  // Função para navegar para a tela correspondente baseado no índice
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final classProvider = Provider.of<ClassProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CT FREE MIND')),
        elevation: 0,
      ),
      body: _selectedIndex == 0
          ? ListView.builder(
              itemCount: classProvider.classes.length,
              itemBuilder: (context, index) {
                return ClassCard(classInfo: classProvider.classes[index]);
              },
            )
          : ProfileScreen(), // Exibe a tela de perfil quando a aba de perfil é selecionada

      // FloatingActionButton para adicionar aulas
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddClassScreen()),
                );
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.blue,
            )
          : null, // Não exibe o botão flutuante quando a aba de perfil está selecionada

      // Hotbar (BottomNavigationBar)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Marca a opção selecionada
        onTap: _onItemTapped, // Chama a função quando a opção for clicada
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.school), // Ícone para a tela de Aulas
            label: 'Aulas',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), // Ícone para a tela de Perfil
            label: 'Perfil',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
