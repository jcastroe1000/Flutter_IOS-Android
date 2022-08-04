import 'package:app_noticias/src/pages/tabs_page.dart';
import 'package:app_noticias/src/services/new_service.dart';
import 'package:app_noticias/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new NewsService(),
        )
      ],
      child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          theme: myTheme,
          home: TabsPage()),
    );
  }
}
