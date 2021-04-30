//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_mobim/screens/component/roundedinput.dart';
import 'package:flutter/material.dart';

class Reset extends StatelessWidget {
  final _emailcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Şifremi Unuttum',
              style: TextStyle(color: Colors.blue, fontSize: 25),
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                RoundedInput('email', _emailcontroller),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.only(left: 50, right: 50))),
                    onPressed: () {
                      auth.sendPasswordResetEmail(email: _emailcontroller.text);
                      Navigator.of(context).pop();
                    },
                    child: Text('Şifreyi Sıfırla')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
