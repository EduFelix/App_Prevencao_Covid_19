import 'package:flutter/material.dart';
import 'package:flutter_app/pages/noticias/Home_Page.dart';
import 'package:flutter_app/pages/noticias/noticia_Recente.dart';
import 'package:flutter_app/pages/noticias/noticia_api.dart';
import 'package:flutter_app/pages/noticias/noticias_listView.dart';

class ListaNoticias extends StatefulWidget {
  @override
  _ListaNoticiasState createState() => _ListaNoticiasState();
}

class _ListaNoticiasState extends State<ListaNoticias> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notícias Recentes"),
          bottom: TabBar(tabs: [
            Tab(text: "Noticias",),
          ],
          ),
        ),
        body: TabBarView(
          children: [
            NoticiasListView(),

          ],
        ),
      ),
    );
  }


}
