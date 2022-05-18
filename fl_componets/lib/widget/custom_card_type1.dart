import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.photo_album_sharp, color: AppTheme.primary),
            title: Text('Sooy un titulo'),
            subtitle: Text(
                'Culpa aliqua adipisicing fugiat officia. Pariatur fugiat exercitation laboris occaecat id excepteur adipisicing nostrud ipsum culpa reprehenderit commodo ullamco ex. Pariatur nisi aliquip ut voluptate nulla nostrud voluptate eiusmod commodo Lorem nisi. Anim aute proident exercitation ea est ullamco veniam deserunt ullamco qui et. Amet tempor cupidatat anim adipisicing consequat dolor velit ut aute pariatur do officia magna aliquip. '),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(onPressed: () {}, child: const Text('Cancel')),
              TextButton(onPressed: () {}, child: const Text('OK'))
            ]),
          )
        ],
      ),
    );
  }
}
