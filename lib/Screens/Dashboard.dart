import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildHome();
  }
}

Widget _buildHome() {
  return Stack(
    children: <Widget>[
      Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 8.0),
            child: Container(
              height: 25,
              alignment: Alignment.centerLeft,
              child: Text(
                "Featured Matches",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          Container(
            height: 180,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return MatchCard();
              },
              itemCount: 3,
              viewportFraction: 0.8,
              scale: 0.9,
            ),
          )
        ],
      ),
    ],
  );
}

Widget MatchCard() {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
    child: Card(
      elevation: 5.0,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "India vs Bangladesh 2019",
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ),
          TeamScore(
              "https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/255px-Flag_of_India.svg.png",
              "400-9 & 400-9",
              "IND"),
          TeamScore(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Flag_of_Bangladesh.svg/255px-Flag_of_Bangladesh.svg.png",
              "345",
              "BAN"),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 5.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "India won the toss and elected to bat",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}

Widget TeamScore(String flag, String score, String teamName) {
  return Padding(
    padding: const EdgeInsets.only(left: 5.0, top: 5.0),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Image.network(
              flag,
              height: 35,
              width: 35,
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              teamName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Expanded(
          flex: 20,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                score,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
