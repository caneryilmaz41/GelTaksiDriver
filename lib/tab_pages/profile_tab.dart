import 'package:driver_taksi/global/global.dart';
import 'package:driver_taksi/splash_Screen/splash_screen.dart';
import 'package:flutter/material.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({super.key});

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:ElevatedButton(
        onPressed: () {
          fAuth.signOut();
           Navigator.push(context, MaterialPageRoute(builder:(c)=>   (
          MySplashScreen()
        )));
        },
        child:Text('Çıkış Yap')),
    );
  }
}