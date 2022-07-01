import 'package:flutter/material.dart';
import 'package:preferencias_usuario/classes/preferences.dart';
import 'package:preferencias_usuario/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'Home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('DarkMode: ${Preferences.isDarkmode}'),
            Divider(),
            Text('Genero: ${Preferences.gender}'),
            Divider(),
            Text('Nombre Usuario: ${Preferences.name}'),
            Divider(),
          ],
        ));
  }
}
