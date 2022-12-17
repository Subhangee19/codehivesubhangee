import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('CodeHive'),
      centerTitle: false,
      backgroundColor: Colors.orange[700],
    ),
    body: Center(
      child: Text(
          'Welcome to our new app!',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.grey[600],
              fontFamily: ''
          )
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: null,
      child: Text('click'),
      backgroundColor: Colors.orange[700],
    ),

  ),
));

