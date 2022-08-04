import 'package:app_noticias/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:app_noticias/src/models/news_models.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.noticias.length,
        itemBuilder: (BuildContext context, int index) {
          return _Noticia(noticia: this.noticias[index], index: index);
        });
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(noticia, index),
        _TarjetaTitulo(noticia),
        _TarjetImagen(noticia),
      ],
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo(this.noticia);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noticia.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35, horizontal: 10),
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}. ',
            style: TextStyle(color: Colors.red),
          ),
          Text(
            '${noticia.source.name}. ',
          ),
        ],
      ),
    );
  }
}

class _TarjetImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetImagen(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
