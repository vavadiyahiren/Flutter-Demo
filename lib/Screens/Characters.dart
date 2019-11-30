import 'package:demo/Common/TextStyle.dart';
import 'package:demo/model/chracter.dart';
import 'package:flutter/material.dart';

import 'characterDetail.dart';

class Characters extends StatefulWidget {
  @override
  _CharactersState createState() => _CharactersState();
}

class _CharactersState extends State<Characters> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Container(
      color: Colors.white,
      width: width,
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 18.0),
              child: Text(
                "Chracters",
                textAlign: TextAlign.start,
                style: TextStyles.CharactesText,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 300),
                        pageBuilder: (context, _, __) => characterDetail()));
              },
              child: Stack(
                children: [
                  Character(),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      tag: chracters[0].avatar,
                      child: Image(
                        image: AssetImage(chracters[0].avatar),
                        height: 0.9 * size.height,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          tag: chracters[0].name,
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              child: Text(
                                chracters[0].name,
                                style: TextStyles.heading,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Character extends StatefulWidget {
  @override
  _CharacterState createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipPath(
            clipper: characterClipper(),
            child: Hero(
              tag: "background-${chracters[0].name}",
              child: Container(
                height: 0.6 * height,
                width: width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.orange.shade400,
                  Colors.deepOrange.shade600
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class characterClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clipPath = Path();
    double curve = 50;

    clipPath.moveTo(0, size.height / 3 + curve);
    clipPath.lineTo(0, size.height - curve);

    clipPath.quadraticBezierTo(0, size.height, curve, size.height);
    clipPath.lineTo(size.width - curve, size.height);
    clipPath.quadraticBezierTo(
        size.width, size.height, size.width, size.height - curve);
    clipPath.lineTo(size.width, 0 + curve);
    clipPath.quadraticBezierTo(
        size.width, 0, size.width - curve, curve - curve / 2);
    clipPath.lineTo(curve - curve / 2, size.height / 3);
    clipPath.quadraticBezierTo(
        0, size.height / 3 + curve / 4, 0, size.height / 3 + curve / 2);

    return clipPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
