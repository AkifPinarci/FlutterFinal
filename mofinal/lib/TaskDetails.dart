// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TaskDetailsPage extends StatefulWidget {
  var contactDetails;
  TaskDetailsPage(this.contactDetails);
  @override
  _TaskDetailsPageState createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
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
        title: Text("Task Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: 
              Text(
                'Task: ${widget.contactDetails['task']}', 
                style: TextStyle(fontSize: 32)
              )
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 40, bottom: 20, right: 40),
            child: 
              Text(
                'Details: ${widget.contactDetails['details']}',
                style: TextStyle(fontSize: 24)  
              )
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 40, bottom: 20, right: 40),
            child: 
              Text(
                'Importance: ${widget.contactDetails['importance']}',
                style: TextStyle(fontSize: 24)  
              )
          ),
          
        ],
      ),
    );
  }
}