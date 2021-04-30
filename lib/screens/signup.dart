import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_mobim/screens/component/roundedinput.dart';
import 'package:firebase_mobim/screens/component/roundedinputpassword.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<void> _submit() async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailcontroller.text,
                password: _passwordcontroller.text);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
      Navigator.pop(context);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hesap oluştur',
            style: TextStyle(color: Colors.blue, fontSize: 25),
          ),
          Column(
            children: [
              RoundedInput('İsminiz', _namecontroller),
              SizedBox(
                height: 10,
              ),
              RoundedInput('email', _emailcontroller),
              SizedBox(
                height: 10,
              ),
              RoundedInputpassword(_passwordcontroller),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.only(left: 50, right: 50))),
                  onPressed: _submit,
                  child: Text('Kaydol')),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Text(' Veya '),
              Expanded(
                child: Divider(
                  color: Colors.black,
                ),
              )
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text('Zaten hesabınız var mı? Oturum aç'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
