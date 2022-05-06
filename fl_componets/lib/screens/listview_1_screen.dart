import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  final options = const [
    'Opcion 1',
    'Opcion 2',
    'Opcion 3',
    'Opcion 4',
    'Opcion 5',
    'Opcion 6'
  ];
  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView Tipo 1'),
        ),
        body: ListView(
          children: [
            ...options
                .map((e) => ListTile(
                    title: Text(e),
                    trailing: const Icon(Icons.arrow_forward_rounded)))
                .toList(),
          ],
        ));
  }
}
