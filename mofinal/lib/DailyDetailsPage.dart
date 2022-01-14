import 'package:flutter/material.dart';

class DailyDetailsPage extends StatefulWidget {
  const DailyDetailsPage({ Key? key }) : super(key: key);

  @override
  _DailyDetailsPageState createState() => _DailyDetailsPageState();
}

class _DailyDetailsPageState extends State<DailyDetailsPage> {
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
        title: Text("Daily Details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Akif")
        ],
      )
    );
  }
}