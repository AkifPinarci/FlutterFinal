// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers, unnecessary_new, deprecated_member_use

import "package:flutter/material.dart";
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
  var percentageController = TextEditingController();

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
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 32,
                  )  
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
                  width: 200,
                  margin: EdgeInsets.only(left: 50, right: 50, top: 0, bottom: 0),
                  child: TextField(
                    controller: percentageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Percentage',
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
                      Navigator.pop(context)
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