import 'package:google_maps_flutter/google_maps_flutter.dart';

class NoticiaRecente {
  int id;
  String tipo;
  String nome;
  String desc;
  String urlFoto;
  String urlVideo;
  String latitude;
  String longitude;
  latLng(){
    return LatLng(
      latitude == null || latitude.isEmpty ? 0.0 : double.parse(latitude),
      longitude == null || longitude.isEmpty ? 0.0 : double.parse(longitude)

    );
  }

  NoticiaRecente(
      {this.id,
        this.tipo,
        this.nome,
        this.desc,
        this.urlFoto,
        this.urlVideo,
        this.latitude,
        this.longitude});


  NoticiaRecente.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipo = json['tipo'];
    nome = json['nome'];
    desc = json['desc'];
    urlFoto = json['urlFoto'];
    urlVideo = json['urlVideo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tipo'] = this.tipo;
    data['nome'] = this.nome;
    data['desc'] = this.desc;
    data['urlFoto'] = this.urlFoto;
    data['urlVideo'] = this.urlVideo;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
