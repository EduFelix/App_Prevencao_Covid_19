import 'package:flutter_app/pages/noticias/noticia_Recente.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoPageUm extends StatefulWidget {
  final NoticiaRecente noticia;
  VideoPageUm(this.noticia);
  @override
  _VideoPageUmState createState() => _VideoPageUmState();
}

class _VideoPageUmState extends State<VideoPageUm> {

  VideoPlayerController _controller;
  NoticiaRecente get noticia => widget.noticia;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        noticia.urlVideo)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });

      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noticia.nome),
      ),
      body: Center(
        child: _controller.value.initialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}