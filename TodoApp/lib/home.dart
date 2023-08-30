import 'package:flutter/material.dart';

import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/todo_item.dart';
import 'model/todo.dart';



class Home extends StatelessWidget{
  Home ({Key? key}) : super(key: key);
  final todosList = ToDo.todoList();

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: buildAppBar(context),
  body: Container (
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

      for (ToDo todoo in todosList)
      ToDoItem(todo: todoo,),

    ],
  )
  ),
      ],
    ),
    ),
    );


  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        child:TextField(

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

