import 'package:demo/Common/TextStyle.dart';
import 'package:demo/model/chracter.dart';
import 'package:flutter/material.dart';

class characterDetail extends StatefulWidget {
  @override
  _characterDetailState createState() => _characterDetailState();
}

class _characterDetailState extends State<characterDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Hero(
              tag: "background-${chracters[0].name}",
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Colors.orange.shade400,
                      Colors.deepOrange.shade600
                    ])),
              ),
            ),
            Hero(
              tag: chracters[0].avatar,
              child: Image(
                image: AssetImage(chracters[0].avatar),
                height: 0.5 * size.height,
              ),
            ),
            Positioned(
              left: size.width / 2,
              top: size.height / 2,
              child: Hero(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
