import 'package:flutter/material.dart';

class TextStyles {
  static const LoginTextStyle =
      TextStyle(fontSize: 50, fontWeight: FontWeight.w900, color: Colors.black);

  static final CharactesText = TextStyle(
      fontSize: 40,
      color: Colors.black,
      fontWeight: FontWeight.w900,
      fontFamily: 'Ubuntu-B');

  static final LoginText = TextStyle(
      fontSize: 20,
      color: Colors.grey,
      fontWeight: FontWeight.w900,
      fontFamily: 'Ubuntu-R');

  static final LoginErrorStyle = TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.w600,
      fontFamily: 'Ubuntu-R',
      fontSize: 15);

  static const heading = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 30,
      fontFamily: "Ubuntu-B");
}
