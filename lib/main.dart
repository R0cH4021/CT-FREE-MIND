import 'package:fff/providers/user_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_info_provider.dart';
import 'screens/login_screen.dart';
import 'providers/class_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ClassProvider()),
      ],
      child: MaterialApp(
        title: 'CT FREE MIND',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
