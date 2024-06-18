import 'package:flutter/material.dart';
import 'package:potterpedia/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=>NavState(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "OpenSans",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class NavState extends ChangeNotifier{
  int _selectedNav = 0;

  int get selectedNav => _selectedNav;


  void setNav(int value) {
    _selectedNav = value;
    notifyListeners();
  }
}