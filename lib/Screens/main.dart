import 'package:demo/Providers/LoginProvider.dart';
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
        primarySwatch: Colors.blue,
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

    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Form(
              key: _formKey,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.only(left: 30.0),
//                    child: Container(
//                      height: 250,
//                      width: MediaQuery.of(context).size.width,
//                      decoration: BoxDecoration(
//                        color: Colors.purple,
//                        borderRadius:
//                            BorderRadius.only(bottomLeft: Radius.circular(75)),
//                      ),
//                      child: Padding(
//                        padding: const EdgeInsets.all(50.0),
//                        child: Image.asset(
//                          "assets/images/logo.png",
//                        ),
//                      ),
//                    ),
//                  ),
                  const Image(
                    image: AssetImage('assets/images/logo.png'),
                    height: 150,
                    width: 150,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new TextFormField(
                      controller: _userName,
                      decoration: new InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        labelText: "Enter Email",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
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
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new TextFormField(
                      obscureText: true,
                      controller: _password,
                      decoration: new InputDecoration(
                        labelText: "Enter Password",
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),

                        //fillColor: Colors.green
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
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text(
                    !_data.isAuthenticated
                        ? "Invalid Username or Password"
                        : "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 75.0,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  side: BorderSide(color: Colors.blue)),
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _loginPress(context, _data);
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
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
