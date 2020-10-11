import 'package:flutter/material.dart';
import 'package:flutter_app/pages/noticias/Home_Page.dart';
import 'package:flutter_app/pages/noticias/noticia_Recente.dart';
import 'package:flutter_app/pages/noticias/noticia_api.dart';
import 'package:flutter_app/pages/noticias/noticia_list_view_dois.dart';
import 'package:flutter_app/pages/noticias/noticias_listView.dart';
import 'package:flutter_app/utius/nav.dart';
import 'package:flutter_app/widgets/blue_button.dart';

class ListaNoticias extends StatefulWidget {
  @override
  _ListaNoticiasState createState() => _ListaNoticiasState();
}

class _ListaNoticiasState extends State<ListaNoticias> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notícias Recentes"),
          bottom: TabBar(tabs: [
            Tab(text: "Noticias",),
          ],
          ),
        ),
        body: TabBarView(
          children: [
            HelloListView(),

          ],
        ),
      ),
    );
  }

 // _body() {
  //  return ListView(
   //   children: [

    //    BlueButton( "Saiba Mais!", () => _onClickNavi(context, ListaNoticias())),
     //   BlueButton( "Saiba Mais!", () => _onClickNavi(context, ListaNoticias())),
      //  BlueButton( "Saiba Mais!", () => _onClickNavi(context, ListaNoticias())),
     // ],
    //);
  //}


  void _onClickNavi(BuildContext context, Widget page) async{
    String s = await push(context, page);
    print(">> $s");
  }

}
