import 'dart:async';

import 'package:driver_taksi/authentication/login_screen.dart';
import 'package:driver_taksi/authentication/signup_screen.dart';
import 'package:driver_taksi/main_screens/main_screen.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

    startTimer(){
      Timer(const Duration(seconds:3),()async{
        Navigator.push(context, MaterialPageRoute(builder:(c)=>   (
          LoginScreen()
        )));
      });
    }
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color:Colors.black,
        child:Center(
          child:Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Image.asset('images/ferofen.png'),
              const SizedBox(height: 10,),
              const Text('Ferofen Taksiye Hoşgeldiniz',
              style:TextStyle(
                color:Colors.white,
                fontSize:20,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
      ),
    );
  }
}