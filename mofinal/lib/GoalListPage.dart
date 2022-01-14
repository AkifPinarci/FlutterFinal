// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mofinal/AddTaskPage.dart';
import 'package:mofinal/DailyDetailsPage.dart';

class GoalListPage extends StatefulWidget {
  const GoalListPage({ Key? key }) : super(key: key);

  @override
  _GoalListPageState createState() => _GoalListPageState();
}

class _GoalListPageState extends State<GoalListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          child: Container(
            color: Colors.black,
            height: 4,
          ),
          preferredSize: Size.fromHeight(4.0),
        ),
        backgroundColor: Colors.orange,
        actions: [
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
            child: RaisedButton(
              color: Color(0xe3a909),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text("Daily Details"),
              onPressed: ()=>{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DailyDetailsPage()),
                ),
              }
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 80),
            child: RaisedButton(
              color: Color(0xe3a909),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text("Add a Task"),
              onPressed: ()=>{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddTaskPage()),
                ),
              }
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Container(
              height: 50,
              margin: EdgeInsets.only(left: 1, right: 1, top: 5, bottom: 5),
              child: Row(
                children: [
                  Text("Akif"),
                ],
              )
            )
          );
        }
      ),
    );
  }
}