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
      home: new HomeScreen(),
//      home: new TodoScreen(),
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

//==========================================传值到前一个界面=========================//
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Returning Data Demo'),
      ),
      body: new Center(child: new SelectionButton()),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: new Text('Pick an option, any option!'),
    );
  }

  // A method that launches the SelectionScreen and awaits the result from
  // Navigator.pop!
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that will complete after we call
    // Navigator.pop on the Selection Screen!
    final result = await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new SelectionScreen()),
    );

    // After the Selection Screen returns a result, show it in a Snackbar!
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text("$result")));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Pick an option'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: () {
                  // Close the screen and return "Yep!" as the result
                  Navigator.pop(context, 'Yep!');
                },
                child: new Text('Yep!'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: () {
                  // Close the screen and return "Nope!" as the result
                  Navigator.pop(context, 'Nope.');
                },
                child: new Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}


