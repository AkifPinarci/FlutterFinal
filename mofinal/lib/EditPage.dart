// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_typing_uninitialized_variables, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mofinal/User_Profile.dart';

class EditPage extends StatefulWidget {
  const EditPage({ Key? key }) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late var userProfile;
  var changeNameCOntroller = TextEditingController();
  var changePasswordCOntroller = TextEditingController();
  var changeEmailCOntroller = TextEditingController();
  var changeGoalCOntroller = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  String? inputData() {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    // here you write the codes to input the data into firestore
    print("Ahanda id: " + uid!);
    return uid;
  }
  @override
  void initState() {
    super.initState();
    var uid = inputData();
    FirebaseDatabase.instance.reference().child("profile/"+ uid!).once()
      .then((ds){
        print(uid);
        userProfile = ds.value;
        setState(() {
          
        });
      }).catchError((onError){
        print(onError);
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
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 40,
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 10,
                        child: 
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
                          child: TextField(
                            controller: changeNameCOntroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Change Name',
                            ),
                          ),
                        )
                      ),
                      Expanded(
                        flex: 10,
                        child: 
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
                          child: TextField(
                            controller: changePasswordCOntroller,
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Change Passwsord',
                            ),
                          ),
                        )
                      ),
                      Expanded(
                        flex: 10,
                        child: 
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
                          child: TextField(
                            controller: changeEmailCOntroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Change Email',
                            ),
                          ),
                        )
                      ),
                      Expanded(
                        flex: 10,
                        child: 
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 0),
                          child: TextField(
                            controller: changeGoalCOntroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Set Goal Percantage',
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      padding: EdgeInsets.only(bottom: 10),
                      child: RaisedButton(
                        color: Colors.orange,
                        child: Text(
                          "Confirm"
                        ),
                        onPressed: () => {
                          userProfile['name'] = changeNameCOntroller.text,
                          userProfile['email'] = changeEmailCOntroller.text,
                          userProfile['goal'] = changeGoalCOntroller.text,
                          FirebaseDatabase.instance.reference().child("profile/" + userProfile['uid']).set(userProfile)
                          .then((value){
                            print("Updated the profile");
                          })
                          .catchError((error){
                            print("Failed to update profile");
                          }),
                          Navigator.pop(context)
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ), 
                    Container(
                      width: 150,
                      padding: EdgeInsets.only(bottom: 10),
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
                    ),
                    
                  ]
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}