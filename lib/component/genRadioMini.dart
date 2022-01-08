// ignore_for_file: file_names

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'JustHelper.dart';
import 'genColor.dart';
import 'genDimen.dart';
import 'genShadow.dart';
import 'genText.dart';
import 'genToast.dart';

class GenRadioGroupMini extends StatefulWidget {
  final List listData;
  final int initValue;
  final Function ontap;
  final String id, title, jumlah;
  final bool fitContent;
  final bool lineStyle;
  final double initPadding;
  final double radius;
  final EdgeInsets padding;

  GenRadioGroupMini(
      {@required this.listData,
      this.initValue = 0,
      @required this.ontap,
      this.title,
      @required this.id,
      this.fitContent = false,
      this.lineStyle = false,
      this.initPadding = 0,
      this.padding,
      this.radius = 50,
      this.jumlah});

  set value(value) {
    ontap(value);
  }

  @override
  _GenRadioGroupMiniState createState() => _GenRadioGroupMiniState();
}

class _GenRadioGroupMiniState extends State<GenRadioGroupMini> {
  var initValue = 0;

  @override
  void initState() {
    // TODO: implement initState

    initValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !widget.fitContent
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: widget.initPadding,
                  ),
                  Row(
                    children: widget.listData.map<Widget>((e) {
                      int index = e[widget.id];

                      return initValue == index
                          ? Container(
                              padding:
                                  widget.padding ?? EdgeInsets.all(0.03.sw),
                              margin: EdgeInsets.only(
                                  right: 0.02.sw, bottom: 0.02.sw, top: 5.h),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(widget.radius),
                                  color: GenColor.primaryColor,
                                  boxShadow: GenShadow().genShadow(
                                      radius: 3.w, offset: Offset(0, 2.w))),
                              child: Center(
                                child: GenText(
                                  e[widget.title],
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  initValue = e[widget.id];
                                  widget.value = {
                                    "id": e[widget.id],
                                    "jumlah": e[widget.jumlah] ?? e[widget.id],
                                  };
                                });
                              },
                              child: Container(
                                padding:
                                    widget.padding ?? EdgeInsets.all(0.03.sw),
                                margin: EdgeInsets.only(
                                    right: 0.02.sw, bottom: 0.02.sw, top: 5.h),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(widget.radius),
                                    boxShadow: GenShadow().genShadow(),
                                    color: Colors.white),
                                child: Center(
                                    child: GenText(
                                  e[widget.title],
                                  style: TextStyle(color: Colors.black54),
                                  textAlign: TextAlign.center,
                                )),
                              ));
                    }).toList(),
                  ),
                ],
              ),
            )
          : Container(
              width: double.infinity,
              child: Row(
                children: widget.listData.map<Widget>((e) {
                  int index = e[widget.id];

                  return widget.lineStyle
                      ? initValue == index
                          ? Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                margin: EdgeInsets.only(
                                    right: 0.02.sw, bottom: 0.02.sw, top: 5.h),
                                height: 80.h,
                                decoration: BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                      color: GenColor.primaryColor, width: 2),
                                )),
                                child: Center(
                                  child: GenText(
                                    e[widget.title],
                                    style:
                                        TextStyle(color: GenColor.primaryColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      initValue = e[widget.id];
                                      widget.value = {
                                        "id": e[widget.id],
                                        "jumlah":
                                            e[widget.jumlah] ?? e[widget.id],
                                      };
                                    });
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(10.w),
                                      margin: EdgeInsets.only(
                                          right: 0.02.sw,
                                          bottom: 0.02.sw,
                                          top: 5.h),
                                      height: 80.h,
                                      decoration: BoxDecoration(),
                                      child: Center(
                                        child: GenText(
                                          e[widget.title],
                                          style:
                                              TextStyle(color: Colors.black54),
                                          textAlign: TextAlign.center,
                                        ),
                                      ))),
                            )
                      : initValue == index
                          ? Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10.w),
                                margin: EdgeInsets.only(
                                    right: 0.02.sw, bottom: 0.02.sw, top: 5.h),
                                height: 80.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: GenColor.primaryColor,
                                    boxShadow: GenShadow().genShadow(
                                        color: GenColor.shadowMed,
                                        radius: 3.w,
                                        offset: Offset(0, 2.w))),
                                child: Center(
                                  child: GenText(
                                    e[widget.title],
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      initValue = e[widget.id];
                                      widget.value = {
                                        "id": e[widget.id],
                                        "jumlah":
                                            e[widget.jumlah] ?? e[widget.id],
                                      };
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.w),
                                    margin: EdgeInsets.only(
                                        right: 0.02.sw,
                                        bottom: 0.02.sw,
                                        top: 5.h),
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: GenShadow().genShadow(
                                            color: GenColor.shadowLigth,
                                            radius: 3.w,
                                            offset: Offset(0, 2.w)),
                                        color: Colors.white),
                                    child: Center(
                                        child: GenText(
                                      e[widget.title],
                                      style: TextStyle(color: Colors.black54),
                                      textAlign: TextAlign.center,
                                    )),
                                  )),
                            );
                }).toList(),
              ),
            ),
    );
  }
}

class GenRadioGroupMiniInString extends StatefulWidget {
  final List listData;
  final String initValue;
  final Function ontap;
  final String id, title;
  final bool fitContent;
  final bool lineStyle;
  final double initPadding;
  final EdgeInsets padding;

  GenRadioGroupMiniInString(
      {@required this.listData,
      this.initValue,
      @required this.ontap,
      this.title,
      @required this.id,
      this.fitContent = false,
      this.lineStyle = false,
      this.initPadding = 0,
      this.padding});

  set value(value) {
    ontap(value);
  }

  @override
  _GenRadioGroupMiniInStringState createState() =>
      _GenRadioGroupMiniInStringState();
}

class _GenRadioGroupMiniInStringState extends State<GenRadioGroupMiniInString> {
  String initValue;

