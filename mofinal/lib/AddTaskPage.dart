// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({ Key? key }) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  var timeStamp = new DateTime.now().millisecondsSinceEpoch;
  var taskController = TextEditingController();
  var detailsController = TextEditingController();
  var importance = [    
    '!',
    '!!',
    '!!!',
  ];
  var uid;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? inputData() {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    // here you write the codes to input the data into firestore
    print("Ahanda id: " + uid!);
    return uid;
  }
  String dropdownvalue = '!';
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
        title: Text("Add a Task Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 20,
            child: Image(
              image: NetworkImage("https://miro.medium.com/max/4000/1*QIqfhHCSyiK2teQTg-1A4g.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              "New Task:",
              style: TextStyle(fontSize: 32),
            ),
          ),
          Expanded(
            flex: 10,
            child: 
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
              child: TextField(
                controller: taskController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Task',
                ),
              ),
            )
          ),
          Expanded(
            flex: 10,
            child: 
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
              child: TextField(
                controller: detailsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Task Details',
                ),
              ),
            )
          ),
          Expanded(
            flex: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(
                    "Importance: ",
                    style: TextStyle(fontSize: 32),
                  ),
                ),
                DropdownButton(
            
                  // Initial Value
                  value: dropdownvalue,
                    
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),    
                    
                  // Array list of items
                  items: importance.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) { 
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ], 
            ),
          ) ,
          Expanded(
            flex: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: RaisedButton(
                    color: Colors.orange,
                    child: Text(
                      "Confirm"
                    ),
                    onPressed: () => {
                      uid = inputData(),
                      timeStamp = new DateTime.now().millisecondsSinceEpoch,
                      FirebaseDatabase.instance.reference().child("profile/"+uid+"/tasks/task" + timeStamp.toString()).set(
                        {
                          "task" : taskController.text,
                          "details" : detailsController.text,
                          "importance" : dropdownvalue,
                          "compete": false
                        }
                      ).then((value){
                        print("Sucessfully added");
                      }).catchError((error){
                        print("Failed to add. " + error.toString());
                      }),
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ), 
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: RaisedButton(
                    color: Colors.orange,
                    child: Text(
                      "Cancel"
                    ),
                    onPressed: () => {
          
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                )   
              ]
            ),
          ),
        ],
      )
    );
  }
}