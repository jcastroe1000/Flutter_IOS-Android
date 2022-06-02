import 'dart:ui';

import 'package:flutter/material.dart';

class BasicDesingScreen extends StatelessWidget {
  const BasicDesingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Image(image: AssetImage('assets/lighting.jpg')),
      Title(),
      ButtonSection(),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(
          'Enim consequat Lorem sit est id incididunt ullamco in exercitation occaecat voluptate duis. Adipisicing sunt et veniam Lorem ad cillum ea dolor ut. Dolor aliquip esse excepteur laborum sint sunt fugiat in Lorem deserunt anim dolor occaecat. Aliquip cupidatat nisi dolor culpa duis aliquip laboris amet consectetur sit duis esse.',
          textAlign: TextAlign.justify,
        ),
      )
    ]));
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Ese es un texto, Ese es un texto...',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Ese es un texto,es un textooo ',
              style: TextStyle(color: Colors.black45),
            ),
          ]),
          Expanded(child: Container()),
          const Icon(
            Icons.star,
            color: Colors.red,
          ),
          const Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 70, vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButtom(icon: Icons.call, textButtom: 'CALL'),
          CustomButtom(icon: Icons.room_outlined, textButtom: 'ROUTE'),
          CustomButtom(icon: Icons.share, textButtom: 'SHARE')
        ],
      ),
    );
  }
}

class CustomButtom extends StatelessWidget {
  final IconData icon;
  final String textButtom;

  const CustomButtom({
    Key? key,
    required this.icon,
    required this.textButtom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          this.icon,
          color: Colors.blue,
          size: 30,
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          this.textButtom,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
