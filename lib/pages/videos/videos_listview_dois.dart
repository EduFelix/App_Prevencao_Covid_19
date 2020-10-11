import 'package:flutter/material.dart';
import 'package:flutter_app/pages/videos/videos_page_dois.dart';
import 'package:flutter_app/utius/nav.dart';

class Video {
  String nome;
  String foto;

  Video(this.nome, this.foto);
}

class VideoListViewDois extends StatefulWidget {

  @override
  _VideoListViewDoisState createState() => _VideoListViewDoisState();
}

class _VideoListViewDoisState extends State<VideoListViewDois> {
  bool _gridView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Videos"),
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
    List<Video> videos = [
      Video("Dicas de como evitar CORONAVÍRUS", "assets/imagens/foto1.jpg"),
      Video("Dicas sobre Coronavírus (COVID-19)", "assets/imagens/foto2.jpg"),
      Video("Coronavírus: como age? Por onde anda? Como evitar?", "assets/imagens/foto3.jpg"),
    ];

    if(_gridView) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: videos.length,
        itemBuilder: (BuildContext context, int index) {
          return _itemView(videos, index);
        },
      );
    } else {
      return ListView.builder(
        itemExtent: 350,
        itemCount: videos.length,
        itemBuilder: (BuildContext context, int index) {
          return _itemView(videos, index);
        },
      );
    }

  }

  _itemView(List<Video> videos, int index) {
    Video video = videos[index];

    return GestureDetector(
      onTap: () {
        push(context, VideosPageDois(video));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(video.foto),
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
                video.nome,
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}