import 'dart:ui' as prefix0;

import 'package:demo/Common/TextStyle.dart';
import 'package:demo/Providers/LoginProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _userName.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 1,
      photoSize: 100,
      image: Image(
        image: AssetImage('assets/images/logo.png'),
        fit: BoxFit.fill,
      ),
      backgroundColor: Colors.white,
      navigateAfterSeconds: ChangeNotifierProvider<LoginProvider>(
          builder: (_) => LoginProvider(true), child: AfterSplash()),
    );
  }
}

// Show login screen after splash screen.
class AfterSplash extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  var error = false;

  String errorMessage = "";

  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _data = Provider.of<LoginProvider>(context);

    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return new Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: width, minHeight: height),
          child: IntrinsicHeight(
            child: Form(
              key: _formKey,
              child: new Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    height: height * 0.30,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          "Login",
                          style: TextStyles.LoginTextStyle,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                      child: Text(
                        "Please sign in to continue.",
                        style: TextStyles.LoginText,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0, left: 18, right: 18),
                    child: Material(
                      elevation: 10,
                      child: Center(
                        child: new TextFormField(
                          scrollPadding: EdgeInsets.only(left: 50),
                          cursorColor: Colors.black,
                          controller: _userName,
                          decoration: new InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email,
                            ),
                            labelText: "Enter Email",
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            //fillColor: Colors.green
                          ),
                          validator: (val) {
                            if (val.length == 0) {
                              return "Email cannot be empty";
                            } else if (!val.contains("@")) {
                              return "Please Enter valid email";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: new TextStyle(
                            fontFamily: "Ubuntu-M",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 18, right: 18),
                    child: Material(
                      elevation: 10,
                      child: new TextFormField(
                        obscureText: true,
                        controller: _password,
                        decoration: new InputDecoration(
                          suffix: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Text("Forgot"),
                          ),
                          suffixStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.blueAccent,
                              fontFamily: 'Ubuntu-M',
                              fontWeight: FontWeight.w500),
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          labelText: "Enter Password",
                          prefixIcon: const Icon(
                            Icons.lock,
                          ),
                        ),
                        validator: (val) {
                          if (val.length < 3) {
                            return "password should be more then 4 character";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.visiblePassword,
                        style: new TextStyle(
                          fontFamily: "Ubuntu-M",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, left: 18),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        !_data.isAuthenticated
                            ? "Invalid Username or Password"
                            : "",
                        textAlign: TextAlign.center,
                        style: TextStyles.LoginErrorStyle,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                            ),
                          ],
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          gradient: LinearGradient(
                              colors: [
                                Colors.lightBlueAccent,
                                Colors.blue,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                        ),
                        child: FlatButton(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Sign In",
                                style: TextStyle(
                                    fontSize: 20, fontFamily: "Ubuntu-M"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(Icons.arrow_forward),
                              ),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          textColor: Colors.white,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _loginPress(context, _data);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Don't have an account ? ",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                                fontFamily: "Ubuntu-C"),
                          ),
                          Text("Sign Up",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Ubuntu-C"))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginPress(BuildContext context, LoginProvider data) {
    String username = _userName.text;
    String password = _password.text;

    if (username == 'a@a.com' && password == '123456') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home(username)),
      );
    } else {
      data.changeAuthenticated(false);
    }
  }
}
