import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new TodoScreen(),
//      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sirst Screen'),
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text('Launch new sreen'),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new SecondScreen()),
              );
            }),
      ),
    );
    throw UnimplementedError();
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text("Sencond Button"),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
    throw UnimplementedError();
  }
}

class Todo {
  final String title;
  final String description;
  Todo(this.title, this.description);
}

class TodoScreen extends StatelessWidget {
  final todos = new List.generate(
      20,
      (i) => new Todo(
            'Todo $i',
            'A description of what needs to be done for Todo $i',
          ));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todos'),
      ),
      body: new ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text(todos[index].title),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new DetailScreen(todo: todos[index]);
                }));
              },
            );
          }),
    );
    throw UnimplementedError();
  }
}

class DetailScreen extends StatelessWidget {
  final todo;
  DetailScreen({Key key, this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('${todo.title}'),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Text('${todo.description}'),
      ),
    );
    throw UnimplementedError();
  }
}
