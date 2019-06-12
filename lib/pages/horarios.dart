import 'package:flutter/material.dart';
import 'package:gymtastic/pages/Horarios/jueves.dart';
import 'package:gymtastic/pages/Horarios/lunes.dart';
import 'package:gymtastic/pages/Horarios/martes.dart';
import 'package:gymtastic/pages/Horarios/miercoles.dart';
import 'package:gymtastic/pages/Horarios/viernes.dart';
import 'package:intl/intl.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat('EEE d MMM').format(now);
String todaydate = DateFormat('EEE').format(now);


class HorariosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage> {
  @override
  
  Widget build(BuildContext context) {
    
    String monday = 'Mon';
    String tuesday = 'Tue';
    String wednesday = 'Wed';
    String thursday = 'Thu';
    String friday = 'Fri';
    

    /*
  _    _   _ _   _ _____ ____  
 | |  | | | | \ | | ____/ ___| 
 | |  | | | |  \| |  _| \___ \ 
 | |__| |_| | |\  | |___ ___) |
 |_____\___/|_| \_|_____|____/ 
                                 
  */

    if (todaydate == monday) {
    return ListView(
      children: <Widget>[
        Container(
           padding: EdgeInsets.only(top: 10.0),
          child: Text('$formattedDate',
          
          textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0b3d91),
                  )),
        ),
      
        Container(
          child: HorarioLunes(),
        ),
        Container(
          child: HorarioMartes(),
        ),
        Container(
          child: HorarioMiercoles(),
        ),
        Container(
          child: HorarioJueves(),
        ),
        Container(
          child: HorarioViernes(),
        )
      ],
    );
    }


/*
  __  __    _    ____ _____ _____ ____  
 |  \/  |  / \  |  _ \_   _| ____/ ___| 
 | |\/| | / _ \ | |_) || | |  _| \___ \ 
 | |  | |/ ___ \|  _ < | | | |___ ___) |
 |_|  |_/_/   \_\_| \_\|_| |_____|____/ 
                                        
*/
    if (todaydate == tuesday) {
    return ListView(
      children: <Widget>[
        Container(
           padding: EdgeInsets.only(top: 10.0),
          child: Text('$formattedDate',
          
          textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0b3d91),
                  )),
        ),
      
       
        Container(
          child: HorarioMartes(),
        ),
        Container(
          child: HorarioMiercoles(),
        ),
        Container(
          child: HorarioJueves(),
        ),
        Container(
          child: HorarioViernes(),
        ),
         Container(
          child: HorarioLunes(),
        ),
      ],
    );
    }

/* 
  __  __ ___ _____ ____   ____ ___  _     _____ ____  
 |  \/  |_ _| ____|  _ \ / ___/ _ \| |   | ____/ ___| 
 | |\/| || ||  _| | |_) | |  | | | | |   |  _| \___ \ 
 | |  | || || |___|  _ <| |__| |_| | |___| |___ ___) |
 |_|  |_|___|_____|_| \_\\____\___/|_____|_____|____/ 
                                                      
*/

if (todaydate == wednesday) {
    return ListView(
      children: <Widget>[
        Container(
           padding: EdgeInsets.only(top: 10.0),
          child: Text('$formattedDate',
          
          textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0b3d91),
                  )),
        ),
      
        
        Container(
          child: HorarioMiercoles(),
        ),
        Container(
          child: HorarioJueves(),
        ),
        Container(
          child: HorarioViernes(),
        ),
        Container(
          child: HorarioLunes(),
        ),
        Container(
          child: HorarioMartes(),
        ),
      ],
    );
    }


/* 
      _ _   _ _______     _______ ____  
     | | | | | ____\ \   / / ____/ ___| 
  _  | | | | |  _|  \ \ / /|  _| \___ \ 
 | |_| | |_| | |___  \ V / | |___ ___) |
  \___/ \___/|_____|  \_/  |_____|____/ 
                                        
*/

if (todaydate == thursday) {
    return ListView(
      children: <Widget>[
        Container(
           padding: EdgeInsets.only(top: 10.0),
          child: Text('$formattedDate',
          
          textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0b3d91),
                  )),
        ),
      
        
        Container(
          child: HorarioJueves(),
        ),
        Container(
          child: HorarioViernes(),
        ),
        Container(
          child: HorarioLunes(),
        ),
        Container(
          child: HorarioMartes(),
        ),
        Container(
          child: HorarioMiercoles(),
        ),
      ],
    );
    }

/* 
 __     _____ _____ ____  _   _ _____ ____  
 \ \   / /_ _| ____|  _ \| \ | | ____/ ___| 
  \ \ / / | ||  _| | |_) |  \| |  _| \___ \ 
   \ V /  | || |___|  _ <| |\  | |___ ___) |
    \_/  |___|_____|_| \_\_| \_|_____|____/ 
                                            
*/


if (todaydate == friday) {
    return ListView(
      children: <Widget>[
        Container(
           padding: EdgeInsets.only(top: 10.0),
          child: Text('$formattedDate',
          
          textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0b3d91),
                  )),
        ),
      
       
        Container(
          child: HorarioViernes(),
        ),
         Container(
          child: HorarioLunes(),
        ),
        Container(
          child: HorarioMartes(),
        ),
        Container(
          child: HorarioMiercoles(),
        ),
        Container(
          child: HorarioJueves(),
        ),
      ],
    );
    }

/*
  _____ ___ _   _ ____  _____ 
 |  ___|_ _| \ | |  _ \| ____|
 | |_   | ||  \| | | | |  _|  
 |  _|  | || |\  | |_| | |___ 
 |_|   |___|_| \_|____/|_____|
                              
*/

    else{
    return ListView(
      children: <Widget>[
        Container(
           padding: EdgeInsets.only(top: 10.0),
          child: Text('$formattedDate',
          
          textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0b3d91),
                  )),
        ),
      
        Container(
          child: HorarioLunes(),
        ),
        Container(
          child: HorarioMartes(),
        ),
        Container(
          child: HorarioMiercoles(),
        ),
        Container(
          child: HorarioJueves(),
        ),
        Container(
          child: HorarioViernes(),
        )
      ],
    );
    }




  }
}