  @override
  void initState() {
    // TODO: implement initState

    initValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !widget.fitContent
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: widget.initPadding,
                  ),
                  Row(
                    children: widget.listData.map<Widget>((e) {
                      String index = e[widget.id];

                      return initValue == index
                          ? Container(
                              padding:
                                  widget.padding ?? EdgeInsets.all(0.03.sw),
                              margin: EdgeInsets.only(
                                  right: 0.02.sw, bottom: 0.02.sw, top: 5.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: GenColor.primaryColor,
                                  boxShadow: GenShadow().genShadow(
                                      color: GenColor.shadowMed,
                                      radius: 3.w,
                                      offset: Offset(0, 2.w))),
                              child: Center(
                                child: GenText(
                                  e[widget.title],
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  initValue = e[widget.id];
                                  widget.value = {
                                    "id": e[widget.id],
                                    "name": e[widget.title]
                                  };
                                });
                              },
                              child: Container(
                                padding:
                                    widget.padding ?? EdgeInsets.all(0.03.sw),
                                margin: EdgeInsets.only(
                                    right: 0.02.sw, bottom: 0.02.sw, top: 5.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: GenShadow().genShadow(
                                        color: GenColor.shadowLigth,
                                        radius: 3.w,
                                        offset: Offset(0, 2.w)),
                                    color: Colors.white),
                                child: Center(
                                    child: GenText(
                                  e[widget.title],
                                  style: TextStyle(color: Colors.black54),
                                  textAlign: TextAlign.center,
                                )),
                              ));
                    }).toList(),
                  ),
                ],
              ),
            )
          : Container(
              width: double.infinity,
              child: Row(
                children: widget.listData.map<Widget>((e) {
                  int index = e[widget.id];

                  return widget.lineStyle
                      ? initValue == index
                          ? Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                margin: EdgeInsets.only(right: 20.w),
                                height: 80.h,
                                decoration: BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                      color: GenColor.primaryColor, width: 2),
                                )),
                                child: Center(
                                  child: GenText(
                                    e[widget.title],
                                    style:
                                        TextStyle(color: GenColor.primaryColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      initValue = e[widget.id];
                                      widget.value = {
                                        "id": e[widget.id],
                                      };
                                    });
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(10.w),
                                      margin: EdgeInsets.only(right: 20.w),
                                      height: 80.h,
                                      decoration: BoxDecoration(),
                                      child: Center(
                                        child: GenText(
                                          e[widget.title],
                                          style:
                                              TextStyle(color: Colors.black54),
                                          textAlign: TextAlign.center,
                                        ),
                                      ))),
                            )
                      : initValue == index
                          ? Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10.w),
                                margin:
                                    EdgeInsets.only(right: 20.w, bottom: 20.w),
                                height: 80.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: GenColor.primaryColor,
                                    boxShadow: GenShadow().genShadow(
                                        color: GenColor.shadowMed,
                                        radius: 3.w,
                                        offset: Offset(0, 2.w))),
                                child: Center(
                                  child: GenText(
                                    e[widget.title],
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      initValue = e[widget.id];
                                      widget.value = {
                                        "id": e[widget.id],
                                      };
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.w),
                                    margin: EdgeInsets.only(
                                        right: 20.w, bottom: 20.w),
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: GenShadow().genShadow(
                                            color: GenColor.shadowLigth,
                                            radius: 3.w,
                                            offset: Offset(0, 2.w)),
                                        color: Colors.white),
                                    child: Center(
                                        child: GenText(
                                      e[widget.title],
                                      style: TextStyle(color: Colors.black54),
                                      textAlign: TextAlign.center,
                                    )),
                                  )),
                            );
                }).toList(),
              ),
            ),
    );
  }
}

class GenRadioGroupMiniString extends StatefulWidget {
  final List listData;
  final String initValue;
  final Function ontap;
  final String id;
  final bool fitContent;
  final bool reverseColor;
  final EdgeInsets padding;
  final double radius;
  final double marginHorz;

  GenRadioGroupMiniString({
    @required this.listData,
    this.initValue = "",
    @required this.ontap,
    @required this.id,
    this.fitContent = false,
    this.padding,
    this.reverseColor = false,
    this.radius = 50,
    this.marginHorz,
  });

  set value(value) {
    ontap(value);
  }

  @override
  _GenRadioGroupMiniStringState createState() =>
      _GenRadioGroupMiniStringState();
}

class _GenRadioGroupMiniStringState extends State<GenRadioGroupMiniString> {
  var initValue = "";

  @override
  void initState() {
    // TODO: implement initState

    initValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: !widget.fitContent
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: GenDimen.sidePadding,
                  ),
                  Row(
                    children: widget.listData.map<Widget>((e) {
                      String index = e[widget.id];

                      return initValue == index
                          ? Container(
                              padding:
                                  widget.padding ?? EdgeInsets.all(0.03.sw),
                              margin: EdgeInsets.only(
                                  right: widget.marginHorz ?? 0.02.sw,
                                  bottom: widget.marginHorz ?? 0.02.sw,
                                  top: 10.w),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(widget.radius),
                                  color: widget.reverseColor
                                      ? Colors.white
                                      : GenColor.primaryColor,
                                  boxShadow: GenShadow().genShadow(
                                      color: GenColor.shadowMed,
                                      radius: widget.reverseColor ? 0 : 3.w,
                                      offset: Offset(0, 2.w))),
                              child: Center(
                                child: GenText(
                                  e[widget.id],
                                  style: TextStyle(
                                      color: widget.reverseColor
                                          ? GenColor.primaryColor
                                          : Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  print("id nya : " + e[widget.id].toString());
                                  initValue = e[widget.id].toString();
                                  widget.value = {
                                    "id": e[widget.id].toString(),
                                  };
                                });
                              },
                              child: Container(
                                padding:
                                    widget.padding ?? EdgeInsets.all(0.03.sw),
                                margin: EdgeInsets.only(
                                    right: widget.marginHorz ?? 0.02.sw,
                                    bottom: widget.marginHorz ?? 0.02.sw,
                                    top: 10.w),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(widget.radius),
                                    boxShadow: GenShadow().genShadow(
                                        color: GenColor.shadowLigth,
                                        radius: widget.reverseColor ? 0 : 3.w,
                                        offset: Offset(0, 2.w)),
                                    border: Border.all(
                                        color: widget.reverseColor
                                            ? Colors.white
                                            : Colors.transparent),
                                    color: widget.reverseColor
                                        ? GenColor.primaryColor
                                        : Colors.white),
                                child: Center(
                                    child: GenText(
                                  e[widget.id],
                                  style: TextStyle(
                                      color: widget.reverseColor
                                          ? Colors.white
                                          : Colors.black54),
                                  textAlign: TextAlign.center,
                                )),
                              ));
                    }).toList(),
                  ),
                ],
              ),
            )
          : Container(
              width: double.infinity,
              child: Row(
                children: widget.listData.map<Widget>((e) {
                  var index = e[widget.id];

                  return initValue == index
                      ? Expanded(
                          child: Container(
                            padding: EdgeInsets.all(0.03.sw),
                            margin: EdgeInsets.only(
                                right: 0.02.sw, bottom: 0.02.sw),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: GenColor.primaryColor,
                                boxShadow: GenShadow().genShadow(
                                    color: GenColor.shadowMed,
                                    radius: 3.w,
                                    offset: Offset(0, 2.w))),
                            child: Center(
                              child: GenText(
                                e[widget.id],
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  initValue = e[widget.id];
                                  widget.value = {
                                    "id": e[widget.id],
                                  };
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(0.03.sw),
                                margin: EdgeInsets.only(
                                    right: 0.02.sw, bottom: 0.02.sw),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: GenShadow().genShadow(
                                        color: GenColor.shadowLigth,
                                        radius: 3.w,
                                        offset: Offset(0, 2.w)),
                                    color: Colors.white),
                                child: Center(
                                    child: GenText(
                                  e[widget.id],
                                  style: TextStyle(color: Colors.black54),
                                  textAlign: TextAlign.center,
                                )),
                              )),
                        );
                }).toList(),
              ),
            ),
    );
  }
}

