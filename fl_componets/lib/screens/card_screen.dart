import 'package:flutter/material.dart';
import 'package:fl_componets/widget/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Widget'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
            CustomCardType1(),
            SizedBox(height: 10),
            CustomCardType2(
              imageUrl:
                  'https://mymodernmet.com/wp/wp-content/uploads/2022/02/international-landscape-photographer-awards-20.jpeg',
              nameImg: 'Imagen 1',
            ),
            SizedBox(height: 10),
            CustomCardType2(
              imageUrl:
                  'https://mymodernmet.com/wp/wp-content/uploads/2020/11/International-Landscape-Photographer-Year-PhotographER-1st-KelvinYuen-2.jpg',
              nameImg: 'Imagen 2',
            ),
            CustomCardType2(
              imageUrl:
                  'https://mymodernmet.com/wp/wp-content/uploads/2020/11/International-Landscape-Photographer-Year-PhotographER-3rd-IsabellaTabacchi-1.jpg',
            )
          ],
        ));
  }
}
