import 'package:flutter/material.dart';
import 'package:flutternw/data/model/champion.dart';
import 'package:flutternw/util/Config.dart';
import 'package:flutternw/util/assets.dart';
import 'package:meta/meta.dart';

class EventPoster extends StatelessWidget {
  static final Key playButtonKey = new Key('playButton');

  EventPoster({
    @required this.event,
    this.size,
    this.displayPlayButton = false,
  });

  final Champion event;
  final Size size;
  final bool displayPlayButton;

  BoxDecoration _buildDecorations() {
    return new BoxDecoration(
      boxShadow: <BoxShadow>[
        new BoxShadow(
          offset: const Offset(1.0, 1.0),
          spreadRadius: 1.0,
          blurRadius: 2.0,
          color: Colors.black38,
        ),
      ],
      gradient: new LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: <Color>[
          const Color(0xFF222222),
          const Color(0xFF424242),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var content = <Widget>[
      new Icon(
        Icons.local_movies,
        color: Colors.white24,
        size: 72.0,
      ),
      new FadeInImage.assetNetwork(
        placeholder: ImageAssets.transparentImage,
        image: Config.baseImageUrl + event.image ?? '',
        width: size?.width,
        height: size?.height,
        fadeInDuration: const Duration(milliseconds: 300),
        fit: BoxFit.cover,
      ),
    ];

    return new Container(
      decoration: _buildDecorations(),
      width: size?.width,
      height: size?.height,
      child: new Stack(
        alignment: Alignment.center,
        children: content,
      ),
    );
  }
}
