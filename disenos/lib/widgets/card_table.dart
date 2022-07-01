import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        const TableRow(children: [
          _SingleCard(
            color: Colors.blue,
            icon: Icons.add_business_sharp,
            text: 'General',
          ),
          _SingleCard(
            color: Colors.purple,
            icon: Icons.car_rental_rounded,
            text: 'Transport ',
          )
        ]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard(
      {super.key, required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    var column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: this.color,
          child: Icon(
            this.icon,
            size: 35,
            color: Colors.white,
          ),
          radius: 30,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          this.text,
          style: TextStyle(
              color: this.color, fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
    return _CardBackGround(child: column);
  }
}

class _CardBackGround extends StatelessWidget {
  final Widget child;
  const _CardBackGround({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
                color: Color.fromRGBO(62, 66, 107, 0.7),
                borderRadius: BorderRadius.circular(20)),
            child: this.child,
          ),
        ),
      ),
    );
    ;
  }
}
