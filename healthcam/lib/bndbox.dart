import 'package:flutter/material.dart';
import 'dart:math' as math;

class BndBox extends StatelessWidget {
  final List<dynamic> results;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;
  final String model;

  BndBox(this.results, this.previewH, this.previewW, this.screenH, this.screenW,
      this.model);

  @override
  Widget build(BuildContext context) {

    
    List<Widget> _renderBoxes() {
      return results.map((re) {
        var _x = re["rect"]["x"];
        var _w = re["rect"]["w"];
        var _y = re["rect"]["y"];
        var _h = re["rect"]["h"];
        var scaleW, scaleH, x, y, w, h;

        if (screenH / screenW > previewH / previewW) {
          scaleW = screenH / previewH * previewW;
          scaleH = screenH;
          var difW = (scaleW - screenW) / scaleW;
          x = (_x - difW / 2) * scaleW;
          w = _w * scaleW;
          if (_x < difW / 2) w -= (difW / 2 - _x) * scaleW;
          y = _y * scaleH;
          h = _h * scaleH;
        } else {
          scaleH = screenW / previewW * previewH;
          scaleW = screenW;
          var difH = (scaleH - screenH) / scaleH;
          x = _x * scaleW;
          w = _w * scaleW;
          y = (_y - difH / 2) * scaleH;
          h = _h * scaleH;
          if (_y < difH / 2) h -= (difH / 2 - _y) * scaleH;
        }

        return Stack(
          children: <Widget>[
            Positioned(
              left: math.max(0, x),
              top: math.max(0, y),
              width: w/2,
              height: w/2 + 50,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(
                      color: Colors.yellow[600],
                     shape: BoxShape.circle,
                    ),
                    child: Tag("${re["detectedClass"]}"),
                    
                  ),
                  Container(
                    child: Text("${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
                      style: TextStyle(color: Colors.white,fontSize: 14.0,fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Positioned(
              left: math.max(0, x),
              top: math.max(0, y),
              width: w,
              height: h,
              child: Container(
                padding: EdgeInsets.only(top: 5.0, left: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow[600],
                    width: 3.0,
                  ),
                ),
                
              ),
            )
          ],
        );
      }).toList();
    }

    return Stack(
      children: _renderBoxes(),
    );
  }
}


class Tag extends StatelessWidget {
  final detectedClass;

  Tag(this.detectedClass);

  @override
  Widget build(BuildContext context) {
    List<String> images = ['assets/sodio.png','assets/grasas.png','assets/azucar.png','assets/ok.png'];
    return detectedClass == 'ClubSocial' ? Image.asset(images[0],fit: BoxFit.contain,):
    detectedClass == 'MrBrown' ? Image.asset(images[1],fit: BoxFit.contain,):
    detectedClass == 'Chocoramo' ? Image.asset(images[2],fit: BoxFit.contain,):
    detectedClass == 'Snickers' ? Image.asset(images[2],fit: BoxFit.contain,):
    detectedClass == 'Cocacola' ? Image.asset(images[2],fit: BoxFit.contain,):
    detectedClass == 'Pony' ? Image.asset(images[2],fit: BoxFit.contain,):
    Image.asset(images[3],fit: BoxFit.contain,);
  }
}
