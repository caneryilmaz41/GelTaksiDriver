import 'package:driver_taksi/tab_pages/earning_tab.dart';
import 'package:driver_taksi/tab_pages/home_tab.dart';
import 'package:driver_taksi/tab_pages/profile_tab.dart';
import 'package:driver_taksi/tab_pages/ratings_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainScreen extends StatefulWidget {
  
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex=0;
  onItemClicked(int index){
    setState(() {
      selectedIndex=index;
      tabController!.index=selectedIndex;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length:4,vsync:this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:TabBarView(
        physics:const NeverScrollableScrollPhysics(),
        controller:tabController,
        children:const  [
          HomeTabPage(),
          EaringTabPage(),
          RatingsTabPage(),
          ProfileTabPage()

        ],

      ),
      bottomNavigationBar:BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon:Icon(Icons.home,),
        label:'Anasayfa'),
        BottomNavigationBarItem(icon:Icon(Icons.credit_card,),
        label:'Ücret'),
        BottomNavigationBarItem(icon:Icon(Icons.star,),
        label:'Puanla'),
        BottomNavigationBarItem(icon:Icon(Icons.person,),
        label:'Hesabım ')
      ],
      unselectedItemColor:Colors.amber,
      selectedItemColor:Colors.white,
      backgroundColor:Colors.black,
      type:BottomNavigationBarType.fixed,
      selectedLabelStyle:const TextStyle(fontSize: 14),
      showUnselectedLabels:true,
      currentIndex:selectedIndex,
      onTap:onItemClicked,
      ),
    );
  }
}