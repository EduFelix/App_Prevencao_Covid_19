import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Hospitais/hospitais_api.dart';
import 'package:flutter_app/pages/Hospitais/hospitais_page.dart';
import 'package:flutter_app/pages/noticias/noticia_Recente.dart';
import 'package:flutter_app/utius/nav.dart';
import 'package:share/share.dart';

class HospitaisListView extends StatefulWidget {
  @override
  _HospitaisListViewState createState() => _HospitaisListViewState();
}

class _HospitaisListViewState extends State<HospitaisListView> {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    Future<List<NoticiaRecente>> future = HospitaisApi.getNoticia();
    return FutureBuilder(
      future: future,
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Center(
            child: Text(
              "Não foi possivel localizar os hospitais", style: TextStyle(
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
                    ButtonBarTheme(
                      data: ButtonBarTheme.of(context),
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('LOCALIDADE'),
                            onPressed: () => _onClickHospitais(nr),
                          ),
                          FlatButton(
                            child: const Text('SHARE'),
                            onPressed: () => _onClickShare(nr),
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

  _onClickHospitais(nr) {
    push(context, HospitaisPage(nr));
  }

  _onClickShare(NoticiaRecente nr) {
    print("Share ${nr.nome}");
    Share.share(nr.urlFoto);
  }
}
