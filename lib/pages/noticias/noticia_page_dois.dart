import 'package:flutter/material.dart';
import 'package:flutter_app/pages/noticias/covid_cinco.dart';
import 'package:flutter_app/pages/noticias/covid_dois.dart';
import 'package:flutter_app/pages/noticias/covid_quatro.dart';
import 'package:flutter_app/pages/noticias/covid_treis.dart';
import 'package:flutter_app/pages/noticias/covid_um.dart';
import 'package:flutter_app/pages/noticias/noticia_list_view_dois.dart';
import 'package:flutter_app/utius/nav.dart';


class NoticiaPageDois extends StatelessWidget {

  final NoticiaDois noticia;

  NoticiaPageDois(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noticia.nome),
      ),
      body: _onClickSite(context),
    );
  }

  _onClickSite(context) {
    if(noticia.nome== "Covid-19: Brasil tem 559 mortes nas últimas 24h; total ultrapassa 150 mil"){

      push(context, CovidUm());
    }
    if(noticia.nome== "Brasil chega a 150 mil mortos por covid-19; leia os dados de todos os Estados"){

      push(context, CovidDois());
    }

    if(noticia.nome== "Brasil passa de 150 mil mortes por Covid-19; apenas o Maranhão registra alta na média de óbitos"){

      push(context, CovidTreis());
    }

    if(noticia.nome== "Pernambuco tem 584 novos casos da Covid-19 e 11 mortes confirmadas em 24h"){

      push(context, CovidQuatro());
    }

    if(noticia.nome== "Bares do Recife são interditados por descumprirem protocolo de convivência com a Covid-19"){

      push(context, CovidCinco());
    }

  }
}