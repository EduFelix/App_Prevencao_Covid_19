import 'package:flutter_app/pages/noticias/noticia_Recente.dart';

class NoticiaApi{
  static Future<List<NoticiaRecente>> getNoticia() async{
    final noticiaRecentes = List<NoticiaRecente>();
    await Future.delayed(Duration(seconds: 2));
    noticiaRecentes.add(NoticiaRecente(nome:"Coronavírus em Alta",
        urlFoto:"https://ichef.bbci.co.uk/news/320/cpsprodpb/1318A/production/_113881287_gettyimages-1204224469-1.jpg", desc: "https://g1.globo.com/bemestar/coronavirus/noticia/2020/09/26/casos-e-mortes-por-coronavirus-no-brasil-em-26-de-setembro-segundo-consorcio-de-veiculos-de-imprensa.ghtml"));
    noticiaRecentes.add(NoticiaRecente(nome:"Pandemia",
        urlFoto:"https://conteudo.imguol.com.br/c/noticias/14/2020/08/28/imagem-de-computador-representando-o-novo-coronavirus-1598636462779_v2_900x506.jpg"));
    noticiaRecentes.add(NoticiaRecente(nome:"Imunidade Adquirida",
        urlFoto:"https://ogimg.infoglobo.com.br/in/24638924-a95-b83/FT1086A/652/xCovid-19Projeto-de-testagem-da-forca-tarefa-de-estudo.jpg.pagespeed.ic.GvncK_KBdK.jpg"));

    return noticiaRecentes;
  }
}