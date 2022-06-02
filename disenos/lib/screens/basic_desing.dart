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
      ButtonSection()
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
        children: [
          Column(
            children: [
              Icon(
                Icons.phone,
                color: Colors.blue,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'CALL',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.room_outlined,
                color: Colors.blue,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'ROUTE',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.share,
                color: Colors.blue,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'SHARE',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
