import 'package:flutter/material.dart';
import 'package:gymtastic/pages/horarios.dart';
import 'package:gymtastic/pages/paravos.dart';
//import 'package:gymtastic/pages/settings.dart';
import 'package:gymtastic/pages/plan.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class MainTabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: DefaultTabController(
        length: 3,
          child: new Scaffold(
            body: TabBarView(
                children: <Widget>[
                  PlanPage(),
                  ParaVosPage(),
                  HorariosPage()
                ]
            ),

            bottomNavigationBar: PreferredSize(
                preferredSize: Size(60.0, 60.0),
            child: Container(
              height: 60.0,

              child: TabBar(
                labelColor: Theme.of(context).toggleableActiveColor,
                labelStyle: TextStyle(fontSize: 10.0),
                tabs: <Widget>[
                  Tab(

                      text: 'PARA VOS',),
                  Tab(

                    text: 'PLAN',),
                  Tab(

                    text: 'HORARIOS',)
                ],
              ),
            ),),
          ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),



    );




  }



}