import 'package:app_vestimenta/sectionsPages/addtrajes.dart';
import 'package:app_vestimenta/sectionsPages/listpedidos.dart';
import 'package:app_vestimenta/sectionsPages/perfil.dart';
import 'package:app_vestimenta/sectionsPages/settings.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


import '../sectionsPages/home.dart';
class MainAppBar extends StatefulWidget{
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {

  final items = const <Widget> [
    Icon(Icons.people,),
    Icon(Icons.add_circle_outlined),
    Icon(Icons.home),
    Icon(Icons.list_alt),
    Icon(Icons.settings),

  ];

  /*Widget selectpage ({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget = const Profile();
        break;
      case 1:
        widget = const AddVestments();
        break;
      case 2:
        widget = const Home();
        break;
      case 3:
        widget = const ListOrders();
        break;
      case 4:
        widget = const Settings();
        break;
      default:
        widget = const Home();
        break;

    }
    return widget;
  }*/

  final screens = [
    const Profile(),
    const AddVestments(),
    const Home(),
    const ListOrders(),
    const Settings()

  ];
  int index =2;
  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){},
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {

                    }
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      );*/
    return Scaffold(
      backgroundColor: Colors.transparent,
      /*floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        shape:const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.blue,
        elevation: 10.0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget> [
                  IconButton(
                      onPressed: (){

                      },
                      icon: const Icon(Icons.add),
                      color: Colors.deepPurple,
                      iconSize: 30.0,
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.home),
                    color: Colors.deepPurple,
                  ),
                  IconButton(
                    onPressed: (){},
                    icon:const Icon(Icons.category),
                    color: Colors.deepPurple,
                  ),
                  IconButton(
                    onPressed: (){},
                    icon:const Icon(Icons.people),
                    color: Colors.deepPurple,
                  ),
            ],
          ),
        ),
      ),*/
      body: screens[index],

      bottomNavigationBar:
        Container(
          decoration: const  BoxDecoration(
            gradient: LinearGradient(
              colors:[
                Colors.purpleAccent,Colors.white
              ]
            ),
          ),

          child: CurvedNavigationBar(

              backgroundColor: Colors.transparent,
              height: 60,
              index: index,
              items: items,
              onTap: (int selectIndex){
                setState(() {
                  index = selectIndex;
                });
              },
          ),
        ),
    );
  }
}