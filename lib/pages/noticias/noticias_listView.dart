import 'package:flutter/material.dart';
import 'package:flutter_app/pages/noticias/noticia_Recente.dart';
import 'package:flutter_app/pages/noticias/noticia_api.dart';
import 'package:flutter_app/pages/noticias/noticia_page.dart';
import 'package:flutter_app/utius/nav.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiasListView extends StatefulWidget {
  @override
  _NoticiasListViewState createState() => _NoticiasListViewState();
}

class _NoticiasListViewState extends State<NoticiasListView> {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    Future<List<NoticiaRecente>> future = NoticiaApi.getNoticia();
    return FutureBuilder(
      future: future,
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Center(
            child: Text(
              "Não foi possivel buscar as notícias", style: TextStyle(
              color: Colors.red, fontSize: 22,
            ),

            ),
          );
        }
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }
        List<NoticiaRecente> noticia = snapshot.data;
        return _listView(noticia);
      },
    );
  }

  Container _listView(List<NoticiaRecente> noticia) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: noticia != null ? noticia.length: 0,
          itemExtent: 300,
          itemBuilder: (context, index){
            NoticiaRecente nr = noticia[index];
            return Container(
              padding: EdgeInsets.all(10),
              child: Card(
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(child: Image.network(nr.urlFoto ?? "https://ichef.bbci.co.uk/news/320/cpsprodpb/1318A/production/_113881287_gettyimages-1204224469-1.jpg",
                      width: 250,)
                    ),
                    Text(nr.nome, maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 25),
                    ),
                    Text("Descrição...",
                      style: TextStyle(fontSize: 14),
                    ),
                    ButtonBarTheme(
                      data: ButtonBarTheme.of(context),
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('DETALHES'),
                            onPressed: () => _onClickNoticias(nr),
                          ),
                          FlatButton(
                            child: const Text('SHARE'),
                            onPressed: () {
                              /* ... */
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }

  _onClickNoticias(nr) {
    push(context, NoticiaPage(nr));
  }
}
