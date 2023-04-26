import 'package:driver_taksi/authentication/signup_screen.dart';
import 'package:driver_taksi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
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
                child: Image.asset('images/ferofen.png'),
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
                 // Navigator.push(context, MaterialPageRoute(builder:(c)=>CarInfoScreen()));
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
