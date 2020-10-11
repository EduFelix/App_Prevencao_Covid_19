import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Hospitais/hospitais_listView.dart';

class ListaHospitais extends StatefulWidget {
  @override
  _ListaHospitaisState createState() => _ListaHospitaisState();
}

class _ListaHospitaisState extends State<ListaHospitais> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hospitais"),
        ),
      body:HospitaisListView(),
      );
  }

}
