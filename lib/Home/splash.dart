import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_revenda/Login/pages/login_page_cliente.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds:3),(){
      Navigator.push(context,MaterialPageRoute(
        builder: (context)=>const LoginPage(),
      ));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Image.asset('assets/launch_image.png'),
            const SizedBox(height: 5.0,),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
              strokeWidth: 11.0,
            ),
          ],
        ),
      ),
    );
  }
}