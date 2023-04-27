import 'package:driver_taksi/authentication/signup_screen.dart';
import 'package:driver_taksi/splash_Screen/splash_screen.dart';
import 'package:driver_taksi/utils/constants.dart';
import 'package:driver_taksi/widgets/progress_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global/global.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  validateForm(){

     if(!emailTextEditingController.text.contains('@')){
      Fluttertoast.showToast(msg: 'Geçersiz email adresi');
    }
    else if(passwordTextEditingController.text.isEmpty){
      Fluttertoast.showToast(msg: 'Parola boş bırakılamaz.');
    }
    else{
      LoginDriverNow();
    }
  }
  LoginDriverNow()async{
    showDialog(
        context:context,
        barrierDismissible:false,
        builder:(BuildContext c){
          return ProgressDialog(message:'Giriş yapılıyor,Lütfen bekleyin',);
        }
      );
      final User? firebaseUser=(
        await fAuth.signInWithEmailAndPassword(
          email:emailTextEditingController.text.trim(),
          password:passwordTextEditingController.text.trim()

        ).catchError((msg){
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Hata: '+msg.toString());
        })
      ).user;
      if(firebaseUser!=null){
      DatabaseReference driversRef= FirebaseDatabase.instance.ref().child("drivers");
      driversRef.child(firebaseUser.uid).once().then((driverKey) {
        final snap=driverKey.snapshot;
        if(snap.value!=null){
          currenFirebaseUser=firebaseUser;
      Fluttertoast.showToast(msg: 'Giriş Başarılı');
      Navigator.push(context, MaterialPageRoute(builder:(c)=>MySplashScreen()));
        }else{
          Fluttertoast.showToast(msg: 'Sürücü bulunamadı');
          fAuth.signOut();
          Navigator.push(context, MaterialPageRoute(builder:(c)=>MySplashScreen()));
        }

      });
      
      
      }else{
        Navigator.pop(context);
        Fluttertoast.showToast(msg: 'Giriş Yapılamadı.');
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset('images/taxi-driver.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                textAlign: TextAlign.center,
                'Sürücü Girişi',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.grey),
                controller: emailTextEditingController,
                decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 14)),
              ),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.grey),
                controller: passwordTextEditingController,
                decoration: const InputDecoration(
                    labelText: 'Parola',
                    hintText: 'Parola',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 14)),
              ),
              const SizedBox(height: 20,),
                ElevatedButton(onPressed:(){
                  validateForm();
                }, 
                style:ElevatedButton.styleFrom(
                  primary:mycolor 
                ),
                child:Text(
                    'Giriş Yap',style:TextStyle(
                      color:mainColor,
                      fontSize:18
                    ),
                )),
                TextButton(onPressed: (){ 
                  Navigator.push(context, MaterialPageRoute(builder:(c)=>SignUpScreen()));
                }, child: Text('Hesabım yok,Kayıt ol',style:TextStyle(color:Colors.grey),))
            ],
          ),
        ),
      )),
    );
  }
}
