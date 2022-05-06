import 'package:fl_componets/screens/screens.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Componentes en Flutter'),
        elevation: 10,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: const Text('Nombre de ruta'),
                leading: const Icon(Icons.account_box),
                onTap: () {
                  // final route = MaterialPageRoute(
                  //     builder: (context) => const Listview1Screen());
                  // Navigator.push(context, route);
                  //Navigator.pushReplacement(context, route);
                  Navigator.pushNamed(context, 'card2');
                },
              ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: 10),
    );
  }
}
