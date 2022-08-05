import 'package:app_noticias/src/models/category_model.dart';
import 'package:app_noticias/src/services/new_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(child: _ListaCategorias()),
      ],
    ));
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        final cName = categories[index].name;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 70),
          child: Column(
            children: [
              _CategoryButton(categories[index]),
              SizedBox(height: 5),
              Text('${cName[0].toUpperCase()}${cName.substring(1)}')
            ],
          ),
        );
      },
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categorias;

  const _CategoryButton(this.categorias);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: (() {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = categorias.name;
      }),
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(categorias.icon,
            color: (newsService.selectedCategory == this.categorias.name)
                ? Colors.red
                : Colors.black87),
      ),
    );
  }
}
