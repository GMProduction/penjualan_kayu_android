import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import 'genColor.dart';
import 'genText.dart';

class GenButton extends StatelessWidget {
  final double radius;
  final String text;
  final IconData iconLeft;
  final IconData iconRight;
  final Color color;
  final Color textColor;
  final double textSize;
  final EdgeInsets padding;
  final Function ontap;
  final bool readyToHit;

  const GenButton(
      {Key key,
      this.radius = 50,
      this.text = "",
      this.iconLeft,
      this.iconRight,
      this.color = GenColor.primaryColor,
      this.textColor = Colors.white,
      this.textSize,
      this.padding,
      this.readyToHit = true,
      this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !readyToHit ? Center(child: Container(decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(radius)),padding: padding ??
        EdgeInsets.symmetric(vertical: 20, horizontal: 20) , child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation(Colors.white),),)) : Material(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: ontap ?? () {},
        child:  Container(
            width: double.infinity,
            padding: padding ??
                EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              iconLeft == null
                  ? Container()
                  : Icon(
                      iconLeft,
                      color: textColor,
                    ),
              Expanded(
                child: Center(
                  child: GenText(
                    text,
                    style: TextStyle(
                        color: textColor, fontSize: textSize ?? 20),
                  ),
                ),
              ),
              iconRight == null
                  ? Container()
                  : Icon(
                      iconRight,
                      color: textColor,
                    ),
            ])),
      ),
    );
  }
}

class GenButtonOutline extends StatelessWidget {
  final double radius;
  final String text;
  final IconData iconLeft;
  final IconData iconRight;
  final Color color;
  final Color textColor;
  final double textSize;
  final Function ontap;
  final double width;

  const GenButtonOutline(
      {Key key,
      this.radius = 50,
      this.text = "",
      this.iconLeft,
      this.iconRight,
      this.color = GenColor.primaryColor,
      this.textColor = GenColor.primaryColor,
      this.textSize,
      this.ontap,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(radius)),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: ontap ?? () {},
          child: Container(
              width: width ?? double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                iconLeft == null
                    ? Container()
                    : Icon(
                        iconLeft,
                        color: textColor,
                  size: textSize + 5 ?? 30,
                      ),
                Expanded(
                  child: Center(
                    child: GenText(
                      text,
                      style: TextStyle(
                          color: textColor, fontSize: textSize ?? 40),
                    ),
                  ),
                ),
                iconRight == null
                    ? Container()
                    : Icon(
                        iconRight,
                        color: textColor,
                      ),
              ])),
        ),
      ),
    );
  }
}
