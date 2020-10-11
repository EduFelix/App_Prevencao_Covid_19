import 'package:flutter_app/pages/noticias/noticia_Recente.dart';

class HospitaisApi{
  static Future<List<NoticiaRecente>> getNoticia() async{
    final noticiaRecentes = List<NoticiaRecente>();
    await Future.delayed(Duration(seconds: 2));
    noticiaRecentes.add(NoticiaRecente(nome:"Barrão de Lucena",
        urlFoto:"http://portal.saude.pe.gov.br/sites/portal.saude.pe.gov.br/files/styles/destaque_node/public/hbl-ambulatorio_mg_6026_site_0.jpg?itok=V575cnOz",
        latitude: "-8.0384821", longitude: "-34.9389858"));
    noticiaRecentes.add(NoticiaRecente(nome:"Agamenom Magalhães",
        urlFoto:"http://portal.saude.pe.gov.br/sites/portal.saude.pe.gov.br/files/styles/destaque_node/public/ham_21_.jpg?itok=LhADVEgj"
        , latitude: "-8.0301954", longitude: "-34.9091138"));
    noticiaRecentes.add(NoticiaRecente(nome:"Hospital da Restauração",
        urlFoto:"http://portal.saude.pe.gov.br/sites/portal.saude.pe.gov.br/files/styles/destaque_node/public/hr_-_1_.jpg?itok=5-iINRFq"
        ,latitude: "-8.0535049", longitude: "-34.8999281"));

    return noticiaRecentes;
  }
}