import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sirst Screen'),
      ),
      body: new Center(
        child: new RaisedButton(
        child: new Text('Launch new sreen'),
            onPressed: (){
          Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new SecondScreen()),);
            }),
      ),
    );
    throw UnimplementedError();
  }
}

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text("Sencond Button"),
            onPressed: (){
              Navigator.pop(context);
            }),
      ),
    );
    throw UnimplementedError();
  }

}

