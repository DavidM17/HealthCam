import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'welcome.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
     
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Stack(
        children: <Widget>[
          
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(75.0)),
            ), 
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/finalicon.png',fit:BoxFit.contain,height:200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Health',style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.0,3.0),
                          blurRadius: 3.0,
                          color: Colors.grey[400],
                        )
                      ],
                      color:Colors.teal[800],fontSize: 20),),
                    Text('Cam',style: TextStyle(color:Colors.red[900],fontSize: 20),),
                  ],
                ),
                SizedBox(height:20),
                IconButton(
                              icon: Icon(Icons.play_circle_filled),
                              iconSize: 80.0,
                              color: Colors.red[900],
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => View(cameras)),);
                              },
                            ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
