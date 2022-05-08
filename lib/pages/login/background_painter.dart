import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:housing/constants_tools/constants.dart';
import 'package:housing/pages/login/point_to_path.dart';
import 'package:flutter/animation.dart';

class BackgroundPainter extends CustomPainter {

  BackgroundPainter(
    {
    required Animation<double> animation,
  })  : bluepaint = Paint()
          ..color = cPrimaryColor
          ..style = PaintingStyle.fill,
        babybluepaint = Paint()
          ..color = cBabybluePalette
          ..style = PaintingStyle.fill,
        movingAnim = CurvedAnimation(
            parent: animation,
            curve: Curves.elasticOut,
            reverseCurve: Curves.easeInBack),
        blueAnim = CurvedAnimation(
          parent: animation,
          curve: const Interval(0, 0.7,
              curve: Interval(0, 0.8, curve: SpringCurve())),
          //const SpringCurve(),
          reverseCurve: Curves.easeInCirc,
        ),
        babyblueAnim = CurvedAnimation(
          parent: animation,
          curve: const SpringCurve(),
          // move animation from start to end (0 to 1)
          reverseCurve: Curves.easeInCirc,
        ),
        // reverse from (1 to 0),

        super(
            repaint:
                animation); // repaint it is for Liste change and chick Function void paint(Canvas canvas, Size size) every time

  final Animation<double> movingAnim;
  final Animation<double> blueAnim;
  final Animation<double> babyblueAnim;

  final Paint bluepaint;
  final Paint babybluepaint;


  @override
  void paint(Canvas canvas, Size size) {
    //print("painting");
    //canvas.drawPaint(Paint()..color = cBabybluePalette);
    paintBabyBlue(canvas, size);
    paintBlue(canvas, size);
    // TODO: implement paint
  }

  void paintBabyBlue(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width,0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
        lerpDouble(0, size.height*0.98, movingAnim.value)!,//=== ( تعديل) babyblueAnim.value
    );


    /*path.lineTo(
      0,
      //lerpDouble(0, size.height/9, blueAnim.value)!,
      lerpDouble(0 , size.height , blueAnim.value)!,
    );
    //path.close();
    *//*path.quadraticBezierTo(
        size.width / 2, size.width * 10, size.width, size.height / 2);*//*
        */
    _addPointsToPath(path, [
      Point(
        lerpDouble(0, size.width / 3, babyblueAnim.value)!,
        lerpDouble(0, size.height, babyblueAnim.value)!,
      ),
      Point(
        lerpDouble(size.width / 2, size.width/4*3, movingAnim.value)!,
        lerpDouble(size.height/2, size.height/4*3, movingAnim.value)!,
      ),
      Point(
        size.width,
        lerpDouble(size.height/2, size.height*3/4, movingAnim.value)!,
      ),

    ]);

    //canvas.drawPath(path, bluepaint);
    canvas.drawPath(path, babybluepaint);
  }

  void paintBlue(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width,0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(0, size.height*0.97, babyblueAnim.value)!,
    );


    /*path.lineTo(
      0,
      //lerpDouble(0, size.height/9, blueAnim.value)!,
      lerpDouble(0 , size.height , blueAnim.value)!,
    );
    //path.close();
    *//*path.quadraticBezierTo(
        size.width / 2, size.width * 10, size.width, size.height / 2);*//*
        */
    _addPointsToPath(path, [
      Point(
        lerpDouble(0, size.width / 4.5, babyblueAnim.value)!,
        lerpDouble(0, size.height, babyblueAnim.value)!,
      ),
      Point(
        lerpDouble(size.width / 2, size.width/4*2.9, movingAnim.value)!,
        lerpDouble(size.height/2, size.height/4*2.8, movingAnim.value)!,
      ),
      Point(
        size.width,
        lerpDouble(size.height/2, size.height*0.72, movingAnim.value)!,
      ),

    ]);

    canvas.drawPath(path, bluepaint);
  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _addPointsToPath(Path path, List<Point> points) {
    if (points.length < 2) {
      throw UnsupportedError("Need three or more points to create a path.");
    }

    for (var i = 0; i < points.length - 2; i++) {
      final xc = (points[i].x + points[i + 1].x) / 2;
      final yc = (points[i].y + points[i + 1].y) / 2;
      path.quadraticBezierTo(points[i].x, points[i].y, xc, yc);
    }

    // connect the last two points
    path.quadraticBezierTo(
        points[points.length - 2].x,
        points[points.length - 2].y,
        points[points.length - 1].x,
        points[points.length - 1].y);
  }
}

class SpringCurve extends Curve {
  const SpringCurve({
    this.a = 0.15,
    this.w = 19.4,
  });

  final double a;
  final double w;

  @override
  double transformInternal(double t) {
    // TODO: implement transformInternal
    return (-(pow(e, -t / a) * cos(t * w)) + 1).toDouble();
  }
}


/*final path = Path();
path.moveTo(0, size.height / 2);
path.lineTo(0,0);
path.lineTo(size.width, 0);
path.lineTo(size.width, size.height / 2);*/


/*

Point(
        lerpDouble(0, 0, blueAnim.value)!,//size.width,
        size.height,
      ),
      Point(
        0,//size.width,
        lerpDouble(size.height, size.width/2, blueAnim.value)!,
      ),

      Point(
        lerpDouble(0, 0, movingAnim.value)!,
        lerpDouble(size.height*2, size.height*2, movingAnim.value)!,

      ),

      Point(
        0,//size.width,
        lerpDouble(size.height, size.height/4*3, blueAnim.value)!,
      ),

    ]);
*/