class GenRadioGroupMiniWrap extends StatefulWidget {
  final List listData;
  final String initValue;
  final Function ontap;
  final String id;
  final double fixWidth;
  final bool leftAlign;

  GenRadioGroupMiniWrap({
    @required this.listData,
    this.initValue = "",
    @required this.ontap,
    @required this.id,
    this.fixWidth,
    this.leftAlign = false,
  });

  set value(value) {
    ontap(value);
  }

  @override
  _GenRadioGroupMiniWrapState createState() => _GenRadioGroupMiniWrapState();
}

class _GenRadioGroupMiniWrapState extends State<GenRadioGroupMiniWrap> {
  var initValue = "";

  @override
  void initState() {
    // TODO: implement initState

    initValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Center(
          child: widget.fixWidth == null
              ? Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: widget.listData.map<Widget>((e) {
                    String index = e[widget.id];

                    return initValue == index
                        ? Container(
                            padding: EdgeInsets.all(0.03.sw),
                            margin: EdgeInsets.only(
                                right: 0.02.sw, bottom: 0.02.sw),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: GenColor.primaryColor,
                                boxShadow: GenShadow().genShadow(
                                    color: GenColor.shadowMed,
                                    radius: 3.w,
                                    offset: Offset(0, 2.w))),
                            child: Center(
                              child: GenText(
                                e[widget.id],
                                style: TextStyle(color: Colors.white),
                                textAlign: widget.leftAlign
                                    ? TextAlign.start
                                    : TextAlign.center,
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              setState(() {
                                initValue = e[widget.id];
                                widget.value = {
                                  "id": e[widget.id],
                                };
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(0.03.sw),
                              margin: EdgeInsets.only(
                                  right: 0.02.sw, bottom: 0.02.sw),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: GenShadow().genShadow(
                                      color: GenColor.shadowLigth,
                                      radius: 3.w,
                                      offset: Offset(0, 2.w)),
                                  color: Colors.white),
                              child: Center(
                                  child: GenText(
                                e[widget.id],
                                style: TextStyle(color: Colors.black54),
                                textAlign: widget.leftAlign
                                    ? TextAlign.start
                                    : TextAlign.center,
                              )),
                            ));
                  }).toList(),
                )
              : Container(
                  width: double.infinity,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: widget.listData.map<Widget>((e) {
                      String index = e[widget.id];

                      return initValue == index
                          ? Container(
                              padding: EdgeInsets.all(0.03.sw),
                              margin: EdgeInsets.only(
                                  left: 0.02.sw,
                                  right: 0.02.sw,
                                  bottom: 0.02.sw),
                              width: widget.fixWidth,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: GenColor.primaryColor,
                                  boxShadow: GenShadow().genShadow(
                                      color: GenColor.shadowMed,
                                      radius: 3.w,
                                      offset: Offset(0, 2.w))),
                              child: GenText(
                                e[widget.id],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                textAlign: widget.leftAlign
                                    ? TextAlign.start
                                    : TextAlign.center,
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  initValue = e[widget.id];
                                  widget.value = {
                                    "id": e[widget.id],
                                  };
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(0.03.sw),
                                margin: EdgeInsets.only(
                                    left: 0.02.sw,
                                    right: 0.02.sw,
                                    bottom: 0.02.sw),
                                width: widget.fixWidth,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: GenShadow().genShadow(
                                        color: GenColor.shadowLigth,
                                        radius: 3.w,
                                        offset: Offset(0, 2.w)),
                                    color: Colors.white),
                                child: GenText(
                                  e[widget.id],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                  textAlign: widget.leftAlign
                                      ? TextAlign.start
                                      : TextAlign.center,
                                ),
                              ));
                    }).toList(),
                  ),
                ),
        ));
  }
}

class GenRadioGroupMiniWrapRuangan extends StatefulWidget {
  final List listData;
  final int initValue;
  final Function ontap;
  final String id;
  final String title;
  final String status;
  final double fixWidth;
  final bool leftAlign;

  GenRadioGroupMiniWrapRuangan({
    @required this.listData,
    this.initValue = 0,
    @required this.title,
    this.status = "",
    @required this.ontap,
    @required this.id,
    this.fixWidth,
    this.leftAlign = false,
  });

  set value(value) {
    ontap(value);
  }

  @override
  _GenRadioGroupMiniWrapRuanganState createState() =>
      _GenRadioGroupMiniWrapRuanganState();
}

