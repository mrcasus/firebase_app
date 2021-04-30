import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_mobim/screens/deneme.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text('After Login Screen'),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Deneme()));
              },
              child: Text("Signout")),
          TextButton(
              onPressed: () async => await FirebaseAuth.instance.signOut(),
              child: Text("Signout"))
        ],
      ),
    );
  }
}
