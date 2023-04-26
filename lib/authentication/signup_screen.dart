import 'package:driver_taksi/authentication/car_info_screen.dart';
import 'package:driver_taksi/authentication/login_screen.dart';
import 'package:driver_taksi/utils/constants.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextEditingController=TextEditingController();
  TextEditingController emailTextEditingController=TextEditingController();
  TextEditingController phoneTextEditingController=TextEditingController();
  TextEditingController passwordTextEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
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
                  'Üye Ol',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  style:TextStyle(color:Colors.grey),
                  controller:nameTextEditingController,
                  decoration:const InputDecoration(
                    labelText:'Ad',
                    hintText:'Ad',
                    enabledBorder:UnderlineInputBorder(
                      borderSide:BorderSide(color:Colors.grey)
                    ),
                    focusedBorder:UnderlineInputBorder(
                      borderSide:BorderSide(color:Colors.grey)
                    ),
                    hintStyle:TextStyle(color: Colors.grey,fontSize:10),
                    labelStyle:TextStyle(color: Colors.grey,fontSize:14)
          
                  ),
                ),
                TextField(
                  keyboardType:TextInputType.emailAddress,
                  style:TextStyle(color:Colors.grey),
                  controller:emailTextEditingController,
                  decoration:const InputDecoration(
                    labelText:'Email',
                    hintText:'Email',
                    enabledBorder:UnderlineInputBorder(
                      borderSide:BorderSide(color:Colors.grey)
                    ),
                    focusedBorder:UnderlineInputBorder(
                      borderSide:BorderSide(color:Colors.grey)
                    ),
                    hintStyle:TextStyle(color: Colors.grey,fontSize:10),
                    labelStyle:TextStyle(color: Colors.grey,fontSize:14)
          
                  ),
                ),
                TextField(
                  keyboardType:TextInputType.phone,
                  style:TextStyle(color:Colors.grey),
                  controller:phoneTextEditingController,
                  decoration:const InputDecoration(
                    labelText:'Telefon',
                    hintText:'Telefon',
                    enabledBorder:UnderlineInputBorder(
                      borderSide:BorderSide(color:Colors.grey)
                    ),
                    focusedBorder:UnderlineInputBorder(
                      borderSide:BorderSide(color:Colors.grey)
                    ),
                    hintStyle:TextStyle(color: Colors.grey,fontSize:10),
                    labelStyle:TextStyle(color: Colors.grey,fontSize:14)
          
                  ),
                ),
                TextField(
                  obscureText:true,
                  style:TextStyle(color:Colors.grey),
                  controller:passwordTextEditingController,
                  decoration:const InputDecoration(
                    labelText:'Parola',
                    hintText:'Parola',
                    enabledBorder:UnderlineInputBorder(
                      borderSide:BorderSide(color:Colors.grey)
                    ),
                    focusedBorder:UnderlineInputBorder(
                      borderSide:BorderSide(color:Colors.grey)
                    ),
                    hintStyle:TextStyle(color: Colors.grey,fontSize:10),
                    labelStyle:TextStyle(color: Colors.grey,fontSize:14)
          
                  ),
                ),
              const SizedBox(height: 20,),
                ElevatedButton(onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder:(c)=>CarInfoScreen()));
                }, 
                style:ElevatedButton.styleFrom(
                  primary:mycolor 
                ),
                child:Text(
                    'Hesap Oluştur',style:TextStyle(
                      color:mainColor,
                      fontSize:18
                    ),
                )),
                TextButton(onPressed: (){ 
                  Navigator.push(context, MaterialPageRoute(builder:(c)=>LoginScreen()));
                }, child: Text('Hesabın zaten var mı?',style:TextStyle(color:Colors.grey),))
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
