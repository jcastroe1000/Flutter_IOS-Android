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
        SizedBox(height: 20),
        _TarjetImagen(noticia),
        _TarjetaBody(noticia),
        _TarjetaBotones(),
        SizedBox(height: 15),
        Divider(),
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
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
          child: ('${noticia.urlToImage}' != null)
              ? FadeInImage(
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Container(
                        width: 270,
                        height: 220,
                        child: const Image(
                            image: AssetImage('assets/img/no-image.png')));
                  },
                  placeholder: AssetImage('assets/img/giphy.gif'),
                  image: NetworkImage('${noticia.urlToImage}'))
              : Image(image: AssetImage('assets/img/no-image.png'))),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Text(
        (noticia.description != null)
            ? noticia.description
            : 'No hay Descripción',
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.lightBlue),
      ),
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.amber,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Icon(Icons.star_border),
        ),
        SizedBox(height: 25),
        RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.pinkAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(
              Icons.more_horiz,
            ))
      ],
    ));
  }
}
