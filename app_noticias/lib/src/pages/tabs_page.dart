import 'package:app_noticias/src/pages/tab1_page.dart';
import 'package:app_noticias/src/pages/tab2_page.dart';
import 'package:app_noticias/src/services/new_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegationModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegation(),
      ),
    );
  }
}

class _Navegation extends StatelessWidget {
  const _Navegation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegationModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel._actualPage,
      onTap: (i) => navegacionModel.actualPage = i,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Para ti',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados'),
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegationModel>(context);
    return PageView(
        controller: navegacionModel.pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[Tab1Page(), Tab2Page()]);
  }
}

class _NavegationModel with ChangeNotifier {
  int _actualPage = 0;
  PageController _pageController = new PageController();

  int get actualpage => this._actualPage;

  set actualPage(int valor) {
    this._actualPage = valor;
    _pageController.animateToPage(valor,
        duration: Duration(microseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
