import 'package:flutter/material.dart';

import '../home.dart';

  Widget myButton(context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
              colors: [Color(0xFFe0bafc), Color(0xffb960fa)],
              end: Alignment.bottomRight,
              begin: Alignment.topLeft),
        ),
        width: MediaQuery.of(context).size.width / 3 - 100,
        child: FlatButton(
          color: Colors.transparent,
          textColor: Colors.white,
          child: Text('Start Start Scanning Things'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
    );
  }