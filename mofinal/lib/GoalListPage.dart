// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mofinal/AddTaskPage.dart';
import 'package:mofinal/EditPage.dart';
import 'package:mofinal/TaskDetails.dart';
import 'package:mofinal/User_Profile.dart';

class GoalListPage extends StatefulWidget {
  const GoalListPage({ Key? key }) : super(key: key);

  @override
  _GoalListPageState createState() => _GoalListPageState();
}

class _GoalListPageState extends State<GoalListPage> {
  bool isChecked = false;
  
  var friendList = [];
  var checkMark = [    
    false, true, false, true, false, true, false, true, false, true,false, true, false, true, false, true, false, true, false, true
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
  _GoalListPageState(){
    uid = inputData();
    refreshTheList();
    FirebaseDatabase.instance.reference().child("profile/"+uid+"/tasks").onChildAdded.listen((event) {
      print("Data changed");
      refreshTheList();
    });
    FirebaseDatabase.instance.reference().child("profile/"+uid+"/tasks").onChildRemoved.listen((event) {
      print("Data changed");
      refreshTheList();
    });
  }
  void refreshTheList() {
    FirebaseDatabase.instance.reference().child("profile/"+uid+"/tasks").once()
    .then((datasnapshot){
      print("Successgully loaded tha data");
      uid = inputData();
      var userInfo = datasnapshot.value[uid];
      var friendTmpList = [];
      datasnapshot.value.forEach((k, v){
        friendTmpList.add(v);
      });
      UserProfile.currentUser = userInfo;
      friendList = friendTmpList;
      print(friendList);
      setState(() {
        
      });
    }).catchError((onError){
      print("Failed to load data");
      print(onError.toString());
    });

  }
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
              child: Text("Edit Profile"),
              onPressed: ()=>{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditPage()),
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
        itemCount: friendList.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            onTap: (){
              print(friendList);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskDetailsPage(friendList[index])),
              );
            },
            title: Container(
              height: 50,
              margin: EdgeInsets.only(left: 1, right: 1, top: 5, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(85.0)),
                color: Colors.amber[500],
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: 
                      Text('${friendList[index]["task"]}')
                  ),
                  Spacer(),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      splashRadius: 100,
                      shape: CircleBorder(),
                      checkColor: Colors.white,
                      onChanged: (bool? value) {
                        setState(() {
                          checkMark[index] = value!;
                        });
                      }, 
                      value: friendList[index]["compete"],
                    ),
                  ),
                ],
              )
            )
          );
        }
      ),
    );
  }
}