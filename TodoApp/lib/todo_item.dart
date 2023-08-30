import 'package:flutter/material.dart';
import 'model/todo.dart';
class ToDoItem extends StatelessWidget {
final ToDo todo;
  const ToDoItem ({Key? key, required this.todo}) : super(key: key);



  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: 20), //seperates item
      child: ListTile(
          onTap: () {
            print('Clicked on ToDo item');

          },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)

        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.amberAccent,
        ),
      title: Text(
       todo.todoText!,
        style: TextStyle (
          fontSize: 16,
          color: Colors.black,
          decoration: todo.isDone? TextDecoration.lineThrough : null,// if done then linethrough else null
        ),
      ),
      trailing: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(vertical:12),
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(5),
        ),
        child: IconButton(
        color: Colors.white,
        iconSize: 18,
          icon: Icon(Icons.delete),
         onPressed: () {
           print('Clicked on delete ToDo item');

         },
        ),
      ),


      ),
    );
  }
}