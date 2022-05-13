import 'package:fl_componets/models/menu_option.dart';
import 'package:fl_componets/router/app_route.dart';
import 'package:fl_componets/themes/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoute.menuOptions;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Componentes en Flutter'),
      ),
      body: ListView.separated(
          itemBuilder: (context, i) => ListTile(
                title: Text(menuOptions[i].name),
                leading: Icon(menuOptions[i].icon, color: AppTheme.primary),
                onTap: () {
                  Navigator.pushNamed(context, menuOptions[i].route);
                },
              ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: menuOptions.length),
    );
  }
}
