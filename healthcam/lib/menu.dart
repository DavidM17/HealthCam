import 'package:flutter/material.dart';


class MenuDetails extends StatelessWidget {
  final String icon;
  final String information;
  MenuDetails(this.icon,this.information);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[100]
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:20),
            Image.asset(icon,height: 200.0,width: 200.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(information,style:TextStyle(fontSize:14.0),textAlign: TextAlign.justify,),
            ),
          ]
        ),
      ),
      
    );
  }
}