class _GenRadioGroupMiniWrapRuanganState
    extends State<GenRadioGroupMiniWrapRuangan> {
  int initValue = 0;

  @override
  void initState() {
    // TODO: implement initState

    initValue = widget.initValue.toInt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Center(
          child: Container(
            width: double.infinity,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: widget.listData.map<Widget>((e) {
                int index = e[widget.id];

                return initValue.toString() == index.toString()
                    ? Container(
                        padding: EdgeInsets.all(0.03.sw),
                        margin: EdgeInsets.only(
                            left: 0.02.sw, right: 0.02.sw, bottom: 0.02.sw),
                        width: widget.fixWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: GenColor.primaryColor,
                            boxShadow: GenShadow().genShadow(
                                color: GenColor.shadowMed,
                                radius: 3.w,
                                offset: Offset(0, 2.w))),
                        child: GenText(
                          e[widget.title],
                          style: TextStyle(color: Colors.white, fontSize: 15),
                          textAlign: widget.leftAlign
                              ? TextAlign.start
                              : TextAlign.center,
                        ),
                      )
                    : InkWell(
                        onTap: e[widget.status] == "full"
                            ? () {
                                toastShow("Ruangan ini sudah terpakai", context,
                                    GenColor.red);
                              }
                            : () {
                                setState(() {
                                  initValue = e[widget.id];
                                  widget.value = {
                                    "id": e[widget.id],
                                  };
                                });
                              },
                        child: Container(
                          padding: EdgeInsets.all(0.03.sw),
                          margin: EdgeInsets.only(
                              left: 0.02.sw, right: 0.02.sw, bottom: 0.02.sw),
                          width: widget.fixWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: GenShadow().genShadow(
                                  color: GenColor.shadowLigth,
                                  radius: 3.w,
                                  offset: Offset(0, 2.w)),
                              color: e[widget.status] == "full"
                                  ? Colors.grey
                                  : Colors.white),
                          child: GenText(
                            e[widget.title],
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                            textAlign: widget.leftAlign
                                ? TextAlign.start
                                : TextAlign.center,
                          ),
                        ));
              }).toList(),
            ),
          ),
        ));
  }
}

class GenRadioGroupMiniWrapJam extends StatefulWidget {
  final List listData;
  final String initValue;
  final Function ontap;
  final String id;
  final double fixWidth;
  final bool leftAlign;

  GenRadioGroupMiniWrapJam({
    @required this.listData,
    this.initValue = "",
    @required this.ontap,
    @required this.id,
    this.fixWidth,
    this.leftAlign = false,
  });

  set value(value) {
    ontap(value);
  }

  @override
  _GenRadioGroupMiniWrapJamState createState() =>
      _GenRadioGroupMiniWrapJamState();
}

class _GenRadioGroupMiniWrapJamState extends State<GenRadioGroupMiniWrapJam> {
  var initValue = "";

  @override
  void initState() {
    // TODO: implement initState

    initValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Center(
          child: widget.fixWidth == null
              ? Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: widget.listData.map<Widget>((e) {
                    String index = e[widget.id];

                    return initValue == index
                        ? Container(
                            padding: EdgeInsets.all(0.03.sw),
                            margin: EdgeInsets.only(
                                right: 0.02.sw, bottom: 0.02.sw),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: GenColor.primaryColor,
                                boxShadow: GenShadow().genShadow(
                                    color: GenColor.shadowMed,
                                    radius: 3.w,
                                    offset: Offset(0, 2.w))),
                            child: Center(
                              child: GenText(
                                e[widget.id],
                                style: TextStyle(color: Colors.white),
                                textAlign: widget.leftAlign
                                    ? TextAlign.start
                                    : TextAlign.center,
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: e['aktiv'] == '0'
                                ? () {}
                                : () {
                                    setState(() {
                                      initValue = e[widget.id];
                                      widget.value = {
                                        "id": e[widget.id],
                                      };
                                    });
                                  },
                            child: Container(
                              padding: EdgeInsets.all(0.03.sw),
                              margin: EdgeInsets.only(
                                  right: 0.02.sw, bottom: 0.02.sw),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: GenShadow().genShadow(
                                      color: GenColor.shadowLigth,
                                      radius: 3.w,
                                      offset: Offset(0, 2.w)),
                                  color: Colors.white),
                              child: Center(
                                  child: GenText(
                                e[widget.id],
                                style: TextStyle(color: Colors.black54),
                                textAlign: widget.leftAlign
                                    ? TextAlign.start
                                    : TextAlign.center,
                              )),
                            ));
                  }).toList(),
                )
              : Container(
                  width: double.infinity,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: widget.listData.map<Widget>((e) {
                      String index = e[widget.id];
                      if (e['aktiv'] == '0') {
                        index = '';
                      }

                      return initValue == index
                          ? Container(
                              padding: EdgeInsets.all(0.03.sw),
                              margin: EdgeInsets.only(
                                  left: 0.02.sw,
                                  right: 0.02.sw,
                                  bottom: 0.02.sw),
                              width: widget.fixWidth,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: GenColor.primaryColor,
                                  boxShadow: GenShadow().genShadow(
                                      color: GenColor.shadowMed,
                                      radius: 3.w,
                                      offset: Offset(0, 2.w))),
                              child: GenText(
                                e[widget.id],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                textAlign: widget.leftAlign
                                    ? TextAlign.start
                                    : TextAlign.center,
                              ),
                            )
                          : InkWell(
                              onTap: e['aktiv'] == '0'
                                  ? () {}
                                  : () {
                                      setState(() {
                                        initValue = e[widget.id];
                                        widget.value = {
                                          "id": e[widget.id],
                                        };
                                      });
                                    },
                              child: Container(
                                padding: EdgeInsets.all(0.03.sw),
                                margin: EdgeInsets.only(
                                    left: 0.02.sw,
                                    right: 0.02.sw,
                                    bottom: 0.02.sw),
                                width: widget.fixWidth,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: GenShadow().genShadow(
                                        color: GenColor.shadowLigth,
                                        radius: 3.w,
                                        offset: Offset(0, 2.w)),
                                    color: e['aktiv'] == '0'
                                        ? Colors.white38
                                        : Colors.white),
                                child: GenText(
                                  e[widget.id],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 20),
                                  textAlign: widget.leftAlign
                                      ? TextAlign.start
                                      : TextAlign.center,
                                ),
                              ));
                    }).toList(),
                  ),
                ),
        ));
  }
}

