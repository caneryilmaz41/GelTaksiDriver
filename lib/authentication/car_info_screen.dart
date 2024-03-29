import 'package:driver_taksi/global/global.dart';
import 'package:driver_taksi/splash_Screen/splash_screen.dart';
import 'package:driver_taksi/utils/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CarInfoScreen extends StatefulWidget {
  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController carModelController = TextEditingController();
  TextEditingController carNumberController = TextEditingController();
  TextEditingController carColorController = TextEditingController();
  List<String> carTypeList = ['Dacia', 'Megane', 'Honda'];
  String? selectedCarType;
  saveCarInfo(){
    Map driverCarInfoMap={
          "car_color":carColorController.text.trim(),
          "car_number":carNumberController.text.trim(),
          "car_model":carModelController.text.trim(),
          "type":selectedCarType
        };
         DatabaseReference driversRef= FirebaseDatabase.instance.ref().child("drivers");
      driversRef.child(currenFirebaseUser!.uid).child("car_details").set(driverCarInfoMap);
      Fluttertoast.showToast(msg: 'Araç bilgileri kaydedildi.');
      Navigator.push(context, MaterialPageRoute(builder:(c)=>const MySplashScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0), 
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
                  'Araç Özellikleri',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(color: Colors.grey),
                  controller: carModelController,
                  decoration: const InputDecoration(
                      labelText: 'Araç Modeli',
                      hintText: 'Araç Modeli',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                ),
                TextField(
                  style: TextStyle(color: Colors.grey),
                  controller: carNumberController,
                  decoration: const InputDecoration(
                      labelText: 'Araç Numarası ',
                      hintText: 'Araç Numarası',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                ),
                TextField(
                  style: TextStyle(color: Colors.grey),
                  controller: carColorController,
                  decoration: const InputDecoration(
                      labelText: 'Araç Rengi',
                      hintText: 'Araç Rengi',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                ),
                DropdownButton(
                  iconSize:25,
                  dropdownColor:mainColor,
                  value: selectedCarType,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCarType = newValue;
                    });
                  },
                  hint:const Text(
                    'Aracınızı Seçiniz',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  items: carTypeList.map((car) {
                    return DropdownMenuItem(
                      child: Text(
                        car,
                        style: TextStyle(color: Colors.grey),
                      ),
                      value: car,
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed:(){
                 if(carColorController.text.isNotEmpty
                 &&carNumberController.text.isNotEmpty
                 &&carModelController.text.isNotEmpty
                 &&selectedCarType!=null){
                  saveCarInfo();
                 }
                }, 
                style:ElevatedButton.styleFrom(
                  primary:mycolor 
                ),
                child:Text(
                    'Kaydet',style:TextStyle(
                      color:mainColor,
                      fontSize:18
                    ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
