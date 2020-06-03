import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'home.dart';
import 'menu.dart';
import 'info.dart';


class View extends StatelessWidget {
  final List<CameraDescription> cameras;
  View(this.cameras);
  @override
  Widget build(BuildContext context) {
    return Material(
          child: Stack(
            children:<Widget> [Scaffold(
          endDrawer: new AppDrawer(),
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(110.0),
              child: new AppBar(
              flexibleSpace: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children : [
                  SizedBox(width:10),
                  Padding(
                    padding: EdgeInsets.only(top:50),
                    child: Image.asset('assets/finalicon.png',fit: BoxFit.contain,height:80)),
                  SizedBox(width:10),
                  Padding(
                    padding: EdgeInsets.only(top:70),
                    child: Text('Health',style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.0,3.0),
                          blurRadius: 3.0,
                          color: Colors.grey[400],
                        )
                      ],
                      color:Colors.teal[900],fontSize:16),)),
                  Padding(
                    padding: EdgeInsets.only(top:70),
                    child: Text('Cam',style: TextStyle(color:Colors.red[900],fontSize:16)))
                ]
              ),
              iconTheme: IconThemeData(color:Colors.red),
              elevation: 0,
              backgroundColor: Colors.white,
              
            ),
          ),
          backgroundColor: Colors.white,
         
          body: Column(
              
                children: <Widget>[
                
                Container(
                color: Colors.green[100],
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.2,
                child:Text("¡Bienvenidos!",style: TextStyle(color:Colors.red[900],fontSize:50.0),)
                ),

                Padding(
                  padding: EdgeInsets.all(15.0),
                              child: Text('Para dar inicio a la detección de productos por favor dirigase al ícono de cámara.',
                  style: TextStyle(color:Colors.red[900],fontSize:20.0),),
                ),
                SizedBox(height: 100.0),
                 IconButton(
                              icon: Icon(Icons.camera_alt),
                              iconSize: 100.0,
                              color: Colors.red[900],
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(cameras)),);
                              },
                            ),
               
              ],
            ),
          
        
        ),
       
       
        ]
      ),
    );
  }
}


class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
    
      child: Container(
              color: Colors.green[100],
              child: new ListView(
              
          children:<Widget>[
            SizedBox(height:20),
            
            GestureDetector(
                child: Container(
                color: Colors.green[300],
              alignment: Alignment.center,
                height: 100,
                
                child: Text('Sobre Nosotros',style: TextStyle(color:Colors.red[900],fontSize:20),)
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MenuDetails('assets/finalicon.png',information[3])));
              },
            ),
            SizedBox(height:20),
            GestureDetector(
                          child: Container(
                color: Colors.green[300],
              alignment: Alignment.center,
                height: 100,
                child: Text('Grasas',style: TextStyle(color:Colors.red[900],fontSize:20),)
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MenuDetails('assets/grasas.png',information[1])));
              },
            ),
            SizedBox(height:20),
            GestureDetector(
                          child: Container(
                color: Colors.green[300],
              alignment: Alignment.center,
                height: 100,
                child: Text('Ázucar',style: TextStyle(color:Colors.red[900],fontSize:20),)
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MenuDetails('assets/azucar.png',information[0])));
              },
            ),
            SizedBox(height:20),
            GestureDetector(
                          child: Container(
                color: Colors.green[300],
              alignment: Alignment.center,
                height: 100,
                child: Text('Sodio',style: TextStyle(color:Colors.red[900],fontSize:20),)
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MenuDetails('assets/sodio.png',information[2])));
              },
            )

            
          ]
        ),
      ),
      
    );
  }
}