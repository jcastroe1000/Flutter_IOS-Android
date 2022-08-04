import 'package:app_noticias/src/services/new_service.dart';
import 'package:app_noticias/src/widgets/lista_notificas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;
    //newsService.headlines;

    return Scaffold(body: ListaNoticias(headlines));
  }
}
