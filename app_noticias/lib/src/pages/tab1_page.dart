import 'package:app_noticias/src/services/new_service.dart';
import 'package:app_noticias/src/widgets/lista_notificas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;
    //newsService.headlines;
    //ListaNoticias(headlines)
    return Scaffold(
        body: (headlines.length == 0)
            ? Center(child: CircularProgressIndicator())
            : ListaNoticias(headlines));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
