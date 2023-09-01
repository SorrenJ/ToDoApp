import 'package:flutter/material.dart';

import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/todo_item.dart';
import 'model/todo.dart';



class Home extends StatefulWidget{
  Home ({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
final _todoController =TextEditingController();

void initState(){
  _foundToDo = todosList;
  super.initState();
}


  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: buildAppBar(context),
  body: Stack(
  children: [
  Container(
padding: EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 15
),
    child:Column(
      children: [
       searchBox(),
  Expanded(
  child: ListView(
    children: [
      Container(
        margin: EdgeInsets.only(top: 50, bottom: 20,),
        child: Text('All ToDos',style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500))
      ),

      //passed from todo_item.dart
      for (ToDo todoo in _foundToDo.reversed) //comes from the search, reversed places newest item on top
      ToDoItem(
        todo: todoo,
      onToDoChanged: _handleToDoChange,
        onDeleteItem: _deleteToDoItem,
      ),

    ],
  )
  ),
      ],
    ),
    ),
Align(
  alignment:Alignment.bottomCenter,
  child:Row(children:[
    Expanded(child: Container(margin: EdgeInsets.only(bottom: 20, right: 20, left: 20,
    ),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5, ),
        decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: const [BoxShadow(
        color: Colors.grey,
        offset: Offset(0.0,0.0),
      blurRadius:10.0,
        spreadRadius:0.0,
      ),],
   borderRadius: BorderRadius.circular(10),

    ),
    child: TextField(
      controller: _todoController,
      decoration: InputDecoration(
        hintText:'Add a new todo item',
        border: InputBorder.none

      ),
    ),
    ),
    ),
  Container(
    margin:EdgeInsets.only(bottom: 20,
        right: 20
    ),
  child: ElevatedButton(
    child:Text('+',style: TextStyle(fontSize: 40,),),
    onPressed: () {
      _addTodDoItem(_todoController.text);
    },
    style: ElevatedButton.styleFrom(
      primary: Colors.blue,
      minimumSize: Size(60,60),
      elevation: 10,
    )
  )
  )
  ])
),

    ],
  ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id); //if item id matches then it will be removed
    });

  }


  void _addTodDoItem(String toDo){
    setState(() {
    todosList.add(ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(), //timestamp to create unique id everytime
      todoText: toDo,
    ));
  });
       _todoController.clear();
        }

        void _runFilter(String enteredKeyword) { //filter function for searchbox
List<ToDo>results = [];
if ( enteredKeyword.isEmpty ) {
  results = todosList;
} else {
results = todosList.where((item) => item.todoText!
    .toLowerCase()
    .contains(enteredKeyword
    .toLowerCase()))
    .toList(); //convert entered keyword to lowercase then to a list
}

setState((){
  _foundToDo = results;
});
        }
  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        child:TextField(
onChanged: (value)=> _runFilter(value),//checks for the search functionality, checks the value of every keystroke
          decoration:InputDecoration(
            contentPadding: EdgeInsets.all(3),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints (
                maxHeight: 20,
                minWidth: 25
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),

      );

  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(

      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
elevation:0,
      title: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
        Icon(
          Icons.menu,
          color: tdBlack,
          size: 30,
    ),

    Container(

      height: 40,
      width: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset('images/avatar.jpeg'),
      ),
    ),
]),
    );
  }
}

