import 'package:flutter/material.dart';

UnderlineInputBorder focusedBorder = UnderlineInputBorder(
  // borderRadius: BorderRadius.all(Radius.circular(0)),
  borderRadius: BorderRadius.all(Radius.zero),
  borderSide: BorderSide(width: 0.7, color: Color(0xff703BB1)),
);

///  disable border
UnderlineInputBorder disableBorder = UnderlineInputBorder(
  borderRadius: BorderRadius.all(Radius.zero),
  borderSide: BorderSide(width: 0.7, color: Colors.grey[700]),
);

/// enable border
UnderlineInputBorder enableBorder = UnderlineInputBorder(
  borderRadius: BorderRadius.all(Radius.zero),
  // borderRadius: BorderRadius.all(Radius.circular(0)),
  borderSide: BorderSide(width: 0.7, color: Color(0xff703BB1)),
);

/// border
UnderlineInputBorder border = UnderlineInputBorder(
  // borderRadius: BorderRadius.all(Radius.circular(0)),
    borderRadius: BorderRadius.all(Radius.zero),
    borderSide: BorderSide(
      width: 4,
    ));

/// error border
UnderlineInputBorder errorBorder = UnderlineInputBorder(
  // borderRadius: BorderRadius.all(Radius.circular(0)),
    borderRadius: BorderRadius.all(Radius.zero),
    borderSide: BorderSide(width: 1, color: Colors.red[400]));

    
class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 8.0),
      decoration: BoxDecoration(
          color: Color(0xff492BC4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              // offset: Offset(0.0, 1.5),
              // blurRadius: 1.5,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}