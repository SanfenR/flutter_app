import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}


final todos = new List<Todo>.generate(20, (i) =>
new Todo("Todo $i",
    "A description of what needs to be done for Todo $i"));


void main() {
  runApp(new MaterialApp(
    title: "Passing Data",
    home: new TodosScreen(todos: todos,),
  ));
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  const TodosScreen({Key key, this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Todos"),),
      body: new ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text(todos[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new DetailScreen(
                          todo: todos[index],))
                );
              },
            );
          }),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Todo todo;

  const DetailScreen({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${todo.title}"),
      ),
      body: new Padding(padding: new EdgeInsets.all(16),
        child: new Text("${todo.description}"),
      ),
    );
  }

}