class GenRadioGroupMiniWrapTentor extends StatefulWidget {
  final List listData;
  final String initValue;
  final Function ontap;
  final String id;
  final int day;
  final String title;
  final double fixWidth;
  final bool leftAlign, disabled;

  GenRadioGroupMiniWrapTentor({
    @required this.listData,
    this.initValue = "",
    @required this.ontap,
    @required this.id,
    this.fixWidth,
    this.leftAlign = false,
    this.title,
    this.day,
    this.disabled = false,
  });

  set value(value) {
    ontap(value);
  }

  @override
  _GenRadioGroupMiniWrapTentorState createState() =>
      _GenRadioGroupMiniWrapTentorState();
}

class _GenRadioGroupMiniWrapTentorState
    extends State<GenRadioGroupMiniWrapTentor> {
  var initValue = '';

  @override
  void initState() {
    // TODO: implement initState

    initValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Center(
          child: widget.fixWidth == null
              ? Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: widget.listData.map<Widget>((e) {
                    var index = e[widget.id];
                    if (e['day'] == widget.day) {
                      return initValue == index
                          ? Container(
                              padding: EdgeInsets.all(0.03.sw),
                              margin: EdgeInsets.only(
                                  right: 0.02.sw, bottom: 0.02.sw),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: GenColor.primaryColor,
                                  boxShadow: GenShadow().genShadow(
                                      color: GenColor.shadowMed,
                                      radius: 3.w,
                                      offset: Offset(0, 2.w))),
                              child: Center(
                                child: GenText(
                                  formatJamFromStringGMT(
                                      e[widget.title].toString()),
                                  style: TextStyle(color: Colors.white),
                                  textAlign: widget.leftAlign
                                      ? TextAlign.start
                                      : TextAlign.center,
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: widget.disabled
                                  ? () {}
                                  : () {
                                      setState(() {
                                        initValue = e[widget.id];
                                        widget.value = {
                                          "id": e[widget.id].toString(),
                                          "title": e[widget.title].toString(),
                                        };
                                      });
                                    },
                              child: Container(
                                padding: EdgeInsets.all(0.03.sw),
                                margin: EdgeInsets.only(
                                    right: 0.02.sw, bottom: 0.02.sw),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: GenShadow().genShadow(
                                        color: GenColor.shadowLigth,
                                        radius: 3.w,
                                        offset: Offset(0, 2.w)),
                                    color: Colors.white),
                                child: Center(
                                    child: GenText(
                                  e[widget.title].toString(),
                                  style: TextStyle(color: Colors.black54),
                                  textAlign: widget.leftAlign
                                      ? TextAlign.start
                                      : TextAlign.center,
                                )),
                              ));
                    }
                    return Center(
                        child: GenText("Tidak ada jadwal pada hari ini"));
                  }).toList(),
                )
              : Container(
                  width: double.infinity,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: widget.listData.map<Widget>((e) {
                      String index = e[widget.id].toString();
                      if (e['day'] == widget.day) {
                        if (e['day'] == null) {
                          return Center(
                              child: GenText("Tidak ada jadwal pada hari ini"));
                        }
                        return initValue == index
                            ? Container(
                                padding: EdgeInsets.all(0.03.sw),
                                margin: EdgeInsets.only(
                                    left: 0.02.sw,
                                    right: 0.02.sw,
                                    bottom: 0.02.sw),
                                width: widget.fixWidth,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: GenColor.primaryColor,
                                    boxShadow: GenShadow().genShadow(
                                        color: GenColor.shadowMed,
                                        radius: 3.w,
                                        offset: Offset(0, 2.w))),
                                child: GenText(
                                  formatJamFromStringGMT(
                                      e[widget.title].toString()),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  textAlign: widget.leftAlign
                                      ? TextAlign.start
                                      : TextAlign.center,
                                ),
                              )
                            : InkWell(
                                onTap: widget.disabled
                                    ? () {}
                                    : () {
                                        setState(() {
                                          initValue = e[widget.id].toString();
                                          widget.value = {
                                            "id": e[widget.id].toString(),
                                            "title": e[widget.title].toString(),
                                          };
                                        });
                                      },
                                child: Container(
                                  padding: EdgeInsets.all(0.03.sw),
                                  margin: EdgeInsets.only(
                                      left: 0.02.sw,
                                      right: 0.02.sw,
                                      bottom: 0.02.sw),
                                  width: widget.fixWidth,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: GenShadow().genShadow(
                                          color: GenColor.shadowLigth,
                                          radius: 3.w,
                                          offset: Offset(0, 2.w)),
                                      color: Colors.white),
                                  child: GenText(
                                    formatJamFromStringGMT(
                                        e[widget.title].toString()),
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 20),
                                    textAlign: widget.leftAlign
                                        ? TextAlign.start
                                        : TextAlign.center,
                                  ),
                                ));
                      }
                      return Center(
                          child: GenText("Tidak ada jadwal pada hari ini"));
                    }).toList(),
                  ),
                ),
        ));
  }
}

class GenRadioGroupMiniWrapTentorAll extends StatefulWidget {
  final List listData;
  final String initValue;
  final Function ontap;
  final String id;
  final int day;
  final String title;
  final bool leftAlign, disabled;

  GenRadioGroupMiniWrapTentorAll({
    @required this.listData,
    this.initValue = "",
    @required this.ontap,
    @required this.id,
    this.leftAlign = false,
    this.title,
    this.day,
    this.disabled = false,
  });

  set value(value) {
    ontap(value);
  }

  @override
  _GenRadioGroupMiniWrapTentorAllState createState() =>
      _GenRadioGroupMiniWrapTentorAllState();
}

class _GenRadioGroupMiniWrapTentorAllState
    extends State<GenRadioGroupMiniWrapTentorAll> {
  var initValue = '';

  @override
  void initState() {
    // TODO: implement initState

    initValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor;

    return Container(
        width: double.infinity,
        child: Center(
            child: Wrap(
                children: widget.listData.map<Widget>((e) {
          if (e["day"] == widget.day) {
            if (e["isAktif"]) {
              bgColor = Colors.white;
            } else {
              bgColor = Colors.grey;
            }

            return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: GenShadow().genShadow(),
                    color: bgColor),
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.w),
                margin: EdgeInsets.all(10.w),
                child: GenText(
                  e["time"],
                  style: TextStyle(backgroundColor: bgColor),
                ));
          }
          return Container();
        }).toList())));
  }
}

