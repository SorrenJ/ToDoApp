import 'package:flutter/material.dart';

import 'package:todoapp/constants/colors.dart';



class Home extends StatelessWidget{
  const Home ({Key? key}) : super(key: key);


  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(

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
      ),
  body: Container (

    child:Text('This is my home'),
    ),
  );


  }
}

