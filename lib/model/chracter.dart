import 'package:demo/Screens/Characters.dart';

class character {
  final String avatar;
  final String shortdesc;
  final String name;
  final String longDesc;

  character({this.avatar, this.shortdesc, this.name, this.longDesc});
}

List chracters = [
  character(
      avatar: "assets/images/avatar1.png",
      shortdesc: "short Desc",
      name: "first",
      longDesc: "Long Desc"),
  character(
      avatar: "assets/images/avatar2.jpg",
      shortdesc: "short Desc1",
      name: "second",
      longDesc: "Long Desc1"),
];