class GenRadioGroupMiniBerlangganan extends StatefulWidget {
  final List listData;
  final int initValue, diskonNominal;
  final Function ontap;
  final String id, pertemuan, diskon, hargaCoret, harga;
  final bool fitContent;

  GenRadioGroupMiniBerlangganan({
    @required this.listData,
    this.initValue = 0,
    @required this.ontap,
    @required this.id,
    this.fitContent = false,
    this.pertemuan,
    this.diskon,
    this.hargaCoret,
    this.harga,
    this.diskonNominal,
  });

  set value(value) {
    ontap(value);
  }

  @override
  _GenRadioGroupMiniBerlanggananState createState() =>
      _GenRadioGroupMiniBerlanggananState();
}

class _GenRadioGroupMiniBerlanggananState
    extends State<GenRadioGroupMiniBerlangganan> {
  var initValue = 0;

  @override
  void initState() {
    // TODO: implement initState

    initValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !widget.fitContent
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.listData.map<Widget>((e) {
                  int index = e[widget.id];
                  print('harga berlangganan');
                  print(e);
                  return widget.initValue == index
                      ? Container(
                          padding: EdgeInsets.all(0.03.sw),
                          margin: EdgeInsets.only(
                              left: 0.02.sw,
                              right: 0.02.sw,
                              bottom: 0.02.sw,
                              top: 5.w),
                          width: 0.38.sw,
                          height: 300.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: GenShadow().genShadow(
                                  color: GenColor.shadowLigth,
                                  radius: 3.w,
                                  offset: Offset(0, 2.w)),
                              color: GenColor.primaryColor),
                          child: Column(
                            children: <Widget>[
                              GenText(
                                e[widget.pertemuan],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              GenText(
                                e[widget.diskon] == '0 %'
                                    ? ""
                                    : e[widget.diskon] == ''
                                        ? ""
                                        : "Diskon " + e[widget.diskon],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              GenText(
                                e[widget.hargaCoret] == null
                                    ? ""
                                    : e[widget.hargaCoret] == e[widget.harga] ||
                                            e[widget.hargaCoret] == '0'
                                        ? ""
                                        : formatRupiahUseprefik(
                                            e[widget.hargaCoret]),
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              GenText(
                                formatRupiahUseprefik(e[widget.harga]) ?? "",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 28),
                              ),
                              GenText(
                                "Per Bulan",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              initValue = e[widget.id];
                              widget.value = {
                                "id": e[widget.id],
                                "harga": e[widget.harga],
                                "pertemuan": e[widget.pertemuan],
                                "diskon": e[widget.diskon],
                                "hargaAsli": e[widget.hargaCoret],
                                "diskonNominal": e[widget.diskonNominal],
                              };
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(0.03.sw),
                            margin: EdgeInsets.only(
                                left: 0.02.sw,
                                right: 0.02.sw,
                                bottom: 0.02.sw,
                                top: 5.w),
                            width: 0.38.sw,
                            height: 300.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: GenShadow().genShadow(
                                    color: GenColor.shadowLigth,
                                    radius: 3.w,
                                    offset: Offset(0, 2.w)),
                                color: Colors.white),
                            child: Column(
                              children: <Widget>[
                                GenText(
                                  e[widget.pertemuan],
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                GenText(
                                  e[widget.diskon] == '0 %'
                                      ? ""
                                      : e[widget.diskon] == ''
                                          ? ""
                                          : "Diskon " + e[widget.diskon],
                                  style: TextStyle(
                                      color: GenColor.accentColor,
                                      fontSize: 25),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                GenText(
                                  e[widget.hargaCoret] == null
                                      ? ""
                                      : e[widget.hargaCoret] ==
                                                  e[widget.harga] ||
                                              e[widget.hargaCoret] == '0'
                                          ? ""
                                          : formatRupiahUseprefik(
                                              e[widget.hargaCoret]),
                                  style: TextStyle(
                                      color: Colors.black54,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                GenText(
                                  formatRupiahUseprefik(e[widget.harga]) ?? "",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 28),
                                ),
                                GenText(
                                  "Per Bulan",
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ],
                            ),
                          ));
                }).toList(),
              ),
            )
          : Container(
              width: double.infinity,
              child: Row(
                children: widget.listData.map<Widget>((e) {
                  int index = e[widget.id];

                  return widget.initValue == index
                      ? Expanded(
                          child: Container(
                            padding: EdgeInsets.all(0.03.sw),
                            margin: EdgeInsets.only(
                                right: 0.02.sw, bottom: 0.02.sw),
                            width: 0.20.sw,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: GenColor.primaryColor,
                                boxShadow: GenShadow().genShadow(
                                    color: GenColor.shadowMed,
                                    radius: 3.w,
                                    offset: Offset(0, 2.w))),
                            child: Center(
                              child: GenText(
                                e[widget.pertemuan],
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  initValue = e[widget.id];
                                  widget.value = {
                                    "id": e[widget.id],
                                    "harga": e[widget.harga],
                                    "pertemuan": e[widget.pertemuan],
                                  };
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(10.w),
                                margin:
                                    EdgeInsets.only(right: 20.w, bottom: 20.w),
                                height: 80.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: GenShadow().genShadow(
                                        color: GenColor.shadowLigth,
                                        radius: 3.w,
                                        offset: Offset(0, 2.w)),
                                    color: Colors.white),
                                child: Center(
                                    child: GenText(
                                  e[widget.pertemuan],
                                  style: TextStyle(color: Colors.black54),
                                  textAlign: TextAlign.center,
                                )),
                              )),
                        );
                }).toList(),
              ),
            ),
    );
  }
}

class GenRadioGroupMiniGrade extends StatefulWidget {
  final List listData;
  final List listGrade;
  final String initValue;
  final Function ontap;
  final String name;
  final String id;
  final String grade;
  final double fixWidth;

  GenRadioGroupMiniGrade({
    @required this.listData,
    @required this.listGrade,
    this.initValue,
    @required this.ontap,
    @required this.id,
    @required this.grade,
    this.fixWidth,
    this.name,
  });

  set value(value) {
    ontap(value);
  }

  @override
  _GenRadioGroupMiniGradeState createState() => _GenRadioGroupMiniGradeState();
}

class _GenRadioGroupMiniGradeState extends State<GenRadioGroupMiniGrade> {
  var initValue;

  @override
  void initState() {
    // TODO: implement initState

    initValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Center(
          child: widget.fixWidth == null
              ? Wrap(
                  children: widget.listData.map<Widget>((e) {
                    String index = e[widget.id];

                    return initValue == index
                        ? Container(
                            padding: EdgeInsets.all(0.03.sw),
                            margin: EdgeInsets.only(
                                right: 0.02.sw, bottom: 0.02.sw),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: GenColor.primaryColor,
                                boxShadow: GenShadow().genShadow(
                                    color: GenColor.shadowMed,
                                    radius: 3.w,
                                    offset: Offset(0, 2.w))),
                            child: Center(
                              child: GenText(
                                e[widget.id],
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              setState(() {
                                initValue = e[widget.id];
                                widget.value = {
                                  "id": e[widget.id],
                                };
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(0.03.sw),
                              margin: EdgeInsets.only(
                                  right: 0.02.sw, bottom: 0.02.sw),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: GenShadow().genShadow(
                                      color: GenColor.shadowLigth,
                                      radius: 3.w,
                                      offset: Offset(0, 2.w)),
                                  color: Colors.white),
                              child: Center(
                                  child: GenText(
                                e[widget.id],
                                style: TextStyle(color: Colors.black54),
                                textAlign: TextAlign.center,
                              )),
                            ));
                  }).toList(),
                )
              : Container(
                  width: double.infinity,
                  child: Column(
                    children: widget.listGrade.map<Widget>((e) {
                      String grade = e[widget.grade];

                      return Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: double.infinity,
                            padding:
                                EdgeInsets.only(left: GenDimen.sidePadding),
                            child: GenText(
                              grade,
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: double.infinity,
                            child: Wrap(
                              children: widget.listData.map<Widget>((a) {
                                var index = a[widget.id];

                                if (a[widget.grade] == grade) {
                                  return initValue == index
                                      ? Container(
                                          padding: EdgeInsets.all(0.03.sw),
                                          margin: EdgeInsets.only(
                                              left: 0.02.sw,
                                              right: 0.02.sw,
                                              bottom: 0.02.sw),
                                          width: widget.fixWidth,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: GenColor.primaryColor,
                                              boxShadow: GenShadow().genShadow(
                                                  color: GenColor.shadowMed,
                                                  radius: 3.w,
                                                  offset: Offset(0, 2.w))),
                                          child: Center(
                                            child: GenText(
                                              a[widget.name],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            setState(() {
                                              initValue = a[widget.id];
                                              widget.value = {
                                                "id": a[widget.id],
                                                "level": a["level"],
                                                "levelName": a["grade"],
                                                "className": a["name"]
                                              };
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(0.03.sw),
                                            margin: EdgeInsets.only(
                                                left: 0.02.sw,
                                                right: 0.02.sw,
                                                bottom: 0.02.sw),
                                            width: widget.fixWidth,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                boxShadow: GenShadow()
                                                    .genShadow(
                                                        color: GenColor
                                                            .shadowLigth,
                                                        radius: 3.w,
                                                        offset: Offset(0, 2.w)),
                                                color: Colors.white),
                                            child: Center(
                                                child: GenText(
                                              a[widget.name],
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 20),
                                              textAlign: TextAlign.center,
                                            )),
                                          ));
                                } else {
                                  return Container();
                                }
                              }).toList(),
                            ),
                          )
                        ],
                      );
                    }).toList(),
                  ),
                ),
        ));
  }
}

