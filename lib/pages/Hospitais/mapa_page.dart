import 'package:flutter/material.dart';
import 'package:flutter_app/pages/noticias/noticia_Recente.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatelessWidget {
  NoticiaRecente noticia;
  MapaPage(this.noticia);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(noticia.nome) ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: GoogleMap(
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition( target: latLng(),
          zoom: 15,
        ),
        markers: Set.of(_getMakers()),
      ),

    );
  }

  latLng() {
    return noticia.latLng();
      //LatLng(-8.0384821,-34.9389858);

  }

  List<Marker> _getMakers() {
    return [
      Marker(
        markerId: MarkerId("1"),
        position: noticia.latLng(),
        infoWindow: InfoWindow(title: noticia.nome, snippet: "Hospital ${noticia.nome}",
        onTap: (){
          print("Clicou na janela");
        }),
        onTap: (){
          print("Clicou no marcador");
        }
      )
    ];
  }
}
