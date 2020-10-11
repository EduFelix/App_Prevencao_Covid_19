import 'package:flutter/material.dart';
import 'package:flutter_app/pages/noticias/covid_cinco.dart';
import 'package:flutter_app/pages/noticias/covid_dois.dart';
import 'package:flutter_app/pages/noticias/covid_quatro.dart';
import 'package:flutter_app/pages/noticias/covid_treis.dart';
import 'package:flutter_app/pages/noticias/covid_um.dart';
import 'package:flutter_app/pages/noticias/noticia_list_view_dois.dart';
import 'package:flutter_app/pages/videos/video_dois.dart';
import 'package:flutter_app/pages/videos/video_um.dart';
import 'package:flutter_app/pages/videos/videos_listview_dois.dart';
import 'package:flutter_app/utius/nav.dart';


class VideosPageDois extends StatelessWidget {

  final Video video;

  VideosPageDois(this.video);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(video.nome),
      ),
      body: _onClickSite(context),
    );
  }

  _onClickSite(context) {
    if(video.nome== "Dicas de como evitar CORONAVÍRUS"){

      push(context, VideoUm());
    }
    if(video.nome== "Dicas sobre Coronavírus (COVID-19)"){

      push(context, VideoDois());
    }

    if(video.nome== "Coronavírus: como age? Por onde anda? Como evitar?"){

      push(context, CovidTreis());
    }



  }
}