class GenRadioGroupMiniFlexible extends StatefulWidget {
  final List listData;
  final int initValue;
  final Function ontap;
  final String id, title;
  final bool fitContent;
  final bool lineStyle;
  final double initPadding;
  final EdgeInsets padding;

  GenRadioGroupMiniFlexible(
      {@required this.listData,
      this.initValue = 0,
      @required this.ontap,
      this.title,
      @required this.id,
      this.fitContent = false,
      this.lineStyle = false,
      this.initPadding = 0,
      this.padding});

  set value(value) {
    ontap(value);
  }

  @override
  _GenRadioGroupMiniFlexibleState createState() =>
      _GenRadioGroupMiniFlexibleState();
}

class _GenRadioGroupMiniFlexibleState extends State<GenRadioGroupMiniFlexible> {
  var initValue = 0;

  @override
  void initState() {
    // TODO: implement initState

    initValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: !widget.fitContent
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: widget.initPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: widget.listData.map<Widget>((e) {
                      int index = e[widget.id];

                      return widget.initValue == index
                          ? Container(
                              padding:
                                  widget.padding ?? EdgeInsets.all(0.03.sw),
                              margin: EdgeInsets.only(
                                  right: 0.02.sw, bottom: 0.02.sw, top: 5.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: GenColor.primaryColor,
                                  boxShadow: GenShadow().genShadow(
                                      color: GenColor.shadowMed,
                                      radius: 3.w,
                                      offset: Offset(0, 2.w))),
                              child: Center(
                                child: GenText(
                                  e[widget.title],
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  initValue = e[widget.id];
                                  widget.value = {
                                    "id": e[widget.id],
                                  };
                                });
                              },
                              child: Container(
                                padding:
                                    widget.padding ?? EdgeInsets.all(0.03.sw),
                                margin: EdgeInsets.only(
                                    right: 0.02.sw, bottom: 0.02.sw, top: 5.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: GenShadow().genShadow(
                                        color: GenColor.shadowLigth,
                                        radius: 3.w,
                                        offset: Offset(0, 2.w)),
                                    color: e["answered"] != null
                                        ? GenColor.primaryColorLight
                                        : Colors.white),
                                child: Center(
                                    child: GenText(
                                  e[widget.title],
                                  style: TextStyle(color: Colors.black54),
                                  textAlign: TextAlign.center,
                                )),
                              ));
                    }).toList(),
                  ),
                ],
              ),
            )
          : Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: widget.listData.map<Widget>((e) {
                  int index = e[widget.id];

                  return widget.lineStyle
                      ? initValue == index
                          ? Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                margin: EdgeInsets.only(right: 20.w),
                                height: 80.h,
                                decoration: BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                      color: GenColor.primaryColor, width: 2),
                                )),
                                child: Center(
                                  child: GenText(
                                    e[widget.title],
                                    style:
                                        TextStyle(color: GenColor.primaryColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      initValue = e[widget.id];
                                      widget.value = {
                                        "id": e[widget.id],
                                      };
                                    });
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(10.w),
                                      margin: EdgeInsets.only(right: 20.w),
                                      height: 80.h,
                                      decoration: BoxDecoration(),
                                      child: Center(
                                        child: GenText(
                                          e[widget.title],
                                          style:
                                              TextStyle(color: Colors.black54),
                                          textAlign: TextAlign.center,
                                        ),
                                      ))),
                            )
                      : initValue == index
                          ? Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10.w),
                                margin:
                                    EdgeInsets.only(right: 20.w, bottom: 20.w),
                                height: 80.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: GenColor.primaryColor,
                                    boxShadow: GenShadow().genShadow(
                                        color: GenColor.shadowMed,
                                        radius: 3.w,
                                        offset: Offset(0, 2.w))),
                                child: Center(
                                  child: GenText(
                                    e[widget.title],
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      initValue = e[widget.id];
                                      widget.value = {
                                        "id": e[widget.id],
                                      };
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.w),
                                    margin: EdgeInsets.only(
                                        right: 20.w, bottom: 20.w),
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: GenShadow().genShadow(
                                            color: GenColor.shadowLigth,
                                            radius: 3.w,
                                            offset: Offset(0, 2.w)),
                                        color: e["answered"] != null
                                            ? GenColor.primaryColorLight
                                            : Colors.white),
                                    child: Center(
                                        child: GenText(
                                      e[widget.title],
                                      style: TextStyle(color: Colors.black54),
                                      textAlign: TextAlign.center,
                                    )),
                                  )),
                            );
                }).toList(),
              ),
            ),
    );
  }
}

