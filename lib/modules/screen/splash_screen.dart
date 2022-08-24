import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Timer(
      Duration(seconds: 4),()=> Navigator.pushReplacement(
        context,MaterialPageRoute(builder:(context)=>LoginScreen())
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Image.asset('assets/images/splash.jpeg',
           // opacity: ,
            height:double.infinity ,
           fit: BoxFit.fill,
           // width:250 ,
          ),
          Positioned(
            top: 350,
            left: 10,
            child: Text(
              'Welcome',
              style:TextStyle(
                fontSize: 45,
                fontWeight:FontWeight.bold ,
                color: Colors.orange,
              ),
            ),
          ),
          Positioned(
            top: 400,
            left: 10,
            child: Text(
              'in your E-book',
              style:TextStyle(
                fontSize: 25,
                fontWeight:FontWeight.bold ,
                color: Colors.orangeAccent,
              ),
            ),
          ),
        ],
      ) ,
    );
  }
}
