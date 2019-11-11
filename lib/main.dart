import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

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
      navigateAfterSeconds: new AfterSplash(),
    );
  }
}

// Show login screen after splash screen.
class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login Screen"),
        automaticallyImplyLeading: false,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/logo.png'),
              height: 125,
              width: 125,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: new TextFormField(
                decoration: new InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person,
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
                  if (val.length == 0) {
                    return "password should not be empty";
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
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)),
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
