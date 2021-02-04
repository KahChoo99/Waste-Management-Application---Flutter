import 'package:flutter/cupertino.dart';
import 'package:waste_management/constants/themes.dart';

class BackgroundPainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: CustomPaint(
        painter: CurvePainter(),
      )
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.shader = LinearGradient(
            begin: Alignment.centerLeft,
            colors: curvePainterGradient)
        .createShader(
            Rect.fromLTRB(0, size.height * 0.6, size.height * 0.6, size.width));
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.6);
    path.quadraticBezierTo(size.width / 4, size.height * 0.4,
        size.width / 4 * 2, size.height * 0.45);
    path.quadraticBezierTo(
        size.width / 4 * 3, size.height * 0.5, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
