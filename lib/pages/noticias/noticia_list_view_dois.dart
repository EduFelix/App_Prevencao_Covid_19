import 'package:flutter/material.dart';
import 'package:flutter_app/pages/noticias/noticia_page_dois.dart';
import 'package:flutter_app/utius/nav.dart';

class NoticiaDois {
  String nome;
  String foto;

  NoticiaDois(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {

  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noticias Recentes"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list),onPressed: () {
            print("Lista");
            setState(() {
              _gridView = false;
            });
          },),
          IconButton(icon: Icon(Icons.grid_on),onPressed: () {
            print("Grid");
            setState(() {
              _gridView = true;
            });
          },)
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    List<NoticiaDois> noticias = [
      NoticiaDois("Covid-19: Brasil tem 559 mortes nas últimas 24h; total ultrapassa 150 mil",
          "https://img.olhardigital.com.br/uploads/acervo_imagens/2020/03/r16x9/20200331111038_1200_675_-_falta_de_testes_aumenta_taixa_de_letalidade_do_coronavirus_no_brasil.jpg"),
      NoticiaDois("Brasil chega a 150 mil mortos por covid-19; leia os dados de todos os Estados",
          "https://static.poder360.com.br/2020/10/pacientes-coronavirus-brasilia-868x644.jpg"),
      NoticiaDois("Brasil passa de 150 mil mortes por Covid-19; apenas o Maranhão registra alta na média de óbitos",
          "https://s2.glbimg.com/mr9sT31iw0nIxDuA5UG8CPHJoB4=/0x0:1301x3434/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2020/n/J/INKPndRwubbQz4yXbbWg/estavel-2x.png"),
      NoticiaDois("Pernambuco tem 584 novos casos da Covid-19 e 11 mortes confirmadas em 24h",
          "https://cdn.folhape.com.br/img/pc/1100/1/dn_arquivo/2020/09/ibmp-intec-2020-c-itamar-crispim-8678-0.jpg"),
      NoticiaDois("Bares do Recife são interditados por descumprirem protocolo de convivência com a Covid-19",
          "https://imagens.ne10.uol.com.br/veiculos/_midias/jpg/2020/10/10/806x444/1_procon-16713492.jpeg")
    ];

    if(_gridView) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: noticias.length,
        itemBuilder: (BuildContext context, int index) {
          return _itemView(noticias, index);
        },
      );
    } else {
      return ListView.builder(
        itemExtent: 350,
        itemCount: noticias.length,
        itemBuilder: (BuildContext context, int index) {
          return _itemView(noticias, index);
        },
      );
    }

  }

  _itemView(List<NoticiaDois> noticias, int index) {
    NoticiaDois noticia = noticias[index];

    return GestureDetector(
      onTap: () {
        push(context, NoticiaPageDois(noticia));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(noticia.foto),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Text(
                noticia.nome,
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _img(String img) {
    return Image.network(
      img,
      fit: BoxFit.cover,
    );
  }

}