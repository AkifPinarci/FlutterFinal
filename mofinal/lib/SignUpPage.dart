// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers, unnecessary_new, deprecated_member_use, non_constant_identifier_names, avoid_types_as_parameter_names, avoid_print

import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var goalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:  BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 30,
                child: 
                Image(
                  image: NetworkImage("https://janeadsheadgrant.com/wp-content/uploads/2015/09/4-Reasons-why-embracing-change-in-business-is-vital-thegem-blog-default.jpg"),
                  fit: BoxFit.fill,
                )
              ),
              // ignore: prefer_const_constructors
              Expanded(
                flex:10,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      fontSize: 32,
                    )  
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: 
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email',
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
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
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
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Name',
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
                    controller: goalController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Goal Percentege',
                    ),
                  ),
                )
              ),
              Expanded(
                flex: 10,
                child: Container(
                  width: 200,
                  margin: EdgeInsets.only(bottom:15, top:15),
                  child: RaisedButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text("Sign Up"),
                    onPressed: () =>{
                      FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                      .then((UserCredential){
                        print("Succesfully signed up! uID:"+ UserCredential.user!.uid.toString());

                        var userProfile = {
                          'uid': UserCredential.user!.uid.toString(),
                          'name' : nameController.text,
                          'email' : emailController.text,
                          'goal' : goalController.text,
                          'tasks': null,
                        };
                          
                        FirebaseDatabase.instance.reference().child("profile/"+ UserCredential.user!.uid.toString())
                          .set(userProfile)
                          .then((value){
                            print("Created the profile");
                          })
                          .catchError((onError){
                            print("Failed to created the profile");
                          });
                        Navigator.pop(context);
                      }).catchError((onError){
                        print("Failed to sign up!");
                        print(onError.toString());
                      }
                      ),
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}