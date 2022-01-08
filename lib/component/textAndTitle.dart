import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'genColor.dart';
import 'genDimen.dart';
import 'genText.dart';

class TextAndTitle extends StatelessWidget {
  final String title;
  final String text;
  final double jarakText;
  final Color colorTitle;
  final Color colorText;
  final bool divider;
  final FontWeight textWeight;

  const TextAndTitle(
      {Key key,
      this.title = "",
      this.text = "",
      this.colorTitle,
      this.colorText,
      this.divider = false,
      this.jarakText = 0,
      this.textWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GenText(
          title,
          style: TextStyle(color: colorTitle ?? Colors.black54),
        ),
        SizedBox(height: jarakText),
        GenText(
          text,
          style: TextStyle(
              fontSize: 30,
              color: colorText ?? Colors.black,
              fontWeight: textWeight ?? FontWeight.normal),
        ),
//        SizedBox(height: 10.h),
        divider ? Divider() : Container()
      ],
    );
  }
}

class TextRowBetween extends StatelessWidget {
  final String leftText;
  final String rightText;
  final Color colorLeftText;
  final Color colorRightText;
  final double sizeRightText;
  final double sizeLeftText;
  final FontWeight rightWeight;
  final FontWeight leftWeight;
  final EdgeInsets paddingRightText;
  final Color bgColorRightText;
  final bool textright;
  final double widthRight;

  const TextRowBetween(
      {Key key,
      this.leftText = "",
      this.rightText = "",
      this.colorLeftText,
      this.colorRightText,
      this.sizeRightText,
      this.sizeLeftText,
      this.rightWeight,
      this.leftWeight,
      this.paddingRightText,
      this.textright = false,
      this.widthRight,
      this.bgColorRightText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GenText(
          leftText,
          style: TextStyle(
              color: colorLeftText ?? Colors.black54,
              fontSize: sizeLeftText ?? 15,
              fontWeight: leftWeight ?? FontWeight.normal),
        ),
        widthRight == double.infinity
            ? Expanded(
                child: Container(
                    width: widthRight ?? 200.w,
                    decoration: BoxDecoration(
                        color: bgColorRightText ?? Colors.transparent,
                        borderRadius: BorderRadius.circular(50)),
                    padding: paddingRightText ?? EdgeInsets.all(0),
                    child: Align(
                      alignment:
                          textright ? Alignment.centerRight : Alignment.center,
                      child: GenText(
                        rightText,
                        style: TextStyle(
                            color: colorRightText ?? Colors.black54,
                            fontSize: sizeRightText ?? 15,
                            fontWeight: rightWeight ?? FontWeight.normal),
                        textAlign: TextAlign.right,
                      ),
                    )),
              )
            : Container(
                width: widthRight ?? 200.w,
                decoration: BoxDecoration(
                    color: bgColorRightText ?? Colors.transparent,
                    borderRadius: BorderRadius.circular(50)),
                padding: paddingRightText ?? EdgeInsets.all(0),
                child: Align(
                  alignment:
                      textright ? Alignment.centerRight : Alignment.center,
                  child: GenText(
                    rightText,
                    style: TextStyle(
                        color: colorRightText ?? Colors.black54,
                        fontSize: sizeRightText ?? 15,
                        fontWeight: rightWeight ?? FontWeight.normal),
                    textAlign: TextAlign.right,
                  ),
                )),
      ],
    );
  }
}

class RowTwoIconsBetween extends StatelessWidget {
  final Widget child;
  final IconData leftIcon;
  final bool hideLeftIcon;
  final bool hideRightIcon;
  final IconData rightIcon;
  final Function ontap;
  final Color colorLeftIcon;
  final Color colorRightIcon;

  const RowTwoIconsBetween(
      {Key key,
      this.leftIcon,
      this.rightIcon,
      @required this.child,
      this.ontap,
      this.colorLeftIcon,
      this.hideLeftIcon = false,
      this.hideRightIcon = false,
      this.colorRightIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: ontap ?? () {},
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                hideLeftIcon
                    ? Container()
                    : Icon(
                        leftIcon ?? Icons.email_outlined,
                        color: colorLeftIcon ?? GenColor.primaryColor,
                        size: 40,
                      ),
                SizedBox(
                  width: GenDimen.sidePadding,
                ),
                Expanded(child: child),
                hideRightIcon
                    ? Container()
                    : Icon(
                        rightIcon ?? Icons.chevron_right,
                        size: 50,
                        color: colorRightIcon ?? Colors.black,
                      )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