class GenRadioGroupMiniWrapFlexible extends StatefulWidget {
  final List listData;
  final int initValue;
  final Function ontap;
  final String id;
  final double fixWidth;

  final String title;
  final double initPadding;
  final EdgeInsets padding;

  GenRadioGroupMiniWrapFlexible({
    @required this.listData,
    this.initValue = 1,
    @required this.ontap,
    @required this.id,
    this.fixWidth,
    this.title,
    this.initPadding,
    this.padding,
  });

  set value(value) {
    ontap(value);
  }

  @override
  _GenRadioGroupMiniWrapFlexibleState createState() =>
      _GenRadioGroupMiniWrapFlexibleState();
}

class _GenRadioGroupMiniWrapFlexibleState
    extends State<GenRadioGroupMiniWrapFlexible> {
  var initValue = 1;

  @override
  void initState() {
    // TODO: implement initState

    initValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: widget.fixWidth == null
            ? Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: widget.listData.map<Widget>((e) {
                  int index = e[widget.id];

                  return widget.initValue == index
                      ? Container(
                          padding: widget.padding ?? EdgeInsets.all(0.03.sw),
                          margin: EdgeInsets.only(
                              right: 0.02.sw, bottom: 0.02.sw, top: 5.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: GenColor.primaryColor,
                              boxShadow: GenShadow().genShadow(
                                  color: GenColor.shadowMed,
                                  radius: 3.w,
                                  offset: Offset(0, 2.w))),
                          child: Center(
                            child: GenText(
                              e[widget.title],
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              initValue = e[widget.id];
                              widget.value = {
                                "id": e[widget.id],
                              };
                            });
                          },
                          child: Container(
                            padding: widget.padding ?? EdgeInsets.all(0.03.sw),
                            margin: EdgeInsets.only(
                                right: 0.02.sw, bottom: 0.02.sw, top: 5.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: GenShadow().genShadow(
                                    color: GenColor.shadowLigth,
                                    radius: 3.w,
                                    offset: Offset(0, 2.w)),
                                color: e["answered"] != null
                                    ? GenColor.primaryColorLight
                                    : Colors.white),
                            child: Center(
                                child: GenText(
                              e[widget.title],
                              style: TextStyle(color: Colors.black54),
                              textAlign: TextAlign.center,
                            )),
                          ));
                }).toList(),
              )
            : Container(
                width: double.infinity,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: widget.listData.map<Widget>((e) {
                    int index = e[widget.id];

                    return initValue == index
                        ? Stack(
                            children: [
                              Container(
                                width: widget.fixWidth,
                                height: widget.fixWidth,
                                padding:
                                    widget.padding ?? EdgeInsets.all(0.03.sw),
                                margin: EdgeInsets.only(
                                    right: 0.02.sw, bottom: 0.02.sw, top: 5.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: GenColor.primaryColor,
                                    boxShadow: GenShadow().genShadow(
                                        color: GenColor.shadowMed,
                                        radius: 3.w,
                                        offset: Offset(0, 2.w))),
                              ),
                              Container(
                                width: widget.fixWidth,
                                height: widget.fixWidth,
                                child: Center(
                                  child: GenText(
                                    e[widget.title],
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : InkWell(
                            onTap: () {
                              setState(() {
                                initValue = e[widget.id];
                                widget.value = {
                                  "id": e[widget.id],
                                };
                              });
                            },
                            child: Stack(
                              children: [
                                Container(
                                    width: widget.fixWidth,
                                    height: widget.fixWidth,
                                    padding: widget.padding ??
                                        EdgeInsets.all(0.03.sw),
                                    margin: EdgeInsets.only(
                                        right: 0.02.sw,
                                        bottom: 0.02.sw,
                                        top: 5.h),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: GenShadow().genShadow(
                                            color: GenColor.shadowLigth,
                                            radius: 3.w,
                                            offset: Offset(0, 2.w)),
                                        color: e["answered"] != null
                                            ? GenColor.primaryColorLight
                                            : Colors.white)),
                                Container(
                                  width: widget.fixWidth,
                                  height: widget.fixWidth,
                                  child: Center(
                                    child: GenText(
                                      e[widget.title],
                                      style: TextStyle(color: Colors.black54),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ));
                  }).toList(),
                ),
              ));
  }
}
