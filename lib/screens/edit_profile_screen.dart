import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // Variáveis para armazenar os dados do aluno
  String _name = 'João Silva';
  String _age = '25';
  String _email = 'joao.silva@academia.com';
  String _phone = '(11) 98765-4321';
  String _address = 'Rua Exemplo, 123, São Paulo, SP';
  String _plan = 'Gold'; // Tipo de plano do aluno

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Editar Perfil')),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Campo para o nome
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 10),

              // Campo para a idade
              TextFormField(
                initialValue: _age,
                decoration: InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _age = value!;
                },
              ),
              SizedBox(height: 10),

              // Campo para o e-mail
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  _email = value!;
                },
              ),
              SizedBox(height: 10),

              // Campo para o telefone
              TextFormField(
                initialValue: _phone,
                decoration: InputDecoration(labelText: 'Telefone'),
                keyboardType: TextInputType.phone,
                onSaved: (value) {
                  _phone = value!;
                },
              ),
              SizedBox(height: 10),

              // Campo para o endereço
              TextFormField(
                initialValue: _address,
                decoration: InputDecoration(labelText: 'Endereço'),
                onSaved: (value) {
                  _address = value!;
                },
              ),
              SizedBox(height: 10),

              // Campo para o tipo de plano
              TextFormField(
                initialValue: _plan,
                decoration: InputDecoration(labelText: 'Plano'),
                onSaved: (value) {
                  _plan = value!;
                },
              ),
              SizedBox(height: 20),

              // Botão para salvar as alterações
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Salvar as alterações
                    _formKey.currentState!.save();
                    // Ação após salvar (pode ser um pop ou navegação de volta)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Perfil atualizado')),
                    );
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
