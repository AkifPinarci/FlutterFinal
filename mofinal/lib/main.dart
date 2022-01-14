// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mofinal/GoalListPage.dart';
import 'package:mofinal/SignUpPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Expanded(
                flex: 30,
                child: 
                  Image(
                    image: NetworkImage("https://acttochange.org/wp-content/uploads/2015/10/Act_to_Change_1024x512.jpg"),
                    fit: BoxFit.fill,
                  )
              ),
              Expanded(
                flex: 10,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: 
                    Text(
                      "Sign In",
                      style: TextStyle(fontSize: 32)
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
                flex: 5,
                child: 
                  Container(
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        decoration: TextDecoration.underline 
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
                    child: Text("Login"),
                    onPressed: () =>{
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GoalListPage()),
                      ),
                    },
                  ),
                ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                      ),
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
